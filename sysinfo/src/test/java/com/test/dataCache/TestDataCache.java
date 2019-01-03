package com.test.dataCache;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sys.mapper.FklbMapper;

import redis.clients.jedis.Jedis;
/**
 * @author JYB
 */
@RunWith(value = SpringJUnit4ClassRunner.class)
@Configuration(value = "classpath*:beans.xml") 
public class TestDataCache extends AbstractJUnit4SpringContextTests{

	@Autowired
	FklbMapper fklbMapper;
	
	@Test
	public void testVisitorList() {
		
		Jedis jedis = new Jedis(/*fklbService*/);
	}
}
