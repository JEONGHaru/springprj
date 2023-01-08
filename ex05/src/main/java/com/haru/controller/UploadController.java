package com.haru.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.haru.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {

	//업로드폼
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("uploadForm -------------------------");
	}
	
	//업로드 처리
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) throws Exception {
		//파일을 저장하는 폴더 위치 -> 서버와 상관없는 위치 - 업로드 된 파일은 URL로 직접연결이 안됨
		String uploadFolder = "/Users/jeong-gwang-yeong/Desktop/upload/tmp/images";
		
		//폴더가 없으면 오류
		File folder = new File(uploadFolder);
		if(!folder.exists()) folder.mkdirs();
		
		//올라온 파일 정보 출력하고 저장 - 배열이므로 반복문으로 처리
		for (MultipartFile multipartFile : uploadFile) {
			log.info("-----------------------------------");
			//클라이언트의 파일명 출력
			String fileName = multipartFile.getOriginalFilename();
			log.info("File Name --------------- : "+fileName);
			//작업하고 있는 파일의 용량
			log.info("File Size --------------- : " + multipartFile.getSize());
			
			//서버에 저장처리
			//저장 되는 파일명
			File saveFile = new File(uploadFolder,fileName);
			
			//저장 처리
			multipartFile.transferTo(saveFile);
		}
	}
	
	//ajax 업로드폼 - > ajax 파일 업로드를 위한 jsp로 이동하기 위한 method
	@GetMapping("/uploadAjax")
	public void uploaAjax() {
		log.info("uploadAjax -------------------------");
	}
	
	//ajax 업로드 처리
	@PostMapping(value="/uploadAjaxAction",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody //@Controller 인 경우 문자열 그대로 return하기 위해 붙인다
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) throws Exception {
		
		log.info("uploadAjax POST----------------------------");
		
		//파일 정보를 담는 객체
		List<AttachFileDTO> list = new ArrayList<AttachFileDTO>(); 
		//파일을 저장하는 폴더 위치 -> 서버와 상관없는 위치 - 업로드 된 파일은 URL로 직접연결이 안됨
		String uploadFolder = "/Users/jeong-gwang-yeong/Desktop/upload/tmp/images";
		String uploadFolderPath = getFolder();
		//폴더가 없으면 오류
		File uploadPath = new File(uploadFolder,getFolder());
		
		log.info("uploadPath --------------: " + uploadPath );
		if(!uploadPath.exists()) uploadPath.mkdirs();
		
		//올라온 파일 정보 출력하고 저장 - 배열이므로 반복문으로 처리
		for (MultipartFile multipartFile : uploadFile) {
			//첨부파일 정보를 저장하는 객체
			AttachFileDTO attachDTO = new AttachFileDTO();
			log.info("-----------------------------------");
			//클라이언트의 파일명 출력
			String fileName = multipartFile.getOriginalFilename();
			//파일명 중복 처리
			UUID uuid = UUID.randomUUID();
			log.info("File Name --------------- : "+fileName);
			//작업하고 있는 파일의 용량
			log.info("File Size --------------- : " + multipartFile.getSize());
			
			//서버에 저장처리
			//서버에 올라가는 파일명
			
			String uploadFileName = uuid.toString() + "_" + fileName;
			//저장 되는 파일명
			File saveFile = new File(uploadPath,uploadFileName);
			
			//저장 처리
			multipartFile.transferTo(saveFile);
			attachDTO.setUploadPath(uploadFolderPath);
			attachDTO.setFileName(fileName);
			attachDTO.setUuid(uuid.toString());
			log.info("attachDTO==================== : " + attachDTO);
			
			if(checkImageType(saveFile)) {
				attachDTO.setImage(true);
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				thumbnail.close();
			}
			list.add(attachDTO);
		}
		return new ResponseEntity<List<AttachFileDTO>>(list,HttpStatus.OK);
	}
	//파일을 보여주는 method
	//url - display/fileName=**
	@GetMapping("/diplay")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) throws Exception{
		ResponseEntity<byte[]> result = null;
		String uploadFolder = "/Users/jeong-gwang-yeong/Desktop/upload/tmp/images";
		//넘어오는 데이터 확인
		log.info("fileName--------------------: " + fileName);
		File file = new File(uploadFolder,fileName);
		
		HttpHeaders header = new HttpHeaders();
		header.add("content-type",Files.probeContentType(file.toPath()));
		
		result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		
		return result;
	}
	
	@GetMapping(value="/download",produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> download(@RequestHeader("User-agent")String userAgent, String fileName) throws Exception{
		
		ResponseEntity<Resource> entity = null;
		String uploadFolder = "/Users/jeong-gwang-yeong/Desktop/upload/tmp/images";
		log.info("fileName--------------------: " +fileName);
		log.info("userAgent---------------------:" + userAgent);
		//서버의 자원 - 파일 시스템과 연결 - 파일 자원
		Resource resource = new FileSystemResource(uploadFolder+File.separator+fileName);
		log.info("resource ------------------- :"+resource);
		//파일 이름을 resource에서 꺼낸다  - 별도로 작성해도 된다
		//header에 붙여서 사용하면 resourceName 으로 다운로드 된다
		String resourceName = resource.getFilename();
		log.info("resourceName ------------------- :"+resourceName);
		resourceName = resourceName.substring(resourceName.indexOf("_")+1);
		log.info("resourceName ------------------- :"+resourceName);
		
		
		//브라우저에 따른한글처리 - IE,Edge가 문제가 됨
		//IE 처리
		String downloadName = null;
		if(userAgent.contains("Trident")) {
			downloadName = URLEncoder.encode(resourceName,"UTF-8").replaceAll("\\+"," ");
		}else if(userAgent.contains("Edg")) {
			//Edhe처리
			downloadName = URLEncoder.encode(resourceName,"UTF-8");
		}else {
			downloadName = new String(resourceName.getBytes("UTF-8"),"ISO-8859-1");
		}
		
		//response에 보내질 데이터의 헤더에 세팅을 위한 객체
		HttpHeaders headers = new HttpHeaders();
		headers.add("content-disposition", "attachment; fileName=" + downloadName);
		log.info("headers ----------------- : "+headers);
		
		entity = new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
		log.info("entity----------------- : "+entity);
		
		return entity;
	}
	
	//파일 삭제
	@PostMapping("deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName,String type)throws Exception {
		String uploadFolder = "/Users/jeong-gwang-yeong/Desktop/upload/tmp/images";
		log.info("deleteFile FileName ------------------ : " + fileName);
		log.info("deleteFile type ------------------ : " + type);
		
		File file = new File(uploadFolder+File.separator+URLDecoder.decode(fileName,"UTF-8"));
		
		file.delete();
		
		if(type.equals("image")) {
			//String largeFileName = file.getAbsolutePath().replace("s_", "");
			String largeFileName = file.getAbsolutePath();
			log.info("썸네일 파일 s_ -------------: "+largeFileName);
			int pos = largeFileName.lastIndexOf(File.separator);
			largeFileName = largeFileName.substring(0,pos) + largeFileName.substring(pos).replaceFirst("s_","") ;
			new File(largeFileName).delete();
			log.info("s_ 삭제 ---------------------: "+largeFileName);
		}
		
		return new ResponseEntity<String>("success deleted",HttpStatus.OK);
	}
	
	//날짜 폴더 작성을 위한 메소드 - mapping과는 상관없음
	private String getFolder() {
		//jsp의 fmt와 동일
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				//오늘 날짜 객체 생성
				Date date = new Date();
				
				String str = sdf.format(date);
				
				return str.replace("-", File.separator);
	};
	
	//이미지 구별 메소드
	
	private boolean checkImageType(File file) throws Exception {
	
		String contentType = Files.probeContentType(file.toPath());
		
		log.info("contentType  -------------- : "+contentType);
		
		return contentType.startsWith("image");
	}
}
