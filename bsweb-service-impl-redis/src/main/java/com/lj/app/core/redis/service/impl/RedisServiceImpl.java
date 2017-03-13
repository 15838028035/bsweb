package com.lj.app.core.redis.service.impl;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Service;

import com.lj.app.core.common.exception.BusinessException;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.redis.service.RedisService;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;

/**
 * 封装redis 缓存服务器服务接口
 *
 * @author hk
 * <p/>
 * 2012-12-16 上午3:09:18
 */
@Service("redisService")
public class RedisServiceImpl implements RedisService {

    private  Log                          log                        = LogFactory.getLog(RedisServiceImpl.class);

    private static String                 redisCode                  = "utf-8";
    private static final long             DEFAULT_SINGLE_EXPIRE_TIME = 3600;
    private static JedisConnectionFactory Jedis_Connection_Factory;

    @Autowired
    private RedisTemplate                 redisTemplate;

    /**
     * @param keys
     */
    @Override
    public Object del(final String... keys) {
        return redisTemplate.execute(new RedisCallback<Long>() {

            @Override
            public Long doInRedis(RedisConnection connection) throws DataAccessException {
                long result = 0;
                for (int i = 0; i < keys.length; i++) {
                    result = connection.del(keys[i].getBytes());
                }
                return result;
            }
        });
    }

    /**
     * @param key
     * @param value
     * @param expire
     */
    @Override
    public void set(final byte[] key, final byte[] value, final long expire) {
        redisTemplate.execute(new RedisCallback() {

            @Override
            public Long doInRedis(RedisConnection connection) throws DataAccessException {

                // if(expire>0){
                // connection.setEx(key,expire,value);
                // }else {
                connection.set(key, value);
                // connection.setNX(key, value)
                if (expire > 0) {
                    connection.expire(key, expire);
                }
                // }
                return 1L;
            }
        });
    }

    @Override
    public <T> Boolean set(String _key, T _value, final long expire) {

        // RedisSerializer<Object> serializer = redisTemplate.getDefaultSerializer();
        Boolean result = Boolean.FALSE;
        try {

            final byte[] key = _key.getBytes();
            final byte[] value = StringUtil.object2Byte(_value);

            result = (Boolean) redisTemplate.execute(new RedisCallback() {

                @Override
                public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
                    try {
                        // if(expire>0){
                        // connection.setEx(key,expire,value);
                        // }else {
                        connection.set(key, value);
                        if (expire > 0) {
                            connection.expire(key, expire);
                        }
                        // }
                        return Boolean.TRUE;
                    } catch (Exception e) {
                        return Boolean.FALSE;
                    }
                }
            });

            return result;
        } catch (Exception e) {
            log.error("redis redisTemplate execute set!" + e.getMessage());
        }
        return result;
    }

    @Override
    public <T> Boolean set(String _key, T _value) {
        return set(_key, _value, 0l);
    }

    /**
     * @param key
     * @param value
     */
    @Override
    public void set(String key, String value) {
        this.set(key, value, 0L);
    }

    /**
     * @param key
     * @param value
     */
    @Override
    public void set(byte[] key, byte[] value) {
        this.set(key, value, 0L);
    }

    /**
     * @param key
     * @return
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    @Override
    public Object get(final String key) {
        Object obj = null;
        try {
            obj = redisTemplate.execute(new RedisCallback() {

                @Override
                public Object doInRedis(RedisConnection connection) throws DataAccessException {
                    try {
                        byte[] _key = key.getBytes();
                        byte[] _value = connection.get(_key);
                        if (_value != null) {
                            Object obj = StringUtil.byte2Object(_value);
                            return obj;
                        }
                    } catch (Exception e) {
                        log.error("redis获取出错!", e);
                    }
                    return null;
                }
            });
        } catch (Exception e) {
            log.error("redis redisTemplate execute get获取出错!" + key);
        }

        return obj;
    }

    /**
     * @param pattern
     * @return
     */
    @Override
    public Set keys(String pattern) {
        return redisTemplate.keys(pattern);

    }

    /**
     * @param key
     * @return
     */
    @Override
    public boolean exists(final String key) {
        boolean bool = (boolean) redisTemplate.execute(new RedisCallback() {

            @Override
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
                return connection.exists(key.getBytes());
            }
        });
        return bool;
    }

    /**
     * @return
     */
    @Override
    public boolean flushDB() {

        Object _bool = redisTemplate.execute(new RedisCallback<Boolean>() {

            @Override
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
                connection.flushDb();
                return true;
            }
        });
        return (Boolean) _bool;
    }

    /**
     * @return
     */
    @Override
    public long dbSize() {
        return (long) redisTemplate.execute(new RedisCallback<Long>() {

            @Override
            public Long doInRedis(RedisConnection connection) throws DataAccessException {
                return connection.dbSize();
            }
        });
    }

    /**
     * @return
     */
    @Override
    public String ping() {
        return (String) redisTemplate.execute(new RedisCallback<String>() {

            @Override
            public String doInRedis(RedisConnection connection) throws DataAccessException {

                return connection.ping();
            }
        });
    }

    public RedisServiceImpl(){

    }

    @Override
    public Boolean hset(String key, Object value) {
      /*  HashOperations hashOps = redisTemplate.opsForHash();
        Class<?> clazz = value.getClass();
        PropertyDescriptor pd = null;
        Method method = null;
        Object obj = null;
        int count = 0;
        Field[] fields = ClassUtil.getClassAllFields(clazz, BaseEntity.class);
        Set<String> fieldNameSet = new HashSet<String>();
        String fieldName = null;
        for (Field field : fields) {
            fieldName = field.getName();
            if (!fieldNameSet.add(fieldName) || fieldName.equals("serialVersionUID")) {
                continue;
            }
            try {
                pd = new PropertyDescriptor(fieldName, clazz);
                method = pd.getReadMethod();
                if (method == null) continue;
                obj = method.invoke(value);
                hashOps.put(key, fieldName, obj);
            } catch (Exception e) {
                log.error(e.getMessage(), e);
                continue;
            }
            count++;
        }

        return count > 0;*/
    	
    	//FIXME:fixed me
    	return true;
    }

    @Override
    public Boolean hMSet(String _key, Map<String, Object> _value, final long expire) {

        if (StringUtil.isBlank(_key) || _value.isEmpty()) {
            return Boolean.FALSE;
        }

        final Map<byte[], byte[]> value = new HashMap<byte[], byte[]>(_value.size());
        for (Map.Entry<String, Object> entity : _value.entrySet()) {
            value.put(entity.getKey().getBytes(), StringUtil.object2Byte(entity.getValue()));
        }

        final byte[] key = _key.getBytes();
        Boolean result = (Boolean) redisTemplate.execute(new RedisCallback() {

            @Override
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
                try {
                    connection.hMSet(key, value);
                    if (expire > 0) {
                        connection.expire(key, expire);
                    }
                    return Boolean.TRUE;
                } catch (Exception e) {
                    return Boolean.FALSE;
                }
            }
        });

        return result;
    }

    @Override
    public Map<String, Object> hGetAll(final String key) {
        try {

            Object result = redisTemplate.execute(new RedisCallback() {

                @Override
                public Map<String, Object> doInRedis(RedisConnection connection) throws DataAccessException {
                    try {

                        byte[] _key = key.getBytes();
                        if (connection.exists(_key)) {
                            Map<byte[], byte[]> _value = connection.hGetAll(_key);

                            Map<String, Object> map = null;
                            if (_value.isEmpty()) {
                                return null;
                            } else {
                                map = new HashMap<String, Object>();
                                for (Map.Entry<byte[], byte[]> entry : _value.entrySet()) {
                                    map.put(new String(entry.getKey()), StringUtil.byte2Object(entry.getValue()));
                                }
                                return map;
                            }
                        }
                    } catch (Exception e) {
                        log.error("redis  hGetAll 获取出错!", e);
                    }
                    return null;
                }
            });
            Map<String, Object> resultmap = null;
            if (result != null) {
                resultmap = (Map<String, Object>) result;
            }
            return resultmap;
        } catch (Exception e) {
            log.error("redis redisTemplate hGetAll 获取出错!", e);
        }
        return null;
    }

    @Override
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public boolean syncSet(String key, Object value, int expire) {
        boolean result = true;

        Jedis jedis = getJedis();
        try {
            RedisSerializer keySerializer = redisTemplate.getKeySerializer();
            RedisSerializer valueSerializer = redisTemplate.getValueSerializer();
            byte[] keyBytes = keySerializer.serialize(key);
            byte[] valueBytes = valueSerializer.serialize(value);
            List<Object> execRes = null;
            while (CollectionUtils.isEmpty(execRes)) {
                if (Arrays.equals(jedis.get(keyBytes), valueBytes)) { // 值已存在
                    return false;
                }
                jedis.watch(keyBytes);
                Transaction trans = jedis.multi();
                trans.setex(keyBytes, expire, valueBytes);
                execRes = trans.exec();
            }
        } finally {
            returnResource(jedis);
        }

        return result;
    }

    /**
     * 执行Redis事务
     * 
     * @param redisKey
     * @param uid
     * @throws BusinessException
     */
    @SuppressWarnings({ "unchecked" })
    @Override
    public synchronized Double execTransForInvestorLast(String redisKey, Object o) {
        String lastScoreKey = redisKey + "_LAST_SCORE";
        ZSetOperations<String, Object> zSetOps = redisTemplate.opsForZSet();
        double score = 1;
        Double lastScore = (Double) get(lastScoreKey);
        if (lastScore != null) {
            score = lastScore.doubleValue() + 1;
        } else {
            Long size = zSetOps.size(redisKey);
            if (size != null) {
                score = size.doubleValue() + 1;
            }
        }
        zSetOps.add(redisKey, o, score);
        lastScore = Double.valueOf(score);
        set(lastScoreKey, lastScore);

        return lastScore;
    }

    /**
     * 将value 插入到列表 key 的表头
     * 
     * @param _key 键
     * @param _value 值
     * @param expire 超时时间
     * @param <T>
     * @return
     */
    @Override
    public <T> Boolean lpush(String _key, T _value, final long expire) {

        final byte[] key = _key.getBytes();
        final byte[] value = StringUtil.object2Byte(_value);

        Boolean result = (Boolean) redisTemplate.execute(new RedisCallback() {

            @Override
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
                try {
                    connection.lPush(key, value);
                    if (expire > 0) {
                        connection.expire(key, expire);
                    }
                    return Boolean.TRUE;
                } catch (Exception e) {
                    log.error("redis执行lpush命令出错:", e);
                    return Boolean.FALSE;
                }
            }
        });

        return result;
    }

    /**
     * 假如在指定时间内没有任何元素被弹出，则返回一个 nil 和等待时长。 反之，返回一个含有两个元素的列表，第一个元素是被弹出元素所属的 key ，第二个元素是被弹出元素的值。
     * 
     * @param key 键
     * @param timeOut 超时时长，单位秒，0表示永久
     * @return
     */
    @Override
    public Object brpop(final String key, final int timeOut) {
        return redisTemplate.execute(new RedisCallback() {

            @Override
            public Object doInRedis(RedisConnection connection) throws DataAccessException {
                try {
                    byte[] _key = key.getBytes();
                    List<byte[]> objList = connection.bRPop(timeOut, _key);
                    if (objList != null && objList.size() > 1) {
                        Object obj = StringUtil.byte2Object(objList.get(1));
                        return obj;
                    }
                } catch (Exception e) {
                    log.error("redis执行brpop命令出错!key:" + key, e);
                }
                return null;
            }
        });
    }

    /**
     * 列表 sourcrKey 中的最后一个元素(尾元素)弹出，并返回给客户端。 将 sourcrKey 弹出的元素插入到列表 destKey ，作为 destKey 列表的的头元素。
     * 
     * @param sourcrKey
     * @param destKey
     * @param timeOut 超时时长，单位秒，0表示永久
     * @return
     */
    @Override
    public Object brpopLpush(final String sourcrKey, final String destKey, final int timeOut) {
        return redisTemplate.execute(new RedisCallback() {

            @Override
            public Object doInRedis(RedisConnection connection) throws DataAccessException {
                try {
                    byte[] _sourceKey = sourcrKey.getBytes();
                    byte[] _destKey = destKey.getBytes();
                    byte[] _value = connection.bRPopLPush(timeOut, _sourceKey, _destKey);
                    // connection.lrem
                    Object obj = StringUtil.byte2Object(_value);
                    return obj;
                } catch (Exception e) {
                    log.info("redis执行brpopLpush命令出错!key:" + sourcrKey, e);
                }
                return null;
            }
        });
    }

    /**
     * 根据参数count的值，移除列表中与参数value相等的元素。
     * 
     * @param _key 队列key
     * @param count 要移除的个数
     * @param _value 值对象
     * @return
     */
    @Override
    public <T> Boolean lrem(final String _key, final long count, final T _value) {
        return (Boolean) redisTemplate.execute(new RedisCallback() {

            @Override
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
                try {
                    final byte[] key = _key.getBytes();
                    final byte[] value = StringUtil.object2Byte(_value);
                    if (connection.exists(key)) {
                        long l = connection.lRem(key, count, value);
                        if (l > 0) {
                            return Boolean.TRUE;
                        }
                    }
                } catch (Exception e) {
                    log.error("redis执行lRem命令出错!", e);
                    return Boolean.FALSE;
                }
                return Boolean.FALSE;
            }
        });
    }

    /**
     * 获取Jedis对象
     * 
     * @return
     */
    @Override
    @PostConstruct
    public Jedis getJedis() {
        try {
            if (Jedis_Connection_Factory == null) {
                Jedis_Connection_Factory = (JedisConnectionFactory) redisTemplate.getConnectionFactory();
            }
            return Jedis_Connection_Factory.getConnection().getNativeConnection();
        } catch (Exception e) {
            log.error("获取Jedis对象失败");
            log.error(e.getMessage(), e);
            return null;
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public boolean removeFromSortedSet(String redisKey, Object o) {
        try {
            ZSetOperations<String, Object> zSetOps = redisTemplate.opsForZSet();
            return zSetOps.remove(redisKey, o) > 0;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return false;
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public boolean checkZetElementExists(String redisKey, Object o) {
        try {
            ZSetOperations<String, Object> zSetOps = redisTemplate.opsForZSet();
            return zSetOps.rank(redisKey, o) > 0;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return false;
        }
    }

    @Override
    public RedisTemplate<Object, Object> getRedisTemplate() {
        return redisTemplate;
    }

    /**
     * 根据参数key的值，获取队列的长度。
     * 
     * @param _key 队列key @return 队列的长度
     */
    @Override
    public long querryLenth(String _key) {
        final byte[] key = _key.getBytes();
        return (long) redisTemplate.execute(new RedisCallback() {

            @Override
            public Long doInRedis(RedisConnection connection) throws DataAccessException {
                return connection.lLen(key);

            }
        });
    }

    /**
     * 释放资源
     */
    private void returnResource(Jedis jedis) {
        if (jedis == null) return;
        try {
            jedis.quit();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        try {
            jedis.disconnect();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }

    /**
     * 根据参数key的值，获取队列的集合。
     * 
     * @param _key 队列key @return 队列的集合但不消费
     */
    @Override
    public List<Object> brpopList(final String key, final int timeOut) {
        return (List<Object>) redisTemplate.execute(new RedisCallback() {

            @Override
            public List doInRedis(RedisConnection connection) throws DataAccessException {
                try {
                    byte[] _key = key.getBytes();
                    Long length = connection.lLen(_key);
                    List<byte[]> objList = connection.lRange(_key, 0L, length);
                    List<Object> objListReturn = new ArrayList<Object>();
                    if (objList != null && objList.size() > 0) {

                        for (int i = 0; i < objList.size(); i++) {
                            Object obj = StringUtil.byte2Object(objList.get(i));
                            objListReturn.add(obj);
                        }

                    }
                    return objListReturn;
                } catch (Exception e) {
                    log.error("redis执行brpop命令出错!key:" + key, e);
                }
                return null;
            }
        });
    }

    @SuppressWarnings("unchecked")
    @Override
    public void delByPattern(String... patterns) {
        for (String pattern : patterns) {
            try {
                Set<?> set = redisTemplate.keys(pattern);
               // if (CollectionUtils.isNotEmpty(set)) {
                    redisTemplate.delete(set);
                //}
            } catch (Exception e) {
                log.error(e.getMessage(), e);
            }
        }
    }

    @Override
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public boolean tryLockBeforeSet(String _key, final long expire) {
        boolean result = false;
        final byte[] key = (_key + "_NX").getBytes();
        try {
            result = (Boolean) redisTemplate.execute(new RedisCallback() {

                @Override
                public Object doInRedis(RedisConnection connection) throws DataAccessException {
                    try {
                        if (connection.setNX(key, key)) {
                            connection.expire(key, 2);
                            return Boolean.TRUE;
                        }
                        return Boolean.FALSE;
                    } catch (Exception e) {
                        return Boolean.TRUE;
                    }
                }

            });
        } catch (Exception e) {
            return Boolean.TRUE;
        }

        return result;
    }

    /**
     * @param key
     * @return
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    @Override
    public Object getSyn(final String key) {
        Object obj = null;
        try {
            obj = redisTemplate.execute(new RedisCallback() {

                @Override
                public Object doInRedis(RedisConnection connection) throws DataAccessException {
                    synchronized (key) {
                        try {
                            byte[] keyNx = (key + "_NX").getBytes();
                            byte[] valueNx = connection.get(keyNx);
                            int count = 0;
                            while (isEquals(keyNx, valueNx)) {
                                Thread.sleep(100);
                                count++;
                                if (count > 30) {
                                    // break;
                                }
                            }
                            byte[] _key = key.getBytes();
                            byte[] _value = connection.get(_key);
                            if (_value != null) {
                                Object obj = StringUtil.byte2Object(_value);
                                return obj;
                            } else {
                                connection.setNX(keyNx, keyNx);
                                connection.expire(keyNx, 10);
                            }
                        } catch (Exception e) {
                            log.error("redis获取出错!", e);
                        }
                        return null;
                    }
                }
            });
        } catch (Exception e) {
            log.error("redis redisTemplate execute get获取出错!" + key);
        }

        return obj;
    }

    public Boolean isEquals(byte[] a, byte[] b) {
        if (a != null && b != null && a.length == b.length) {
            for (int i = 0; i < a.length; i++) {
                if (a[i] != b[i]) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }

}
