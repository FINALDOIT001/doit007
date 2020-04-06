package com.kh.doit.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	
	/**
	  * @Method Name : 메인페이지 접근
	  * @작성일 : Apr 2, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : haeder에서 admin 접근
	  * @return
	  */
	@RequestMapping("go.ad")
	public String gogoAdmin() {
		return "AdminPage/Admain";
	}
	
	/**
	  * @Method Name : 회원 정보 관리 페이지 접근
	  * @작성일 : Apr 2, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 :
	  * @return
	  */
	@RequestMapping("AdMemMani.ad")
	public String AdMemberManager() {
		return "AdminPage/AdMemberManager";
	}
	
	/**
	  * @Method Name : 보증금관리 접근
	  * @작성일 : Apr 2, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 :
	  * @return
	  */
	@RequestMapping("AdDepositeManager.ad")
	public String AdDepositeManager() {
		return "AdminPage/AdDepositeManager";
	}
	
	/**
	  * @Method Name : 자유게시판 관리 접근
	  * @작성일 : Apr 2, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 :
	  * @return
	  */
	@RequestMapping("AdBFree.ad")
	public String AdBoardFree() {
		return "AdminPage/AdBoardFree";
	}
	
	/**
	  * @Method Name : 공지사항 관리 접근
	  * @작성일 : Apr 2, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 :
	  * @return
	  */
	@RequestMapping("AdBNotice.ad")
	public String AdBoardNotice() {
		return "AdminPage/AdBoardNotice";
	}
	
	/**
	  * @Method Name : QnA게시판 관리 접근
	  * @작성일 : Apr 2, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 :
	  * @return
	  */
	@RequestMapping("AdBQnA.ad")
	public String AdBoardQnA() {
		return "AdminPage/AdBoardQnA";
	}
	
	
	
	
	
	
	
}
