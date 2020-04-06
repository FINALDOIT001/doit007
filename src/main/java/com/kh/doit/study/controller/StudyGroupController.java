package com.kh.doit.study.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.doit.study.common.paginationJung;
import com.kh.doit.study.model.service.StudyGroupService;
import com.kh.doit.study.model.vo.GroupMember;
import com.kh.doit.study.model.vo.PageInfojung;
import com.kh.doit.study.model.vo.StudyGroup;


@Controller
public class StudyGroupController {

	@Autowired
	private StudyGroupService sgService;

	@RequestMapping("sgList.go")
	public ModelAndView sgList(ModelAndView mv,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		System.out.println(currentPage);

		int listCount = sgService.getlistCount();

		System.out.println(listCount);

		PageInfojung pi = paginationJung.getPageInfo(currentPage, listCount);

		ArrayList<StudyGroup> sgList = sgService.selectList(pi);

		mv.addObject("sgList", sgList);
		mv.addObject("pi", pi);
		mv.addObject("listCount", listCount);
		mv.setViewName("study/doitStudyList");

		return mv;
	}
	
	@RequestMapping("sgInsert.go")
	public String sgInsert(StudyGroup sg, HttpServletRequest request,
				@RequestParam(name="sbul", required=false)MultipartFile file) {
				
				
		String join = sg.getSgJoin();
		
		if(join==null) {
			sg.setSgJoin("N");
			
		}else {
			sg.setSgJoin("Y");
		}
		
		System.out.println(sg.getSgJoin());
		System.out.println("사진 : " + file.getOriginalFilename());
		
		
		if(!file.getOriginalFilename().equals("")) {
			
			String renameFileName = saveFile(file, request);
			
			if(renameFileName !=null) {
				sg.setSgOrginalFileName(file.getOriginalFilename());
				sg.setSgRenameFileName(renameFileName);
			}
			
		}
		
		  int result = sgService.sgInsert(sg);
		  
		  if(result > 0) {
			  return "redirect:sgList.go"; 
			  }else { 
				  return "common/errorPage";
		
	}
	}
		  
		  
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		
		String savePath = root + "\\sgloadFiles";
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdir();
		}
		String originFileName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."
				+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String renamePath = folder + "\\" +renameFileName;
		System.out.println(renamePath);
		
		try {
			
			file.transferTo(new File(renamePath));
			
		}catch(Exception e) {
			System.out.println("파일 전송 오류 :" + e.getMessage());
		}
		System.out.println(renameFileName);
		return renameFileName;
	}
	
	
	/**
	 * 디테일
	 * 작성자 : 서정도
	 * @param mv
	 * @param sgNo
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("studyDetail.go")
	public ModelAndView studyDetail(ModelAndView mv, int sgNo,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {

		StudyGroup sg = sgService.selectSg(sgNo);
		
		ArrayList<GroupMember> gm = groupMember(sgNo);
		
		System.out.println("Controller gm : " + gm);
		
		if (sg != null) {
			mv.addObject("sg", sg)
			  .addObject("gm", gm)
			  .addObject("currentPage", currentPage)
			  .setViewName("study/doitStudyDetail");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}
 
		return mv;
	}
	
	public ArrayList<GroupMember> groupMember(int sgNo) {

		ArrayList<GroupMember> sgList = sgService.selectGroupMember(sgNo);

		return sgList;
	} 
	
	

}
