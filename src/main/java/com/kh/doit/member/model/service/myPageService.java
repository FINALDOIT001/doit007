package com.kh.doit.member.model.service;

import java.util.ArrayList;

import com.kh.doit.board.model.vo.Board;
import com.kh.doit.bookShare.model.vo.BookShare;
import com.kh.doit.member.model.vo.Hodu;
import com.kh.doit.member.model.vo.Member;

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



}
