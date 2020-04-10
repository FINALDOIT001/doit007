package com.kh.doit.study.model.service;

import java.util.ArrayList;

import com.kh.doit.member.model.vo.Member;
import com.kh.doit.study.model.vo.GroupMember;
import com.kh.doit.study.model.vo.PageInfojung;
import com.kh.doit.study.model.vo.StudyGroup;

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
	

	
	
	


}
