package com.kh.doit.event.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.doit.bookShare.model.vo.BookShareReply;
import com.kh.doit.common.commonFile;
import com.kh.doit.event.common.EventPagination;
import com.kh.doit.event.model.service.EventService;
import com.kh.doit.event.model.vo.Event;
import com.kh.doit.event.model.vo.EventPageInfo;
import com.kh.doit.event.model.vo.EventReply;

@Controller
public class EventController {
	
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
	
	/**
	 * 1-2. 댓글 리스트 가져오기 Kwon
	 * 2020.04.07 KH
	 * @param response
	 * @param eNo
	 * @throws JsonIOException
	 * @throws IOException
	 */
	@RequestMapping("eReply.do")
	public void selectReplyList(HttpServletResponse response, int eNo) throws JsonIOException, IOException {
	
		ArrayList<BookShareReply> rList = eService.selectReplyList(eNo);
		
		System.out.println("Servlet 댓글 리스트 : " + rList);
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(rList,response.getWriter());
		
	}

	
	
	/**
	 * 2. 이벤트 Detail 페이지 들어가기 KWON (로그인 필요, Interceptor 사용)
	 * 2020.04.08 KH
	 * @param mv
	 * @param ev
	 * @param er
	 * @param eNo
	 * @return
	 */
	@RequestMapping("eventView.ev")
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
	
	
	/**
	 * 이벤트 댓글 추가 Kwon
	 * 2020.04.07 KH
	 * @param er
	 * @return
	 */
	@RequestMapping("addEvReply.do")
	@ResponseBody
	public String addEvReply(EventReply er) {
		System.out.println("Servlet Ev댓글추가 : " + er);
		int result = eService.insertReply(er);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
		
	}
	
	/**
	 * Move to InsertPage Kwon
	 * 2020.04.07 KH
	 * @return
	 */
	@RequestMapping("evInsert.go")
	public String goInsertPage() {
		return "event/eventInsert";
	}
	
	
	
	/**
	 * Insert EventPage Kwon
	 * 2020.04.08 KH
	 * @param e
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("eventInsert.do")
	public String insertEvent(Event e, HttpServletRequest request, 
			@RequestParam(name="evFileName", required=false) MultipartFile file) {
		commonFile cf = new commonFile();
		
		System.out.println("Serlvet Insert Event : " + e);
		
		// 들어온 파일값이 공백이 아니면
		if (!file.getOriginalFilename().equals("")) {
			// 서버에 업로드
			// saveFile메소드 : 내가 저장하고자 하는 file과 request를 전달하여 서버에 업로드시키고 그 저장된 파일명을 반환해주는 메소드

			String renameFileName = cf.saveFile(file, request, "evUploadFiles"); // 아래쪽에 메소드로 새로 빼준다

			if (renameFileName != null) {
				e.seteOriginalFileName(file.getOriginalFilename());
				e.seteRenameFileName(renameFileName);
			}
			
		}
		System.out.println("Servlet Event 추가 : " + e);
		
		int result = eService.insertEvent(e);
		
		if (result > 0) {
			return "redirect:elist.go";
		} else {
			return "common/errorPage";
		}
		
	}
	
	
	@RequestMapping("eUpdate.go")
	public ModelAndView updatePage(ModelAndView mv, Event ev, int eNo) {
		
		ev = eService.selectEvent(eNo);
		
		mv.addObject("ev", ev);
		mv.setViewName("event/updatePage");
		
		return mv;
	}
	
	
	

}
