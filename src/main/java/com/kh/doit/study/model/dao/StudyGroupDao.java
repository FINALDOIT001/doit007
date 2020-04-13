package com.kh.doit.study.model.dao;

import java.sql.Date;
import java.util.ArrayList;


import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.doit.member.model.vo.Member;
import com.kh.doit.study.model.vo.GroupMember;
import com.kh.doit.study.model.vo.PageInfojung;
import com.kh.doit.study.model.vo.StudyGroup;

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
		
		return sqlSession.update("studyGroupMapper.sgStart", sgNo);
	}

}
