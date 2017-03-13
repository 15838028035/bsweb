package com.lj.app.core.redis.service.impl;

import java.beans.PropertyDescriptor;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * 类RedisClientTemplate.java的实现描述：自定义Redis操作类(此类未完成，请勿使用)
 * 
 * @author Starty 2015年7月7日 上午11:03:49
 */
public class RedisClientTemplate {

    private static final Log log = LogFactory.getLog(RedisClientTemplate.class);

    @Autowired
    private JedisPool           jedisPool;

    private Jedis               jedis;

    public void init() {
        genJedis();
    }

    /**
     * 获取redis客户端
     * 
     * @return
     */
    public Jedis getRedisClient() {
        return jedis;
    }

    public JedisPool getJedisPool() {
        return jedisPool;
    }

    public void genJedis() {
        if (jedis == null) {
            jedis = jedisPool.getResource();
        }
    }

    public Boolean set(String key, Object value) {
        if (!(value instanceof Serializable)) {
            log.error(value.getClass().getName() + "：对象没有实现Serializable接口！");
            return Boolean.FALSE;
        }

        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ObjectOutputStream oos = new ObjectOutputStream(baos);
            oos.writeObject(value);
            jedis.set(key.getBytes("UTF-8"), baos.toByteArray());
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return Boolean.FALSE;
        }

        return Boolean.TRUE;
    }

    @SuppressWarnings("unchecked")
    public <T> T get(String key) {
        try {
            if (jedis.exists(key)) {
                byte[] byteValue = jedis.get(key.getBytes("UTF-8"));
                ByteArrayInputStream bais = new ByteArrayInputStream(byteValue);
                ObjectInputStream ios = new ObjectInputStream(bais);
                return (T) ios.readObject();
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }

        return null;
    }

    public Boolean hset(String key, Object value) {
        try {
            Class<?> clazz = value.getClass();
            PropertyDescriptor pd = null;
            Method method = null;
            Object obj = null;
            for (Field field : clazz.getDeclaredFields()) {
                pd = new PropertyDescriptor(field.getName(), clazz);
                method = pd.getReadMethod();
                obj = method.invoke(value);
                jedis.hset(key, field.getName(), obj == null ? null : String.valueOf(obj));
            }
        } catch (Exception e) {
            log.error(e.getMessage());
            return Boolean.FALSE;
        }

        return Boolean.TRUE;
    }

    public String hget(String key, String field, String defaultValue) {
        String value = null;
        if (jedis.exists(key)) {
            value = jedis.hget(key, field);
        }
        if (value == null && defaultValue != null) {
            return defaultValue;
        } else {
            return value;
        }
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
    }

}
