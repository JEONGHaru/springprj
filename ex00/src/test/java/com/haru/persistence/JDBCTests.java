package com.haru.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {
		// 자원 자동 반환 cloce()를 사용하지 않아도 됨
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BBS", "haru", "123456")) {
			log.info("\nDB접속 정보 --------------------------------------");
			log.info(conn);
			if (conn == null)
				log.info("접속 실패");
			else
				log.info("접속 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
