package com.kh.doit.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.board.model.vo.Board;
import com.kh.doit.bookShare.model.vo.BookShare;
import com.kh.doit.member.model.dao.myPageDao;
import com.kh.doit.member.model.vo.Member;

@Service("mpService")
public class myPageServiceImpl implements myPageService{
	
	@Autowired
	private myPageDao mpDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int memberUpdate(Member m) {
		return mpDao.memberUpdate(m);
	}

	@Override
	public Member selectOne(String mId) {
		return mpDao.selectOne(mId);
	}

	@Override
	public int deleteMember(String mId) {
		return mpDao.deleteMember(mId);
	}

	@Override
	public ArrayList<Board> selectfbList(String mId) {
		return mpDao.selectfbList(mId);
	}

	@Override
	public ArrayList<BookShare> selectbsList(int mno) {
		return mpDao.selectbsList(mno);
	}



}
