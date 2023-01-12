package com.haru.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.haru.domain.BoardAttachDTO;
import com.haru.mapper.BoardAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component 
public class FileCheckTask {
	
	//DB처리를 위한 mapper 자동 DI(Setter를 사용)
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
	//(cron ="*-초 *-분 *-시 *-일 *-월 *-주")
	//주기적으로 삭제해야할 파일을 찾아서 삭제해주는 메서드
	//@Scheduled(cron ="0 * * * * *")
	@Scheduled(cron ="0 0 2 * * *") //새벽2시에 동작
	public void chechFiles() throws Exception{
		log.warn("File Check Task Run------------------------");
		
		//DB에 있는 파일 목록
		List<BoardAttachDTO> fileList = attachMapper.getOldFiles();
		
		List<Path> fileListPaths = fileList.stream().map(dto -> 
								Paths.get("/Users/jeong-gwang-yeong/Desktop/upload/tmp/images",dto.getUploadPath(),
								dto.getUuid() + "_"+dto.getFileName())).collect(Collectors.toList());
		//이미지 인경우
		fileList.stream()
		.filter(dto -> dto.isFileType()==true)
		.map(dto -> Paths.get("/Users/jeong-gwang-yeong/Desktop/upload/tmp/images",dto.getUploadPath(),
				"s_"+dto.getUuid()+"_"+dto.getFileName()))
		.forEach(p -> fileListPaths.add(p));
		
		fileListPaths.forEach(p -> log.warn("DB File-----------------: " + p));
		log.warn("fileList --------------------- : "+fileList);
		log.warn("============================================");
		
		File targetDir = Paths.get("/Users/jeong-gwang-yeong/Desktop/upload/tmp/images",getFolderYesterDay()).toFile();
		log.warn("targetDir --------------- : " + targetDir);
		
		for(File f : targetDir.listFiles()) {
			log.warn("targetDir File LIst -----------" + f.getAbsolutePath());
		}
		
		File[] removeFiles = targetDir.listFiles(file -> !fileListPaths.contains(file.toPath()));
		
		for(File file : removeFiles) {
			log.warn("removeFiles ----------------- : " + file.getAbsolutePath());
			file.delete();
		}
		
	}
	
	private String getFolderYesterDay() {
		//날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//오늘 날짜 객체 - Date, Calender 중 하나를 사용
		Calendar cal = Calendar.getInstance();
		//어제 날짜 세팅
		cal.add(Calendar.DATE, -1);
	
		//어제 날짜를 위에 날짜형식으로 만들어 문자열로 반환
		String str = sdf.format(cal.getTime());
		
		return str.replaceAll("-", File.separator);
	}
	
}
