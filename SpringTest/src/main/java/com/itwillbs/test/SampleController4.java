package com.itwillbs.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SampleController4 {
	// 해당 컨트롤러의 정보를 로그로 출력하기 위한 준비
	private static final Logger logger 
	  = LoggerFactory.getLogger(SampleController4.class);

	// 페이지 이동
	//  리다이렉트 이동
	
	// http://localhost:8080/test/doE?abc=1234
	/*
	 * @RequestMapping("/doE") 
	 * public String doE(@ModelAttribute("abc") String tmp)
	 * {
	 * 
	 * logger.info(" /doE 주소를 사용해서 doE() 호출 ");
	 * 
	 * //return "/doA"; //return "redirect:/doA"; //return "forward:/doA"; return
	 * "redirect:/doF"; }
	 */
	// http://localhost:8080/test/doE
	@RequestMapping("/doE")
	public String doE(RedirectAttributes rttr) {
		// RedirectAttributes => 주소줄에 URI에 보이지 않게 데이터 전달
		
		logger.info(" /doE 주소를 사용해서 doE() 호출 ");
		
		//rttr.addAttribute("abc", "Hello");
		rttr.addFlashAttribute("abc", "Test1234");
		
		return "redirect:/doF";
	}
	
	
	
	// /doF 주소를 처리하는 메서드 doF()
	// /doE페이지를 호출시 파라미터값 abc=1234 가지고 이동해오는 페이지
	
	// 주소 /doE?abc=1234 ->리다이렉트-> /doF (abc값 출력)
	
	// 1) 주소 /doE 입력시 파라미터값abc(1234) 가지고 호출
	// 2) 메서드에서 처리후 /doF 페이지로 리다이렉트 이동
	// 3) /doF에서 리다이렉트 이동후 전달받은 정보 출력
	
	@RequestMapping("/doF")
	public void doF(@ModelAttribute("abc") String tmp) {
		logger.info("/doF 주소를 사용해서 doF() 메서드 실행");
		logger.info("전달값 : "+tmp);		
	}
	
	
	// 페이지 이동 (리다이렉트:주소도 변경, 페이지도 변경) + 데이터 가지고 이동

	// 1) doE -> doF
	//  주소 요청 : .../doE?abc=1234
	//  컨트롤러 : doE(@ModelAttribute("abc") String tmp)
	//  redirect:/doF => .../doF?abc=1234
	//  컨트롤러 : doF(@ModelAttribute("abc") String tmp)
	//  view 페이지 에서 출력
	
	// 2) doE -> doF
	// 주소 요청 : .../doE
	// 컨트롤러 : doE(RedirectAttributes rttr)
	// rttr.addAttribute("abc",1234);
	// redirect:/doF  =>  .../doF?abc=1234
	// 컨트롤러 : doF(@ModelAttribute("abc") String tmp)
	// view 페이지 에서 출력
	
	
	// 3) doE -> doF
	// 주소요청 : .../doE
	// 컨트롤러 : doE(RedirectAttributes rttr)
	// rttr.addFlashAttribute("abc",1234);
	// redirect:/doF  =>  .../doF
	// 컨트롤러 : doF(@ModelAttribute("abc") String tmp)
	// view 페이지 에서 출력
	// + F5 (새로고침) 했을땐 데이터가 사라진다(1회성 속성값)
	
	// 컨트롤러에서 처리하는 메서드 전달인자로 RedirecrtAttributes 사용시
	// 1) addAttribute(이름,값) - 주소(URI) 표시 O , F5 O(값이 유지)
	// 2) addFlashAttribute(이름,값) - 주소(URI) 표시X, F5 X(1회성 값)
	
	
	
	

}
