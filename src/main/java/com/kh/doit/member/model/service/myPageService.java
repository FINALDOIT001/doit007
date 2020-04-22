package com.kh.doit.member.model.service;

import java.util.ArrayList;

import com.kh.doit.board.model.vo.Board;
import com.kh.doit.bookShare.model.vo.BookShare;
import com.kh.doit.member.model.vo.Hodu;
import com.kh.doit.member.model.vo.Member;
import com.kh.doit.member.model.vo.TestHodu;
import com.kh.doit.study.model.vo.GroupMember;
import com.kh.doit.study.model.vo.StudyGroup;

public interface myPageService {

	/**
	 * 마이페이지 회원정보 변경
	 * 2020-04-03 김혜림
	 * @param m
	 * @return
	 */
	int memberUpdate(Member m);

	/**
	 * 마이페이지 회원정보 불러오기
	 * 2020-04-06 김혜림
	 * @param mId
	 * @return
	 */
	Member selectOne(String mId);

	/**
	 * 회원 탈퇴
	 * 2020-04-07 김혜림
	 * @param mId
	 * @return
	 */
	int deleteMember(String mId);

	/**
	 * 자유게시판 리스트 불러오기
	 * 2020-04-07 김혜림
	 * @return
	 */
	ArrayList<Board> selectfbList(String mId);

	/**
	 * 책나눔게시판 리스트 불러오기
	 * 2020-04-08 김혜림
	 * @param mId
	 * @return
	 */
	ArrayList<BookShare> selectbsList(int mno);

	/**
	 * 마일리지(호두) 결제하기
	 * 2020-04-10 김혜림
	 * @param hmNo
	 * @return
	 */
	int inserthodu(Hodu hodu);

	/**
	 * 마일리지(호두)리스트 불러오기
	 * 2020-04-10 김혜림
	 * @param mId
	 * @return
	 */
	ArrayList<Hodu> selecthList(String mId);

	/**
	 * 마일리지(호두) 충전 시 member테이블의 mhodu컬럼 업데이트하기
	 * 2020-04-13 김혜림
	 * @param hmNo
	 * @return
	 */
	// int updatemho(int hmNo);

	/**
	 * 호두 충전 Kwon
	 * @param th
	 * @return
	 */
	int updatemho(TestHodu th);

	/**
	 * 호두 갯수 보여주기
	 * 2020-04-13 김혜림
	 * @param mno
	 * @return
	 */
	Member selectHodunum(int mno);
	
	
	/**
	 * hyun 마이페이지스터디리스트
	 * @param gm_mNo
	 * @return
	 */
	ArrayList<StudyGroup> selectsglist(int gm_mNo);

	




}
