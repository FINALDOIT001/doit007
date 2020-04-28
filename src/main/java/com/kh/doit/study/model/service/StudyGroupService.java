package com.kh.doit.study.model.service;

import java.util.ArrayList;

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

public interface StudyGroupService {

	/**학생 그룹 리스트 갯수 조회
	 * @return
	 */
	int getlistCount();

	/**학생 그룹 리스트 조회(정호)
	 * @param pi
	 * @return
	 */
	ArrayList<StudyGroup> selectList(PageInfojung pi);

	/**학생 그룹 리스트 인설트(정호)
	 * @param sg
	 * @return
	 */
	int sgInsert(StudyGroup sg);
	
	
	/**
	 * 게시글 디테일 조회
	 * 작성자 : 서정도
	 * @param sgNo
	 * @return
	 */ 
	StudyGroup selectSg(int sgNo);

	/**
	 * 참여자 조회
	 * @param sgNo
	 * @return
	 */ 
	ArrayList<Member> memberList(int sgNo);

	
	/** 스터디그룹 수정(정호)
	 * @param sg
	 * @return
	 */
	int sgUpdate(StudyGroup sg);

	/**스터디 그룹 수정 뷰(정호)
	 * @param sgNo
	 * @return
	 */
	Object sgUpdateView(int sgNo);

	/**스터티 그룹 삭제(정호)
	 * @param sgNo
	 * @return
	 */
	int sgDelete(int sgNo);

	/**
	 * 스터디 그룹 탈퇴
	 * 작성자 : 서정도
	 * @param sgNo
	 * @return
	 */
	int sgGroupOut(int mno);

	/**
	 * 스터디 가입
	 * 작성자 : 서정도
	 * @param mno
	 * @param sgNo
	 * @return
	 */
	int sgJoin(GroupMember gm);

	/**
	 * 스터디 시작
	 * 작성자 : 서정도
	 * @param sgNo
	 * @return
	 */
	int sgStart(int sgNo);
	
	/**
	 * 사진 업로드
	 * 작성자 : 서정도
	 * @param g
	 * @return
	 */
	int photoUpload(Gallery g);

	/***이것슨 스터디 스케쥴 리스트 불러오기
	 * 정호가 만든겨
	 * @param sgNo
	 * @return
	 */
	ArrayList<DailyStudy> sgDailySlist(int sgNo);

	/**이것슨 스터디 스케쥴 리스트 저장하기
	 * 정호가 만든겨
	 * @param ds
	 * @return
	 */
	int dailyStudyinsert(DailyStudy ds);

	/*이것슨 스터디 스케줄 디테일
	 * 정호
	 * @param ssNo
	 * @return
	 */
	DailyStudy dailyStudyView(int ssNo);

	/**이것슨 스터디 스케줄 업데이트
	 * 정호
	 * @param ds
	 * @return
	 */
	int dailyStudyUpdate(DailyStudy ds);

	/**이것슨 스터디 스케줄 지우기
	 * 정호
	 * @param ssNo
	 * @return
	 */
	int dailyStudyDelete(String ssNo);

	/**이것슨 스터디 좋아유 insert
	 * 정호가 만든것이여
	 * @param sl
	 * @return
	 */
	int studyLikeInsert(StudyLike sl);

	/**이것슨 스터디 좋아유 Delete
	 * 정호가 만든것이여
	 * @param slNo
	 * @return
	 */
	int studyLikeDelete(int slNo);

	/**이것슨 스터디 좋아유 list
	 * @param slNo
	 * @return
	 */
	StudyLike studyLikeList(String slNo);
	
	/**
	 * Gallery List
	 * 작성자 : 서정도
	 * @return
	 */
	ArrayList<Gallery> GalleryList(int sgNo);

	/**
	 * Gallery Detail
	 * 작성자 : 서정도
	 * @param g
	 * @return
	 */
	Gallery selectGallery(Gallery g);

	/**
	 * Gallery Detail / Multi-File(Photo)
	 * @param gNo
	 * @return
	 */
	ArrayList<Gallery> multiFile(int gNum);
	
	/**
	 * 검색으로 리스트 카운트 가져오기 Kwon
	 * 2020.04.23 KH
	 * @param ssSearch
	 * @return
	 */
	int getSearchListCount(String ssSearch);

	/**
	 * 검색으로 리스트 가져오기 Kwon
	 * @param pi
	 * @param ssSearch
	 * @return
	 */
	ArrayList<StudyGroup> selectSearchList(PageInfojung pi, String ssSearch);

	/**
	 * 자료실 추가 Kwon
	 * @param etc
	 * @return
	 */
	int insertEtc(Etc etc);



	/**
	 * 자료실 파일추가 Kwon
	 * @param etcF
	 * @return
	 */
	int insertEtcFile(EtcFile etcF);

	/**
	 * 자료실 리스트 가져오기 Kwon
	 * @param sgNo
	 * @return
	 */
	ArrayList<Etc> etcList(int sgNo);

	
	// 자료실 보기
	Etc selectEtc(int etcNo);

	ArrayList<EtcFile> selectEtcFile(int etcNo);

	/**
	 * 삭제하기 Kwon
	 * @param etcNo
	 * @return
	 */
	int deleteEtc(int etcNo);
	
	/** 스터디 출석체크 멤버 정보 인설트
	 * 정호가 만듬
	 * @param sc
	 * @return
	 */
	int checkMemeberInsert(StudyCheck sc);

	/** 스터디 출석 체크 정보 입력
	 * 정호가 만듬
	 * @param scNo
	 * @return
	 */
	int studyCheckInsert(int scNo);
	
	/**출첵한 member 리스트 불러오기 method
	 * 정호
	 * @param sc
	 * @return
	 */
	ArrayList<StudyCheck> studyCheckList(int ssNo);


	/**출첵 수정 하기전 디폴트 만들기
	 * @param ssNo
	 * @return
	 */
	int StudyCheckDefault(int ssNo);

	int sgDataBoardAndGalleryPayment(int sgNo);

	int mDataBoardAndGalleryPayment(int mNo);

	void sgJoinMember(int sgNo);

	void sgJoinHodu(Member m);
	
	
	


}
