package com.lj.app.core.redis.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.data.redis.core.RedisTemplate;

import com.lj.app.core.common.exception.BusinessException;

import redis.clients.jedis.Jedis;

/**
 * RedisService
 *
 */
public interface RedisService {

    /**
     * 通过key删除
     *
     * @param keys
     */
    public abstract Object del(String... keys);

    /**
     * 添加key value 并且设置存活时间(byte)
     *
     * @param key
     * @param value
     * @param expire
     */
    public abstract void set(byte[] key, byte[] value, long expire);

    /**
     * 添加key value 并且设置存活时间(byte)
     *
     * @param key
     * @param value
     * @param expire
     */
    public abstract <T> Boolean set(String key, T value, long expire);

    // /**
    // * 添加key value 并且设置存活时间
    // *
    // * @param key
    // * @param value
    // * @param expire 单位秒
    // */
    // public abstract void set(String key, String value, long expire);

    /**
     * 添加key value
     *
     * @param key
     * @param value
     */
    public abstract void set(String key, String value);

    public <T> Boolean set(String _key, T _value);

    /**
     * 添加key value (字节)(序列化)
     *
     * @param key
     * @param value
     */
    public abstract void set(byte[] key, byte[] value);

    /**
     * 获取redis value (String)
     *
     * @param key
     * @return
     */
    public abstract Object get(String key);

    /**
     * 通过正则匹配keys
     *
     * @param pattern
     * @return
     */
    public abstract Set keys(String pattern);

    /**
     * 检查key是否已经存在
     *
     * @param key
     * @return
     */
    public abstract boolean exists(String key);

    /**
     * 清空redis 所有数据
     *
     * @return
     */
    public abstract boolean flushDB();

    /**
     * 查看redis里有多少数据
     */
    public abstract long dbSize();

    /**
     * 检查是否连接成功
     *
     * @return
     */
    public abstract String ping();

    /**
     * 将对象存到redis中hashset
     *
     * @param key
     * @param value
     * @return
     */
    Boolean hset(String key, Object value);

    public Boolean hMSet(String key, Map<String, Object> _value, long expire);

    public Object hGetAll(String key);

    /**
     * 执行Redis事务将投资人移到队尾
     * 
     * @param redisKey
     * @param o
     * @throws BusinessException
     */
    Double execTransForInvestorLast(final String redisKey, final Object o);

    /**
     * 将value 插入到列表 key 的表头
     * 
     * @param _key 键
     * @param _value 值
     * @param expire 超时时间
     * @param <T>
     * @return
     */
    public <T> Boolean lpush(String _key, T _value, final long expire);

    /**
     * 假如在指定时间内没有任何元素被弹出，则返回一个 nil 和等待时长。 反之，返回一个含有两个元素的列表，第一个元素是被弹出元素所属的 key ，第二个元素是被弹出元素的值。
     * 
     * @param key 键
     * @param timeOut 超时时长，单位秒，0表示永久
     * @return
     */
    public Object brpop(final String key, final int timeOut);

    /**
     * 列表 sourcrKey 中的最后一个元素(尾元素)弹出，并返回给客户端。 将 sourcrKey 弹出的元素插入到列表 destKey ，作为 destKey 列表的的头元素。
     * 
     * @param sourcrKey
     * @param destKey
     * @param timeOut 超时时长，单位秒，0表示永久
     * @return
     */
    public Object brpopLpush(final String sourcrKey, final String destKey, final int timeOut);

    /**
     * 根据参数count的值，移除列表中与参数value相等的元素。
     * 
     * @param _key 队列key
     * @param count 要移除的个数
     * @param _value 值对象
     * @return
     */
    public <T> Boolean lrem(final String _key, final long count, final T _value);

    /**
     * 获取Jedis对象
     * 
     * @return
     */
    public Jedis getJedis();

    /**
     * 从SortedSet中剔除某个对象
     * 
     * @param redisKey
     * @param o
     * @return
     */
    public boolean removeFromSortedSet(String redisKey, Object o);

    /**
     * 检查ZSET中某个对象是否存在
     * 
     * @param redisKey
     * @param o
     * @return
     */
    boolean checkZetElementExists(String redisKey, Object o);

    public RedisTemplate<Object, Object> getRedisTemplate();

    /**
     * 并发同步设置redis数据
     * 
     * @param key 键
     * @param value 值
     * @param expire 存活时间(秒)
     * @throws BusinessException
     */
    boolean syncSet(String key, Object value, int expire);

    /**
     * 根据参数key的值，获取队列的长度。
     * 
     * @param _key 队列key @return 队列的长度
     */

    public long querryLenth(String _key);

    /**
     * 根据参数key的值，获取队列的集合。
     * 
     * @param _key 队列key @return 队列的集合但不消费
     */
    public List<Object> brpopList(final String key, final int timeOut);

    /**
     * 通过正则表达式来删除key
     * 
     * @param patterns
     */
    public void delByPattern(String... patterns);

    /**
     * Set前加锁，保证只被Set一次
     * 
     * @param key
     * @param expire
     * @return
     */
    public boolean tryLockBeforeSet(String key, final long expire);

    /**
     * 获取值防止并发
     * 
     * @param key
     * @return
     */
    public Object getSyn(final String key);

}
