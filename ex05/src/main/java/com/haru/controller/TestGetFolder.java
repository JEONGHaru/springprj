package com.haru.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TestGetFolder {

	public static void main(String[] args) {

		//jsp의 fmt와 동일
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//오늘 날짜 객체 생성
		Date date = new Date();
		
		String str = sdf.format(date);
		System.out.println(str);
		System.out.println(File.separator);
		
		System.out.println(str.replace("-", File.separator));
	}

}
