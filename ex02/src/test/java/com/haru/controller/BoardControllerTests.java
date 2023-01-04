package com.haru.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class BoardControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setUp() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	//게시판 리스트 테스트 - URL을 이용해서 동작여부 테스트
	@Test
	public void testList() throws Exception{
		log.info(
			mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
			.andReturn() //URL - /board/list를 이용해서 가져온 데이터를 return
			.getModelAndView() // Spring의 ModelAndView(data와 view(JSP) 정보를 담아서 return 하는 객체
			.getModelMap() //modell.addarttribute(key,value) --> Map객체를 return  
		);
	}
	
	//게시판 글쓰기 테스트 - URL을 이용해서 동작여부 테스트 - POST
	@Test
	public void testRegister() throws Exception{
		//URL로 실행하고 결과는 String(JSP 정보)
		String resultPage = 
			 mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
					 .param("title", "Controller 제목 테스트")
					 .param("content", "Controller 내용 테스트")
			 		 .param("writer", "user00")
			 		 ).andReturn().getModelAndView().getViewName();
		log.info("jsp또는 이동할 URL 정보 -- resultPage : " + resultPage);
	}
	//게시판 글보기 테스트 - URL을 이용해서 동작여부 테스트 - GET
	@Test
	public void testGet() throws Exception{
		//URL로 실행하고 결과는 String(JSP 정보)
		log.info(
				mockMvc.perform(MockMvcRequestBuilders
						.get("/board/get")
						.param("bno", "10")
						).andReturn().getModelAndView().getModelMap()
				);		
	}
	
	//게시판 글쓰기 테스트 - URL을 이용해서 동작여부 테스트 - POST
		@Test
		public void testModify() throws Exception{
			//URL로 실행하고 결과는 String(JSP 정보)
			String resultPage = 
				 mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
						 .param("bno", "1")
						 .param("title", "Controller 제목 수정테스트")
						 .param("content", "Controller 내용 수정테스트")
				 		 .param("writer", "user00")
				 		 ).andReturn().getModelAndView().getViewName();
			log.info("jsp또는 이동할 URL 정보 -- resultPage : " + resultPage);
		}
		
		//게시판 글삭제 테스트 - URL을 이용해서 동작여부 테스트 - POST
		@Test
		public void testRemove() throws Exception{
			//URL로 실행하고 결과는 String(JSP 정보)
			String resultPage=
					mockMvc.perform(MockMvcRequestBuilders
							.post("/board/remove")
							.param("bno", "21").param("amount", "10")
							).andReturn().getModelAndView().getViewName();
			log.info("jsp또는 이동할 URL 정보 -- resultPage : " + resultPage);
						
		}
}
