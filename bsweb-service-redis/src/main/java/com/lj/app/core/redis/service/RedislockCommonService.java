package com.lj.app.core.redis.service;

public interface RedislockCommonService {

    /* public void lock(String key, long timeout); */

    public boolean tryLock(String key);

    public void unLock(String keys);

    // expire 锁的时间 wtimeout 等待时间
    /* public boolean tryLock(String key, int expire,long wtimeout) ; */

    /**
     * 加锁
     * 
     * @param key
     * @param expire 存活时间(秒)
     */
    public void lock(String key, int expire);

    /**
     * 尝试加锁
     * 
     * @param key
     * @param expire 存活时间(秒)
     * @return
     */
    public boolean tryLock(String key, int expire);

    /**
     * 解锁
     * 
     * @param keys
     */
    public void unLock(String... keys);

    public Boolean querryLock(String key);

    /* public boolean tryLocknojedis(String key, int expire,long wtimeout); */

    /**
     * 通过SETNX试图获取一个锁
     * 
     * @param key
     * @param expire 存活时间(秒)
     * @return
     */
    Boolean acquireLock(String key, final long expire);

    /**
     * 释放锁
     * 
     * @param key
     */
    void releaseLock(String key);
    /**
     * 检查超时，超时释放锁
     */
    public boolean tryLockDel(String _key, final int expire);
}
