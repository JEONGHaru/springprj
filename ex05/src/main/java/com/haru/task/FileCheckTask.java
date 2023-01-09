package com.haru.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Log4j
@Component 
public class FileCheckTask {

	@Scheduled(cron ="0 * * * * *")
	public void chechFiles() throws Exception{
		log.warn("File Check Task Run------------------------");
		log.warn("============================================");
		
	}
}
