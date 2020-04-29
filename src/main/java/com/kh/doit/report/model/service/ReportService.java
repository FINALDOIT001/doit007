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
	
	
	
}
