package com.kh.doit.message.model.service;

import java.util.ArrayList;

import com.kh.doit.member.model.vo.Member;
import com.kh.doit.message.model.vo.Message;

public interface MessageService {

	/**
	  * @Method Name : selectrecipientList
	  * @작성일 : Apr 7, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 수신인 목록 불러오기
	  * @param wId
	  * @return
	  */
	ArrayList<Member> selectrecipientList(int wId);

	/**
	  * @Method Name : checkMsRecipientID
	  * @작성일 : Apr 8, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 아이디 적합성 확인
	  * @param checkID
	  * @return
	  */
	int checkMsRecipientID(String checkID);

	/**
	  * @Method Name : msSendMessage
	  * @작성일 : Apr 8, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 보내자 메시지
	  * @param m1
	  * @return
	  */
	int msSendMessage(Message m1);

	/**
	  * @Method Name : selectNewMSList
	  * @작성일 : Apr 9, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 읽지 않은 메시지 불러오기
	  * @param userID
	  * @return
	  */
	ArrayList<Message> selectNewMSList(String userID);

	/**
	  * @Method Name : messageDelete
	  * @작성일 : Apr 9, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 쪽지삭제
	  * @param delList
	  * @return
	  */
	int messageDelete(String[] delList);

}
