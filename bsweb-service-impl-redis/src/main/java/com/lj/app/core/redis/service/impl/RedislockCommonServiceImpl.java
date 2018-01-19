package com.lj.app.core.redis.service.impl;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.redis.service.RedisService;
import com.lj.app.core.redis.service.RedislockCommonService;

import redis.clients.jedis.Jedis;

@Service("redislockCommonService")
public class RedislockCommonServiceImpl implements RedislockCommonService {

  private static Log LOGGER = LogFactory.getLog(RedislockCommonServiceImpl.class);
  private static final int DEFAULT_SINGLE_EXPIRE_TIME = 1;
  // private static final int DEFAULT_BATCH_EXPIRE_TIME = 6;
  private static final long Wait_Time_Out = 500L;
  private static final long Time_Out = 500L;
  private static JedisConnectionFactory Jedis_Connection_Factory;
  @Autowired
  private RedisTemplate<?, ?> redisTemplate;
  @Resource
  public RedisService redisService;

  @SuppressWarnings({ "unchecked", "rawtypes" })
  @Override
  public boolean tryLock(String _key) {
    boolean result = false;
    final byte[] key = _key.getBytes();
    final byte[] value = StringUtil.object2Byte(_key);
    result = (Boolean) redisTemplate.execute(new RedisCallback() {

      @Override
      public Object doInRedis(RedisConnection connection) throws DataAccessException {
        try {
          long nano = System.currentTimeMillis();// 毫秒
          do {
            boolean isDo = connection.setNX(key, value);
            if (isDo) {
              connection.expire(key, DEFAULT_SINGLE_EXPIRE_TIME);
              return Boolean.TRUE;
            }
            Thread.sleep(100);
          } while ((System.currentTimeMillis() - nano) < Wait_Time_Out);
          return Boolean.FALSE;
        } catch (Exception e) {
          return Boolean.FALSE;
        }
      }

    });

    return result;
  }

  @Override
  public void unLock(String keys) {
    redisService.del(keys);
  }

  @SuppressWarnings({ "unchecked", "rawtypes" })
  @Override
  public boolean tryLock(String _key, final int expire) {
    boolean result = false;
    final byte[] key = _key.getBytes();
    final byte[] value = StringUtil.object2Byte(_key);
    result = (Boolean) redisTemplate.execute(new RedisCallback() {

      @Override
      public Object doInRedis(RedisConnection connection) throws DataAccessException {
        try {
          long nano = System.currentTimeMillis();// 毫秒
          do {
            boolean isDo = connection.setNX(key, value);
            if (isDo) {
              connection.expire(key, expire <= 0 ? DEFAULT_SINGLE_EXPIRE_TIME : expire);
              return Boolean.TRUE;
            }
            Thread.sleep(100);
          } while ((System.currentTimeMillis() - nano) < Time_Out);
          return Boolean.FALSE;
        } catch (Exception e) {
          return Boolean.FALSE;
        }
      }

    });

    return result;
  }

  /**
   * 如果锁空闲立即返回 获取失败 一直等待
   * 
   * @see com.fx.platform.components.lock.IBillLockHandler#lock(com.fx.platform.components.lock.IBillIdentify)
   * @param billIdentify
   */
  @SuppressWarnings({ "unchecked", "rawtypes" })
  @Override
  public void lock(String _key, final int expire) {
    final byte[] key = _key.getBytes();
    final byte[] value = StringUtil.object2Byte(_key);
    redisTemplate.execute(new RedisCallback() {

      @Override
      public Object doInRedis(RedisConnection connection) throws DataAccessException {
        try {
          long nano = System.currentTimeMillis();// 毫秒
          do {
            boolean isDo = connection.setNX(key, value);
            if (isDo) {
              connection.expire(key, expire <= 0 ? DEFAULT_SINGLE_EXPIRE_TIME : expire);
              return Boolean.TRUE;
            }
            Thread.sleep(100);
          } while ((System.currentTimeMillis() - nano) < Time_Out);
          return Boolean.FALSE;
        } catch (Exception e) {
          return Boolean.FALSE;
        }
      }

    });
  }

  @Override
  public void unLock(String... keys) {
    redisService.del(keys);
  }

  /**
   * 判断锁是否存在 如果锁空闲 立即返回1 否则被锁住
   * 
   * @param key
   * @return
   */
  @Override
  public Boolean querryLock(String key) {
    return redisService.exists(key);
  }

  /**
   * 通过SETNX试图获取一个锁
   * 
   * @param key
   * @param expire
   *          存活时间(秒)
   * @return
   */
  @Override
  public Boolean acquireLock(String key, final long expire) {
    final byte[] _key = key.getBytes();
    return redisTemplate.execute(new RedisCallback<Boolean>() {

      @Override
      public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
        try {
          Long value = System.currentTimeMillis() + (expire * 1000) + 1;
          byte[] _value = StringUtil.object2Byte(value);
          boolean isDo = connection.setNX(_key, _value);
          if (isDo) { // SETNX成功，则成功获取一个锁
            if (expire > 0) {
              connection.expire(_key, expire);
            }
            return Boolean.TRUE;
          } else { // SETNX失败，说明锁仍然被其他对象保持，检查其是否已经超时
            Long oldValue = (Long) StringUtil.byte2Object(connection.get(_key));
            if (oldValue.longValue() < System.currentTimeMillis()) { // 超时
              Long getValue = (Long) StringUtil.byte2Object(connection.getSet(_key, _value));
              if (getValue.longValue() == oldValue.longValue()) { // 获取锁成功
                return Boolean.TRUE;
              } else { // 已被其他进程捷足先登了
                return Boolean.FALSE;
              }
            } else { // 未超时，则直接返回失败
              return Boolean.FALSE;
            }
          }
        } catch (Exception e) {
          LOGGER.error(e.getMessage(), e);
          return Boolean.FALSE;
        }
      }

    });
  }

  /**
   * 释放锁
   * 
   * @param key
   */
  @Override
  public void releaseLock(String key) {
    final byte[] _key = key.getBytes();
    redisTemplate.execute(new RedisCallback<Object>() {

      @Override
      public Object doInRedis(RedisConnection connection) throws DataAccessException {
        byte[] value = connection.get(_key);
        if (value == null) {
          return null;
        }
        Long getValue = (Long) StringUtil.byte2Object(value);
        // 避免删除非自己获取得到的锁
        if (System.currentTimeMillis() < getValue.longValue()) {
          connection.del(_key);
        }

        return null;
      }

    });
  }

  /**
   * 获取Jedis对象
   * 
   * @return
   */
  @SuppressWarnings("unused")
  private Jedis getJedis() {
    try {
      if (Jedis_Connection_Factory == null) {
        Jedis_Connection_Factory = (JedisConnectionFactory) redisTemplate.getConnectionFactory();
      }
      return Jedis_Connection_Factory.getConnection().getNativeConnection();

    } catch (Exception e) {
      LOGGER.error("获取Jedis对象失败");
      LOGGER.error(e.getMessage(), e);
      return null;
    }
  }

  /**
   * 释放资源
   */
  @SuppressWarnings("unused")
  private void returnResource(Jedis jedis) {
    if (jedis == null)
      return;
    try {
      jedis.quit();
    } catch (Exception e) {
      LOGGER.error(e.getMessage(), e);
    }
    try {
      jedis.disconnect();
    } catch (Exception e) {
      LOGGER.error(e.getMessage(), e);
    }
  }

  /**
   * 检查超时，超时释放锁
   */
  @SuppressWarnings({ "unchecked", "rawtypes" })
  @Override
  public boolean tryLockDel(String _key, final int expire) {
    boolean result = false;
    final byte[] key = _key.getBytes();
    long nano = System.currentTimeMillis();// 毫秒
    final byte[] value = StringUtil.object2Byte(nano);
    result = (Boolean) redisTemplate.execute(new RedisCallback() {

      @Override
      public Object doInRedis(RedisConnection connection) throws DataAccessException {
        try {
          // do {
          boolean isDo = connection.setNX(key, value);
          if (isDo) {
            connection.expire(key, expire <= 0 ? DEFAULT_SINGLE_EXPIRE_TIME : expire);
            return Boolean.TRUE;
          } else {
            // 每次trylock 检验是否超时 ，超时则删除
            Long oldValue = (Long) StringUtil.byte2Object(connection.get(key));
            if ((System.currentTimeMillis() - oldValue) > expire * 1500) {
              connection.del(key);
            }
          }
          // Thread.sleep(100);
          // } while ((System.currentTimeMillis() - nano) < Time_Out);
          return Boolean.FALSE;
        } catch (Exception e) {
          return Boolean.FALSE;
        }
      }

    });

    return result;
  }

}
