package com.kh.doit.report.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.doit.board.common.Pagination_ha;
import com.kh.doit.board.model.service.BoardService;
import com.kh.doit.board.model.vo.Board;
import com.kh.doit.board.model.vo.PageInfo_ha;
import com.kh.doit.report.model.service.ReportService;
import com.kh.doit.report.model.vo.Report;

@Controller
public class ReportController {
	
	@Autowired
	private BoardService bService2;
	
	@Autowired
	private ReportService rpService;

	@RequestMapping(value="report.rp",method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView report(ModelAndView mv,
						HttpServletRequest request,
						HttpServletResponse response,
						Report r
			) {

		mv.addObject("r",r);
		mv.setViewName("report/reportPage");

		return mv;
	}
	
	@RequestMapping(value="Write.rp",method= {RequestMethod.GET, RequestMethod.POST})
	public void Write(Model m,
						HttpServletRequest request,
						HttpServletResponse response,
						String rpWriter,
						String rpUserID,
						String rpTitle,
						String rpBno,
						String rpBType,
						String rpCotext,
						String rpCotextDetail
			) throws JsonIOException, IOException {
		
//		System.out.println(rpWriter);
//		System.out.println(rpUserID);
//		System.out.println(rpTitle);
//		System.out.println(rpBno);
//		System.out.println(rpBType);
//		System.out.println(rpCotext);
//		System.out.println(rpCotextDetail);
		
		String context = "";
		
		if(rpCotext.equals("기타")) {
			context = rpCotextDetail;
		}else {
			context = rpCotext;
		}
		
		Report r = new Report(
					rpWriter,
					rpUserID,
					rpTitle,
					Integer.parseInt(rpBno),
					rpBType,
					context
				);
		
		int result = rpService.Write(r);
		
		String resulrStr = "";
		
		if(result > 0) {
			resulrStr = rpUserID + " 신고 완료. ";
		}else {
			resulrStr = "신고 실패";
		}
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().create();
		
		gson.toJson(resulrStr,response.getWriter());
		
	}
	
	
	/**
	  * @Method Name : 메인페이지 접근
	  * @작성일 : Apr 2, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : haeder에서 admin 접근
	  * @return
	  */
	@RequestMapping("go.ad")
	public ModelAndView gogoAdmin(
			ModelAndView mv,
			HttpServletRequest request,
			HttpServletResponse response
			) {
		
		ArrayList<Report> rpList = rpService.gogoAdmin();
		
		if( rpList.size() == 0 ) {
			Report r = new Report();
			
			r.setRpNo(0);
			
			rpList.add(r);
		}
		
		mv.addObject("rpList", rpList);
		mv.setViewName("AdminPage/Admain");
		
		return mv;
	}
	
	/**
	  * @Method Name : MemberReport
	  * @작성일 : Apr 29, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 신고된 회원 불러오기
	  * @param mv
	  * @return
	  */
	@RequestMapping("MemberReport.ad")
	public ModelAndView MemberReport(ModelAndView mv) {
		
		ArrayList<Report> rpList = rpService.MemberReport();
		
		mv.setViewName("AdminPage/MemberReport");
		mv.addObject("rpList", rpList);
		
		return mv;
	}
	
	/**
	  * @Method Name : BookShareReport
	  * @작성일 : Apr 29, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 신고된 북쉐어
	  * @param mv
	  * @return
	  */
	@RequestMapping("BookShareReport.ad")
	public ModelAndView BookShareReport(ModelAndView mv) {
		
		ArrayList<Report> rpList = rpService.BookShareReport();
		
		mv.setViewName("AdminPage/BookShareReport");
		mv.addObject("rpList", rpList);
		
		return mv;
	}
	
	/**
	  * @Method Name : FreeBoardReport
	  * @작성일 : Apr 29, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 자유게시판 신고
	  * @param mv
	  * @return
	  */
	@RequestMapping("FreeBoardReport.ad")
	public ModelAndView FreeBoardReport(ModelAndView mv,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
			) {
		
		ArrayList<Report> rpList = rpService.FreeBoardReport();
		
		mv.setViewName("AdminPage/FreeBoardReport");
		mv.addObject("rpList", rpList);
		
		return mv;
	}
	
	/**
	  * @Method Name : QnaReport
	  * @작성일 : Apr 29, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : QNA 신고
	  * @param mv
	  * @return
	  */
	@RequestMapping("QnaReport.ad")
	public ModelAndView QnaReport(ModelAndView mv) {
		
		ArrayList<Report> rpList = rpService.QnaReport();
		
		mv.setViewName("AdminPage/QnaReport");
		mv.addObject("rpList", rpList);
		
		return mv;
	}
	
	/**
	  * @Method Name : FBdelete
	  * @작성일 : Apr 30, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 자유게시판 y처리
	  * @param request
	  * @param response
	  * @param delList
	  * @throws JsonIOException
	  * @throws IOException
	  */
	@RequestMapping(value="FBdelete.ad",method= {RequestMethod.GET, RequestMethod.POST})
	public void FBdelete(HttpServletRequest request,
							  HttpServletResponse response,
							  @RequestParam String[] delList
							  ) throws JsonIOException, IOException {
		
		int result = rpService.FBdelete(delList);

		Gson gson = new GsonBuilder().create();
		
		gson.toJson(result,response.getWriter());
			
	}
	
	/**
	  * @Method Name : FBdelete
	  * @작성일 : Apr 30, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 레알로 삭제
	  * @param request
	  * @param response
	  * @param delList
	  * @throws JsonIOException
	  * @throws IOException
	  */
	@RequestMapping(value="FBdelete2.ad",method= {RequestMethod.GET, RequestMethod.POST})
	public void FBdelete2(HttpServletRequest request,
							  HttpServletResponse response,
							  @RequestParam String[] delList
							  ) throws JsonIOException, IOException {
		
		int result = rpService.FBdelete2(delList);

		Gson gson = new GsonBuilder().create();
		
		gson.toJson(result,response.getWriter());
			
	}
	
	/**
	  * @Method Name : FBdelete
	  * @작성일 : Apr 30, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 유저 정지
	  * @param request
	  * @param response
	  * @param delList
	  * @throws JsonIOException
	  * @throws IOException
	  */
	@RequestMapping(value="banUser.ad",method= {RequestMethod.GET, RequestMethod.POST})
	public void banUser(HttpServletRequest request,
							  HttpServletResponse response,
							  @RequestParam String[] delList
							  ) throws JsonIOException, IOException {
		
		int result = rpService.banUser(delList);

		Gson gson = new GsonBuilder().create();
		
		gson.toJson(result,response.getWriter());
			
	}
	
	/**
	  * @Method Name : banUser
	  * @작성일 : Apr 30, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 구제
	  * @param request
	  * @param response
	  * @param delList
	  * @throws JsonIOException
	  * @throws IOException
	  */
	@RequestMapping(value="salvation.ad",method= {RequestMethod.GET, RequestMethod.POST})
	public void salvation(HttpServletRequest request,
							  HttpServletResponse response,
							  @RequestParam String[] delList
							  ) throws JsonIOException, IOException {
		
		int result = rpService.salvation(delList);

		Gson gson = new GsonBuilder().create();
		
		gson.toJson(result,response.getWriter());
	}
	
	
	/**
	  * @Method Name : AdDepositeManager
	  * @작성일 : Apr 30, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 신고된 그룹스터디 접근
	  * @param mv
	  * @return
	  */
	@RequestMapping(value ="AdDepositeManager.ad", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView AdDepositeManager(
					ModelAndView mv
				) {
		
		ArrayList<Report> sgList = rpService.AdDepositeManager();
		
		mv.setViewName("AdminPage/AdDepositeManager");
		mv.addObject("sgList", sgList);
		
		return mv;
	}
	
}
