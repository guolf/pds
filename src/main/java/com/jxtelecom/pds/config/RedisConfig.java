package com.jxtelecom.pds.config;


import com.jxtelecom.pds.entity.SysUserEntity;
import com.jxtelecom.pds.utils.redis.PoolConfig;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.*;

/**
 * Created by guolf on 17/5/11.
 */
@Configuration
public class RedisConfig {

    @Value("${spring.redis.host:#{null}}")
    private String host;
    @Value("${spring.redis.port:#{null}}")
    private String port;
    @Value("${spring.redis.pool.max-active:#{null}}")
    private int maxActive;
    @Value("${spring.redis.pool.max-wait:#{null}}")
    private int maxWait;
    @Value("${spring.redis.pool.max-idle:#{null}}")
    private int maxIdle;
    @Value("${spring.redis.pool.timeout:#{null}}")
    private int timeout;

    @Bean(name = "jedisConnectionFactory")
    JedisConnectionFactory jedisConnectionFactory() {
        JedisConnectionFactory jedisConnectionFactory =new JedisConnectionFactory();
        jedisConnectionFactory.setHostName(host);
        jedisConnectionFactory.setPort(Integer.valueOf(port));
        PoolConfig pool = new PoolConfig();
        pool.setMaxActive(maxActive);
        pool.setMaxWait(maxWait);
        pool.setMaxIdle(maxIdle);
        jedisConnectionFactory.setPoolConfig(pool);
        jedisConnectionFactory.setTimeout(timeout);
        return jedisConnectionFactory;
    }

    @Bean(name = "redisTemplate")
    public RedisTemplate<String, SysUserEntity> redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String, SysUserEntity> template = new RedisTemplate<String, SysUserEntity>();
        template.setConnectionFactory(jedisConnectionFactory());
        template.setKeySerializer(new StringRedisSerializer());
        template.setValueSerializer(new RedisObjectSerializer());
        return template;
    }
}
