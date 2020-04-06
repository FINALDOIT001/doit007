package com.kh.doit.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {
	
	/**
	  * @Method Name : newMessage
	  * @작성일 : Apr 3, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 새창으로 메세지 박스 띄우기
	  * @param mv
	  * @return
	  */
	@RequestMapping("new.ms")
	public String newMessage() {
		return "message/mainMessage";
	}
	
}
