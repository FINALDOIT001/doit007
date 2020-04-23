package com.kh.doit.study.model.dao;

import java.sql.Date;
import java.util.ArrayList;


import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.doit.member.model.vo.Member;
import com.kh.doit.study.model.vo.DailyStudy;
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
	
	public ArrayList<Gallery> GalleryList(int sgNo) {
		
		return (ArrayList)sqlSession.selectList("studyGroupMapper.GalleryList",sgNo);
	}

	public Gallery selectGallery(Gallery g) {

		return sqlSession.selectOne("studyGroupMapper.selectGallery",g);
	}

	public ArrayList<Gallery> multiFile(int gNum) {

		return (ArrayList)sqlSession.selectList("studyGroupMapper.multiFile",gNum);
	}

}
