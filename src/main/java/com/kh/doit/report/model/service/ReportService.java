package com.kh.doit.report.model.service;

import java.util.ArrayList;

import com.kh.doit.report.model.vo.Report;

public interface ReportService {

	/**
	  * @Method Name : Write
	  * @작성일 : Apr 21, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 마구 신고각
	  * @return
	  */
	int Write(Report r);

	/**
	  * @Method Name : gogoAdmin
	  * @작성일 : Apr 28, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 신고를 위한 리스트 불러오기
	  * @return
	  */
	ArrayList<Report> gogoAdmin();

	/**
	  * @Method Name : MemberReport
	  * @작성일 : Apr 29, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 신고된 회원 불러오기
	  * @return
	  */
	ArrayList<Report> MemberReport();

	/**
	  * @Method Name : BookShareReport
	  * @작성일 : Apr 29, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 신고된 북쉐어 불러오기
	  * @return
	  */
	ArrayList<Report> BookShareReport();

	/**
	  * @Method Name : FreeBoardReport
	  * @작성일 : Apr 29, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 신고된 자유게시판 불러오기
	  * @return
	  */
	ArrayList<Report> FreeBoardReport();

	/**
	  * @Method Name : QnaReport
	  * @작성일 : Apr 29, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 신고큐엔에이
	  * @return
	  */
	ArrayList<Report> QnaReport();

	/**
	  * @Method Name : FBdelete
	  * @작성일 : Apr 30, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 자유게 신고 y처리
	  * @param delList
	  * @return
	  */
	int FBdelete(String[] delList);

	/**
	  * @Method Name : banUser
	  * @작성일 : Apr 30, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 유저 정지
	  * @param delList
	  * @return
	  */
	int banUser(String[] delList);

	/**
	  * @Method Name : salvation
	  * @작성일 : Apr 30, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 구제
	  * @param delList
	  * @return
	  */
	int salvation(String[] delList);

	/**
	  * @Method Name : FBdelete2
	  * @작성일 : Apr 30, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 사그조
	  * @param delList
	  * @return
	  */
	int FBdelete2(String[] delList);

	/**
	  * @Method Name : AdDepositeManager
	  * @작성일 : Apr 30, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 신고된 그룹스터디 접근
	  * @return
	  */
	ArrayList<Report> AdDepositeManager();
	
	
	
}
