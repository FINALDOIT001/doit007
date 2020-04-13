package com.kh.doit.message.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.doit.member.model.vo.Member;
import com.kh.doit.message.model.vo.Message;

@Repository("msDao")
public class MessageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectrecipientList(int wId) {
		
		return (ArrayList)sqlSession.selectList("messageMapper.selectrecipientList",wId);
	}

	public int checkMsRecipientID(String checkID) {
		
		return sqlSession.selectOne("messageMapper.checkMsRecipientID",checkID);
	}

	public int msSendMessage(Message m1) {
		
		return sqlSession.insert("messageMapper.msSendMessage",m1);
	}

	public ArrayList<Message> selectNewMSList(String userID) {
		
		return (ArrayList)sqlSession.selectList("messageMapper.selectNewMSList",userID);
	}

	public int messageDelete(String[] delList) {
		
		return sqlSession.delete("messageMapper.messageDelete",delList);
	}

	public ArrayList<Message> selectReceiveMSList(String userID) {
		
		return (ArrayList)sqlSession.selectList("messageMapper.selectReceiveMSList",userID);
	}

	public ArrayList<Message> selectSendMSList(String userID) {
		
		return (ArrayList)sqlSession.selectList("messageMapper.selectSendMSList",userID);
	}

	public Message msDetailView(int ms_No) {
		
		return sqlSession.selectOne("messageMapper.msDetailView",ms_No);
	}

	public int msReadCheck(int ms_No) {
		
		return sqlSession.update("messageMapper.msReadCheck",ms_No);
	}



}
