package com.kh.doit.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.doit.member.model.vo.Member;
import com.kh.doit.message.model.service.MessageService;
import com.kh.doit.message.model.vo.Message;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService msService;
	
	
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
	public String mainpage() {
		return "message/mainMessage";
	}
	
	/**
	  * @Method Name : newMS
	  * @작성일 : Apr 7, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 메시지 작성 페이지 접근
	  * @return
	  */
	@RequestMapping("newMS.ms")
	public String newMS() {
		return "message/MsNewmessage";
	}
	
	/**
	  * @Method Name : getRecipientList
	  * @작성일 : Apr 8, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 회원 정보 불러오기
	  * @param response
	  * @param wId
	  * @throws JsonIOException
	  * @throws IOException
	  */
	@RequestMapping("recipientList.ms")
	public void getRecipientList(HttpServletResponse response, @RequestParam int wId) throws JsonIOException, IOException {
		
		ArrayList<Member> list = msService.selectrecipientList(wId);
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().create();
		
		gson.toJson(list,response.getWriter());
		
	}
	
	/**
	  * @Method Name : checkMsRecipientID
	  * @작성일 : Apr 8, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 아이디 체크하면서 바로 보내버리기.
	  * @param response
	  * @param checkID
	  * @param title
	  * @param context
	  * @throws JsonIOException
	  * @throws IOException
	  */
	@RequestMapping("msCheckId.ms")
	public void checkMsRecipientID(HttpServletResponse response, 
								@RequestParam String sender,
								@RequestParam String checkID,
								@RequestParam String title,
								@RequestParam String context) throws JsonIOException, IOException {
		
		int result = msService.checkMsRecipientID(checkID);
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().create();
		
		ArrayList<String> list = new ArrayList<>();
		
		if( result == 1 ) {
			
			if( context.equals("") ) {
				context = "[내용 없음]";
			}
			
			if( title.equals("") ) {
				title = "제목 없음.";
			}
			
			Message m1 = new Message(sender,checkID,title,context);
			
			int result2 = msService.msSendMessage(m1);
			
			if( result == 1 ) {
				list.add("ok");
				list.add(checkID);
			}else {
				list.add("no");
				list.add(checkID);
			}
			
		}else {
			list.add("no");
			list.add(checkID);
		}
		
		gson.toJson(list,response.getWriter());
		
	}
	
	@RequestMapping("ReceivenewPage.ms")
	public String ReceivenewPage() {
		return "message/msReceivenewPage";
	}
	
}
