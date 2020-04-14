package com.kh.doit.qna.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.doit.qna.model.service.QnaService;
import com.kh.doit.qna.model.vo.Qna;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qService;
	
	@Autowired
	private Qna qna;
	
	/**
	 * 1. QNA 리스트 가져오기 Kwon
	 * 2020.04.14 KH
	 * @param mv
	 * @return
	 */
	@RequestMapping("qna.go")
	private ModelAndView movingQna(ModelAndView mv) {
		
		ArrayList<Qna> list = qService.selectQnaList();
		System.out.println("Servlet Qna List : " + list);
		
		mv.addObject("qlist", list);
		mv.setViewName("board/qna_list");
		return mv;
	}
	
	@RequestMapping("qnaView.ev")
	private ModelAndView detailEvent(ModelAndView mv, int qno) {
		
		qna = qService.selectQna(qno);
		
		if (qna != null) {
			mv.addObject("qna",qna);
			mv.setViewName("board/qna_view");
		} else {
			mv.addObject("msg","QNA 상세보기에 실패했습니다");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	

}
