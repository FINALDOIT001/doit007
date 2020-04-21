package com.kh.doit.report.controller;

import java.io.IOException;

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
import com.kh.doit.report.model.service.ReportService;
import com.kh.doit.report.model.vo.Report;

@Controller
public class ReportController {
	
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
}
