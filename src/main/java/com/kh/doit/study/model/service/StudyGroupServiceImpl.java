package com.kh.doit.study.model.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.member.model.vo.Member;
import com.kh.doit.study.model.dao.StudyGroupDao;
import com.kh.doit.study.model.vo.DailyStudy;
import com.kh.doit.study.model.vo.GroupMember;
import com.kh.doit.study.model.vo.PageInfojung;
import com.kh.doit.study.model.vo.StudyGroup;

@Service("sgService")
public class StudyGroupServiceImpl implements StudyGroupService {

	@Autowired
	private StudyGroupDao sgDao;
	
	
	@Override
	public int getlistCount() {
		
		
		return sgDao.getlistCount();
	}


	/** 페이지 연결 리스트(정호)
	 *
	 */
	@Override
	public ArrayList<StudyGroup> selectList(PageInfojung pi) {
		 
		return sgDao.selectList(pi);
	}



	/**스터디 그룹 인설트(정호)
	 *
	 */
	@Override
	public int sgInsert(StudyGroup sg) {
		// TODO Auto-generated method stub
		return sgDao.sgInsert(sg);
	}
	

	/**
	 * 작성자 : 서정도 
	 */
	@Override
	public StudyGroup selectSg(int sgNo) {
		return sgDao.selectSg(sgNo);
	}


	/**
	 * 작성자 : 서정도
	 */
	@Override
	public ArrayList<Member> memberList(int sgNo) {
		return sgDao.memberList(sgNo);
	}


	/**스터디 그룹 수정 (정호)
	 *
	 */
	@Override
	public int sgUpdate(StudyGroup sg) {
		// TODO Auto-generated method stub
		return sgDao.sgUpdate(sg);
	}


	/**스터디 그룹 수정 디테일 뷰 (정호)
	 *
	 */
	@Override
	public Object sgUpdateView(int sgNo) {
		
		return sgDao.sgUpdateView(sgNo);
	}


	/**스터디 그룹 지우기 (정호)
	 *
	 */
	@Override
	public int sgDelete(int sgNo) {
		
		return sgDao.sgDelete(sgNo);
	}


	/**
	 * 스터디 그룹 탈퇴
	 * 작성자 : 서정도
	 */
	@Override
	public int sgGroupOut(int mno) {
		
		return sgDao.sgGroupOut(mno);
	}


	/**
	 * 스터디 가입
	 * 작성자 : 서정도
	 */
	@Override
	public int sgJoin(GroupMember gm) {

		return sgDao.sgJoin(gm);
	}


	/**
	 * 스터디 시작
	 * 작성자 : 서정도
	 */
	@Override
	public int sgStart(int sgNo) {

		return sgDao.sgStart(sgNo);
	}


	@Override
	public ArrayList<DailyStudy> sgDailySlist(int sgNo) {
		
		return sgDao.sgDailySlist(sgNo);
	}
	
	

}
