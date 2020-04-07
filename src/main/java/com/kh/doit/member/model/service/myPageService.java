package com.kh.doit.member.model.service;

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

	int deleteMember(String mId);



}
