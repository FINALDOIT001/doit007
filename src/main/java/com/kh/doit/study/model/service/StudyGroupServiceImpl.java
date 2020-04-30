package com.kh.doit.study.model.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.member.model.vo.Member;
import com.kh.doit.study.model.dao.StudyGroupDao;
import com.kh.doit.study.model.vo.DailyStudy;
import com.kh.doit.study.model.vo.Etc;
import com.kh.doit.study.model.vo.EtcFile;
import com.kh.doit.study.model.vo.Gallery;
import com.kh.doit.study.model.vo.GroupMember;
import com.kh.doit.study.model.vo.PageInfojung;
import com.kh.doit.study.model.vo.StudyCheck;
import com.kh.doit.study.model.vo.StudyGroup;
import com.kh.doit.study.model.vo.StudyLike;

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
	
	/**
	 * 사진 업로드
	 * 작성자 : 서정도
	 */
	@Override
	public int photoUpload(Gallery g) {
		return sgDao.photoUpload(g);
	}


	/**이것슨 스터디 스케쥴 리스트 불러오기
	 * 정호가 만든겨
	 *
	 */
	@Override
	public ArrayList<DailyStudy> sgDailySlist(int sgNo) {
		
		return sgDao.sgDailySlist(sgNo);
	}


	/**이것슨 스터디 스케쥴 리스트 저장하기
	 * 정호가 만든겨
	 *
	 */
	@Override
	public int dailyStudyinsert(DailyStudy ds) {
		return sgDao.dailyStudyinsert(ds);
	}


	/**이것은 스터디 스케쥴 디테일
	 * 정호
	 *
	 */
	@Override
	public DailyStudy dailyStudyView(int ssNo) {
		// TODO Auto-generated method stub
		return sgDao.dailyStudyView(ssNo);
	}


	/**이것은 스터디 스케쥴 업데이트
	 *정호
	 */
	@Override
	public int dailyStudyUpdate(DailyStudy ds) {
		
		return sgDao.dailyStudyUpdate(ds);
	}


	/**이것은 스터디 스케쥴 지우기
	 *정호
	 */
	@Override
	public int dailyStudyDelete(String ssNo) {
		
		return sgDao.dailyStudyDelete(ssNo);
	}


	/**이것은 스터디 좋아요 insert
	 *정호가 만든것이여
	 */
	@Override
	public int studyLikeInsert(StudyLike sl) {
		
		return sgDao.studyLikeInsert(sl);
	}


	/**이것은 스터디 좋아요 Delete
	 * 정호가 만든것
	 */
	@Override
	public int studyLikeDelete(int slNo) {
		
		return sgDao.studyLikeDelete(slNo);
	}


	/**이것은 스터디 좋아요 list
	 * 정호가 만든것이여
	 */
	@Override
	public StudyLike studyLikeList(String slNo) {
		
		return  sgDao.studyLikeList(slNo);
	}

	/**
	 * Gallery List
	 * 작성자 : 서정도
	 * @return
	 */
	@Override
	public ArrayList<Gallery> GalleryList(int sgNo) {

		return sgDao.GalleryList(sgNo);
	}

	/**
	 * Gallery Detail
	 * 작성자 : 서정도
	 * @param gNo
	 * @return
	 */
	@Override
	public Gallery selectGallery(Gallery g) {

		return sgDao.selectGallery(g);
	}

	/**
	 * Gallery Detail / Multi-File(Photo)
	 * @param gNo
	 * @return
	 */
	@Override
	public ArrayList<Gallery> multiFile(int gNum) {
		
		return sgDao.multiFile(gNum);
	}

	/**
	 * 스터디 검색 카운트 가져오기 Kwon
	 */
	@Override
	public int getSearchListCount(String ssSearch) {
		return sgDao.getSearchListCount(ssSearch);
	}


	/**
	 * 검색한 스터디 리스트 가져오기 Kwon
	 */
	@Override
	public ArrayList<StudyGroup> selectSearchList(PageInfojung pi, String ssSearch) {
		return sgDao.selectSearchList(pi, ssSearch);
	}


	/**
	 * 자료실 글 추가 Kwon
	 */
	@Override
	public int insertEtc(Etc etc) {
		return sgDao.inserEtc(etc);
	}

	/**
	 * 자료실 파일추가 Kwon
	 */
	@Override
	public int insertEtcFile(EtcFile etcF) {
		return sgDao.insertEtcFile(etcF);
	}


	/**
	 * 자료실 리스트 가져오기 Kwon
	 */
	@Override
	public ArrayList<Etc> etcList(int sgNo) {
		return sgDao.etcList(sgNo);
	}


	
	// 자료실 가져오기 1
	@Override
	public Etc selectEtc(int etcNo) {
		return sgDao.selectEtc(etcNo);
	}


	// 자료실 가져오기 2
	@Override
	public ArrayList<EtcFile> selectEtcFile(int etcNo) {
		return sgDao.selectEtcFile(etcNo);
	}


	@Override
	public int deleteEtc(int etcNo) {
		return sgDao.deleteEtc(etcNo);
	}
	
	/** 스터디 출첵 멤버 인설트 
	 * 정호가 만든거
	 *
	 */
	@Override
	public int checkMemeberInsert(StudyCheck sc) {
		
		return sgDao.checkMemeberInsert(sc);
	}


	/** 스터디 출첵 인설트
	 * 정호가 만든거
	 */
	@Override
	public int studyCheckInsert(int scNo) {
		// TODO Auto-generated method stub
		return sgDao.studyCheckInsert(scNo);
	}
	
	/**출첵한 member 리스트 불러오기 method
	 * 정호
	 *
	 */
	@Override
	public ArrayList<StudyCheck> studyCheckList(int ssNo) {
		// TODO Auto-generated method stub
		return sgDao.studyCheckList(ssNo);
	}


	/**출첵 수정하기전 디폴트 만들기
	 *
	 */
	@Override
	public int StudyCheckDefault(int ssNo) {
		
		return sgDao.StudyCheckDefault(ssNo);
	}
	
	@Override
	public int sgDataBoardAndGalleryPayment(int sgNo) {

		return sgDao.sgDataBoardAndGalleryPayment(sgNo);
	}


	@Override
	public int mDataBoardAndGalleryPayment(int mNo) {

		return sgDao.mDataBoardAndGalleryPayment(mNo);
	}


	@Override
	public void sgJoinMember(int sgNo) {
		
		sgDao.sgJoinMember(sgNo);
	}


	@Override
	public void sgJoinHodu(Member m) {
		
		sgDao.sgJoinHodu(m);
	}


	@Override
	public int sgGroupOutCount(int sgNo) {
		// TODO Auto-generated method stub
		return sgDao.sgGroupOutCount(sgNo);
	}

	@Override
	public ArrayList<StudyGroup> AdDepositeManager() {
		
		return sgDao.AdDepositeManager();
	}


	@Override
	public int FSGDelete(String[] delList) {
		return sgDao.FSGDelete(delList);
	}
	

}
