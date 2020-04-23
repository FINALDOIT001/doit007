package com.kh.doit.study.model.dao;

import java.sql.Date;
import java.util.ArrayList;


import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.doit.member.model.vo.Member;
import com.kh.doit.study.model.vo.DailyStudy;
import com.kh.doit.study.model.vo.Etc;
import com.kh.doit.study.model.vo.Gallery;
import com.kh.doit.study.model.vo.GroupMember;
import com.kh.doit.study.model.vo.PageInfojung;
import com.kh.doit.study.model.vo.StudyGroup;
import com.kh.doit.study.model.vo.StudyLike;

@Repository("sgDao")
public class StudyGroupDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getlistCount() {
		
		return sqlSession.selectOne("studyGroupMapper.getlistCount");
	}

	public ArrayList<StudyGroup> selectList(PageInfojung pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBound = new RowBounds(offset,pi.getBoardLimit());
		
		return(ArrayList)sqlSession.selectList("studyGroupMapper.selectList",null,rowBound);
	}

	public int sgInsert(StudyGroup sg) {
		
		return sqlSession.insert("studyGroupMapper.sgInsert", sg);
	}

	
	/**
	 * 작성자 : 서정도
	 * @param sgNo
	 * @return
	 */
	public StudyGroup selectSg(int sgNo) {
		 
		return sqlSession.selectOne("studyGroupMapper.selectSg", sgNo);
	}

	/**
	 * 작성자 : 서정도
	 * @param sgNo
	 * @return
	 */
	public ArrayList<Member> memberList(int sgNo) {

		return (ArrayList)sqlSession.selectList("studyGroupMapper.memberList", sgNo);
	}

	public int sgUpdate(StudyGroup sg) {
		
		return sqlSession.update("studyGroupMapper.sgUpdate", sg);
	}

	public Object sgUpdateView(int sgNo) {
		
		return sqlSession.selectOne("studyGroupMapper.selectSg",sgNo);
	}

	public int sgDelete(int sgNo) {
		
		return sqlSession.update("studyGroupMapper.sgDelete", sgNo);
	}

	public int sgGroupOut(int mno) {

		return sqlSession.delete("studyGroupMapper.sgGroupOut", mno);
	}

	public int sgJoin(GroupMember gm) {
		
		return sqlSession.insert("studyGroupMapper.sgJoin", gm);
	}
	
	public int sgStart(int sgNo) {
		System.out.println("dao : "+sgNo);
		
		return sqlSession.update("studyGroupMapper.sgStart", sgNo);
	}

	public ArrayList<DailyStudy> sgDailySlist(int sgNo) {
		
		return (ArrayList)sqlSession.selectList("studyGroupMapper.sgDailySlist", sgNo);
	}
	
	public int photoUpload(Gallery g) {
		
		return sqlSession.insert("studyGroupMapper.photoUpload", g);
	}

	public int dailyStudyinsert(DailyStudy ds) {
		// TODO Auto-generated method stub
		return sqlSession.insert("studyGroupMapper.sgDailyinsert",ds);
	}

	public DailyStudy dailyStudyView(int ssNo) {
		
		return sqlSession.selectOne("studyGroupMapper.dailyStudyView",ssNo);
	}

	public int dailyStudyUpdate(DailyStudy ds) {
		
		return sqlSession.update("studyGroupMapper.dailyStudyUpdate", ds);
	}

	public int dailyStudyDelete(String ssNo) {
		
		return sqlSession.delete("studyGroupMapper.dailyStudyDelete",ssNo);
	}

	public int studyLikeInsert(StudyLike sl) {
		
		return sqlSession.insert("studyGroupMapper.studyLikeInsert", sl);
	}

	public int studyLikeDelete(int slNo) {
		
		return sqlSession.delete("studyGroupMapper.studyLikeDelete",slNo);
	}

	public StudyLike studyLikeList(String slNo) {
	
		
		return sqlSession.selectOne("studyGroupMapper.studyLikeList", slNo);
	}

	/**
	 * 검색 리스트 카운트 가져오기 Kwon
	 * 2020.04.23 KH
	 * @param ssSearch
	 * @return
	 */
	public int getSearchListCount(String ssSearch) {
		return sqlSession.selectOne("studyGroupMapper.searchCount", ssSearch);
	}

	/**
	 * 검색 리스트 가져오기 Kwon
	 * 2020.04.23 KH
	 * @param pi
	 * @param ssSearch
	 * @return
	 */
	public ArrayList<StudyGroup> selectSearchList(PageInfojung pi, String ssSearch) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBound = new RowBounds(offset,pi.getBoardLimit());
		
		return(ArrayList)sqlSession.selectList("studyGroupMapper.selectSearchList", ssSearch, rowBound);
	}

	/**
	 * 자료실 글 추가 Kwon
	 * 2020.04.23 KH
	 * @param etc
	 * @return
	 */
	public int inserEtc(Etc etc) {
		return sqlSession.insert("studyGroupMapper.insertEtc", etc);
	}

}
