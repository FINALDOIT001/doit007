package com.kh.doit.message.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.member.model.vo.Member;
import com.kh.doit.message.model.dao.MessageDao;
import com.kh.doit.message.model.vo.Message;

@Service("msService")
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageDao msDao;
	
	@Override
	public ArrayList<Member> selectrecipientList(int wId) {
		
		return msDao.selectrecipientList(wId);
	}

	@Override
	public int checkMsRecipientID(String checkID) {
		
		return msDao.checkMsRecipientID(checkID);
	}

	@Override
	public int msSendMessage(Message m1) {
		
		return msDao.msSendMessage(m1);
	}

	@Override
	public ArrayList<Message> selectNewMSList(String userID) {
		
		return msDao.selectNewMSList(userID);
	}

	@Override
	public int messageDelete(String[] delList) {
		
		return msDao.messageDelete(delList);
	}


}
