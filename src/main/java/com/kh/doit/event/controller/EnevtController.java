package com.kh.doit.event.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("eventView.go")
	public ModelAndView eventView(ModelAndView mv, Event e, EventReply er, int eNo) {
		
		
		
		return mv; // 객체 하나 가져오기
	}
	

}
