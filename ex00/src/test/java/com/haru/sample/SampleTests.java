package com.haru.sample;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SampleTests {

	@Setter(onMethod_ = {@Autowired})
	private Restaurant restaurant;
	
	@Test
	public void testExist() {
	
		log.info(restaurant); //자동 DI 확인
		log.info("------------------------------------------------------");
		log.info(restaurant.getChef());
	}
	
	@Test
	public void testNullRestaurant() {
		
		log.info("restaurant null 확인 테스트---------------------------------------------");
		if(restaurant == null) log.info("null 입니다");
		else log.info("null이 아닙니다");
			
		}
	}

