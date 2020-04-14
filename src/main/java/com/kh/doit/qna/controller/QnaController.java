package com.kh.doit.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.doit.qna.model.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qService;
	
	@RequestMapping("qna.go")
	private ModelAndView movingQna(ModelAndView mv) {
		
		mv.setViewName("board/qna_list");
		return mv;
	}
	
	

}
