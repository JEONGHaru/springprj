package com.haru.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
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
public class DataSourceTests {

	//CP
	@Setter(onMethod_ = {@Autowired})
	private DataSource dataSource;
	//
	@Setter(onMethod_ = {@Autowired})
	private SqlSessionFactory sqlSessionFactory ;
	
	@Test
	public void testConnection() {
		try(Connection conn = dataSource.getConnection()) {
			log.info("\nDBCP접속 정보 --------------------------------------");
			log.info(conn);
			if (conn == null)
				log.info("접속 실패");
			else
				log.info("접속 성공");
		} catch (Exception e) {
			e.printStackTrace();
			fail(e.getMessage());
		}
	}
	
	@Test
	public void testMyBatis() {
		try(SqlSession session = sqlSessionFactory.openSession();
				Connection conn = session.getConnection();) {
			log.info("Mybatis session 정보: "+session);
			log.info("Mybatis conn 정보: "+conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

