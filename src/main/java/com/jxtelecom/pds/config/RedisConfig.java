package com.jxtelecom.pds.config;


import com.jxtelecom.pds.entity.SysUserEntity;
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

    @Bean
    JedisConnectionFactory jedisConnectionFactory() {
        JedisConnectionFactory jedisConnectionFactory =  new JedisConnectionFactory();
        // todo redis配置待修改
        jedisConnectionFactory.setHostName("182.106.129.91");
        jedisConnectionFactory.setPort(6379);
        return jedisConnectionFactory;
    }

    @Bean
    public RedisTemplate<String, SysUserEntity> redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String, SysUserEntity> template = new RedisTemplate<String, SysUserEntity>();
        template.setConnectionFactory(jedisConnectionFactory());
        template.setKeySerializer(new StringRedisSerializer());
        template.setValueSerializer(new RedisObjectSerializer());
        return template;
    }
}
