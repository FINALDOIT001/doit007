package com.kh.doit.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.board.model.vo.Board;
import com.kh.doit.bookShare.model.vo.BookShare;
import com.kh.doit.member.model.dao.myPageDao;
import com.kh.doit.member.model.vo.Hodu;
import com.kh.doit.member.model.vo.Member;
import com.kh.doit.member.model.vo.TestHodu;
import com.kh.doit.qna.model.vo.Qna;
import com.kh.doit.study.model.vo.GroupMember;
import com.kh.doit.study.model.vo.StudyGroup;

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

	@Override
	public int inserthodu(Hodu hodu) {
		return mpDao.inserthodu(hodu);
	}

	@Override
	public ArrayList<Hodu> selecthList(String mId) {
		return mpDao.selecthList(mId);
	}

//	@Override
//	public int updatemho(int hmNo) {
//		return mpDao.updateho(hmNo);
//	}

	@Override
	public int updatemho(TestHodu th) {
		return mpDao.updatemho(th);
	}

	@Override
	public Member selectHodunum(int mno) {
		return mpDao.selectHodunum(mno);
	}


	@Override
	public ArrayList<StudyGroup> selectsglist(int gm_mNo) {
		return mpDao.selectsglist(gm_mNo);
	}

	@Override
	public ArrayList<StudyGroup> selectsllist(int mno) {
		return mpDao.selectsllist(mno);
	}

	@Override
	public ArrayList<Qna> selectqnalist(int mno) {
		return mpDao.selectqnalist(mno);
	}

	@Override
	public int hoduRefundgo(Hodu h) {
		return mpDao.hoduRefundgo(h);
	}

	@Override
	public int minusHodu(Hodu h) {
		return mpDao.minusHodu(h);
	}



}
