package com.itwillbs.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


// 컨트롤러 사용할수있도록 준비
@Controller
public class SampleController2 {
	
	// 해당 컨트롤러의 정보를 로그로 출력하기 위한 준비
	private static final Logger logger =
			LoggerFactory.getLogger(SampleController2.class);
	
	// [/doC] 주소를 통해서 처리하는 메서드 doC() 구현
	// 도착정보를 로그로 출력
	@RequestMapping("/doC")
	public String  doC(@ModelAttribute("msg") String msg, @ModelAttribute("age") int age) {
		// @ModelAttribute("이름") : 자동으로 해당 데이터를 뷰페이지 까지 이동
		
		logger.info("/doC 주소를 통해서 doC() 메서드 호출됨");
		
		return "itwill";
	}
	// * 메서드의 리턴타입이 String 일경우  리턴값.jsp view 호출
	
	// /doC1 주소를 통해서 itwill.jsp (view페이지) 이동
	@RequestMapping("/doC1")
	public String doC1() {
		
		logger.info(" /doC1주소 호출 -> itwill.jsp 이동");
		
		return "itwill";
	}
	
	
	
	
	
	
	
	
	
	
	

}
