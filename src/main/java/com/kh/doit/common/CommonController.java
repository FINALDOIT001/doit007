package com.kh.doit.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	@RequestMapping("main.go")
	public String headerStart() {
		
		return "common/main";
	}
	
	@RequestMapping("moveDefault.go")
	public String moveDefault() {
		
		return "common/form";
	}
	
	
	
	/** 정호 스터디 인설트폼 링크
	 * @return
	 */
	@RequestMapping("studyInsert.go")
	public String studyInsert() {
		return "study/doitStudyInsertFrom";
	}
	
	
	
	/** 정호 스터디 인설트 스케쥴 폼 링크
	 * @return
	 */
	@RequestMapping("studyInsertSc.go")
	public String studyInsertSc() {
		return "study/doitStudyInsertSchedule";
	}
	
	
	/** 정호 스터디 뒤테 스케  링크
	 * @return
	 */
	@RequestMapping("studySc.go")
	public String studySc() {
		return "study/doitStudy_Schedule";
	}
}
