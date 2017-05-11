package com.jxtelecom.pds.utils.redis;

import redis.clients.jedis.JedisPoolConfig;

/**
 * Created by tzj12 on 2017/5/11.
 */
public class PoolConfig extends JedisPoolConfig {

    private int maxActive;
    private int maxWait;
    private int maxIdle;
    private int timeOut;

    public int getMaxWait() {
        return maxWait;
    }

    public void setMaxWait(int maxWait) {
        this.maxWait = maxWait;
    }

    @Override
    public int getMaxIdle() {
        return maxIdle;
    }

    @Override
    public void setMaxIdle(int maxIdle) {
        this.maxIdle = maxIdle;
    }

    public int getTimeOut() {
        return timeOut;
    }

    public void setTimeOut(int timeOut) {
        this.timeOut = timeOut;
    }

    public int getMaxActive() {
        return maxActive;
    }

    public void setMaxActive(int maxActive) {
        this.maxActive = maxActive;
    }
}
