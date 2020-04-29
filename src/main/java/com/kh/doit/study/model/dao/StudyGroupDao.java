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
import com.kh.doit.study.model.vo.EtcFile;
import com.kh.doit.study.model.vo.Gallery;
import com.kh.doit.study.model.vo.GroupMember;
import com.kh.doit.study.model.vo.PageInfojung;
import com.kh.doit.study.model.vo.StudyCheck;
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

	/**
	 * 자료실 파일 추가
	 * @param etcF
	 * @return
	 */
	public int insertEtcFile(EtcFile etcF) {
		return sqlSession.insert("studyGroupMapper.insertEtcFile", etcF);
	}

	/**
	 * 자료실 리스트 가져오기 Kwon
	 * @param sgNo
	 * @return
	 */
	public ArrayList<Etc> etcList(int sgNo) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.etcList", sgNo);
	}

	public Etc selectEtc(int etcNo) {
		return sqlSession.selectOne("studyGroupMapper.selectEtc", etcNo);
	}

	public ArrayList<EtcFile> selectEtcFile(int etcNo) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.selectEtcFile",etcNo);
	}

	public int deleteEtc(int etcNo) {
		return sqlSession.update("studyGroupMapper.deleteEtc", etcNo);
	}
	
	/**스터디 출첵 멤버 인설트 
	 * 정호가 만든거 
	 * @param sc
	 * @return
	 */
	public int checkMemeberInsert(StudyCheck sc) {
		// TODO Auto-generated method stub
		return sqlSession.insert("studyGroupMapper.cMemeberInsert",sc);
	}

	/**스터디 출첵 인설트 
	 * 정호가 만든거
	 * @param scNo
	 * @return
	 */
	public int studyCheckInsert(int scNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("studyGroupMapper.studyCheckUpdate",scNo);

}
	

	/** 스터디 출첵 저장된 리스트 불러오기
	 *  정호
	 * @param ssNo
	 * @return
	 */
	public ArrayList<StudyCheck> studyCheckList(int ssNo) {
		System.out.println("Dao 번호 들어가니? " +ssNo);
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("studyGroupMapper.studyCheckList", ssNo);
	}

	/**스터디 출첵 수정 가즈아~
	 * 정호
	 * @param scNo
	 * @return
	 */
	public int StudyCheckDefault(int ssNo) {
		
		return sqlSession.update("studyGroupMapper.StudyCheckDefault",ssNo);
	}
	
	public int sgDataBoardAndGalleryPayment(int sgNo) {

		return sqlSession.update("studyGroupMapper.sgDataBoardAndGalleryPayment", sgNo);
	}

	public int mDataBoardAndGalleryPayment(int mNo) {

		return sqlSession.update("studyGroupMapper.mDataBoardAndGalleryPayment", mNo);
	}

	public void sgJoinMember(int sgNo) {
		
		sqlSession.update("studyGroupMapper.sgJoinMember", sgNo);
	}

	public void sgJoinHodu(Member m) {
		
		sqlSession.update("studyGroupMapper.sgJoinHodu", m);
	}

	public int sgGroupOutCount(int sgNo) {
		
		return sqlSession.update("studyGroupMapper.sgGroupOutCount", sgNo);
	}

}
