package com.kh.doit.event.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.doit.bookShare.model.vo.BookShareReply;
import com.kh.doit.event.common.EventPagination;
import com.kh.doit.event.model.service.EventService;
import com.kh.doit.event.model.vo.Event;
import com.kh.doit.event.model.vo.EventPageInfo;
import com.kh.doit.event.model.vo.EventReply;

@Controller
public class EnevtController {
	
	@Autowired
	private EventService eService;
	
	
	/**
	 * 1. 이벤트 리스트 가져오기
	 * @param mv
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("elist.go")
	public ModelAndView eventList(ModelAndView mv,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		
		System.out.println("Servlet currentPage : " + currentPage);

		int listCount = eService.getListCount();
		
		System.out.println("Servlet Event listCount : " + listCount);
		
		EventPageInfo epi = EventPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Event> list = eService.selectList(epi);
		
		System.out.println("Servlet 이벤트 리스트 : " + list);
		System.out.println("Servlet epi : " + epi);
		
		mv.addObject("list",list);
		mv.addObject("epi",epi);
		mv.setViewName("event/eventList");
		
		return mv;
	}
	
	@RequestMapping("eReply.do")
	public void selectReplyList(HttpServletResponse response, int eNo) throws JsonIOException, IOException {
	
		ArrayList<BookShareReply> rList = eService.selectReplyList(eNo);
		
		System.out.println("Servlet 댓글 리스트 : " + rList);
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(rList,response.getWriter());
		
	}

	
	
	@RequestMapping("eventView.go")
	public ModelAndView eventView(ModelAndView mv, Event ev, EventReply er, int eNo) {
		
		ev = eService.selectEvent(eNo);
		
		if(ev != null) {
			mv.addObject("ev",ev);
			mv.setViewName("event/eventView");
		} else {
			mv.addObject("msg", "이벤트 상세보기 실패!!");
			mv.setViewName("common/errorPage");
		}
		
		return mv; // 객체 하나 가져오기
	}
	

}
