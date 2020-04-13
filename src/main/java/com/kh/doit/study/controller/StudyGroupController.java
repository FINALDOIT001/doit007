package com.kh.doit.study.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.doit.member.model.vo.Member;
import com.kh.doit.study.common.paginationJung;
import com.kh.doit.study.model.service.StudyGroupService;
import com.kh.doit.study.model.vo.GroupMember;
import com.kh.doit.study.model.vo.PageInfojung;
import com.kh.doit.study.model.vo.StudyGroup;


@Controller
public class StudyGroupController {

	@Autowired
	private StudyGroupService sgService;

	/**스터디 리스트 불러오기 (정호)
	 * @param mv
	 * @param currentPage
	 * @return
	 */
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
	
	/** 스터디그룹 인설트(정호)
	 * @param sg
	 * @param request
	 * @param file
	 * @return
	 */
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
				sg.setSgOriginalFileName(file.getOriginalFilename());
				sg.setSgRenameFileName(renameFileName);
			}
			
		}
		System.out.println(sg);
		  int result = sgService.sgInsert(sg);
		  
		  if(result > 0) {
			  return "redirect:sgList.go"; 
			  }else { 
				  return "common/errorPage";
		
	}
	}
		  
		  
	/** 파일 저장 메소드(정호)
	 * @param file
	 * @param request
	 * @return
	 */
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
	
	/**스터티 그룹 수정 뷰 불러오기 (정호)
	 * @param mv
	 * @param sgNo
	 * @return
	 */
	@RequestMapping("sgUpview.go")
	public ModelAndView sgUpdateView(ModelAndView mv, int sgNo){
		
		
		mv.addObject("sg", sgService.sgUpdateView(sgNo))
		.setViewName("study/doitStudyUpdateFrom");
		
		return mv;
		
	}
	
	/**스터티 그룹 수정 하기(정호)
	 * @param mv
	 * @param sg
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("sgUdate.go")
	public ModelAndView sgUpdate(ModelAndView mv, StudyGroup sg, HttpServletRequest request, 
							@RequestParam(name="fileReLoader", required= false)MultipartFile file) {
		
		if(file != null && !file.isEmpty()) {
			if(sg.getSgRenameFileName() != null) {
				deleteFile(sg.getSgRenameFileName(), request);
				
			}
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {
				sg.setSgOriginalFileName(file.getOriginalFilename());
				sg.setSgRenameFileName(renameFileName);
			}
		}
		String join = sg.getSgJoin();
		if(join==null) {
			sg.setSgJoin("N");
			
		}else {
			sg.setSgJoin("Y");
		}
		int result = sgService.sgUpdate(sg);
		
		if(result>0) {
			mv.addObject("sgNo", sg.getSgNo())
			.setViewName("redirect:studyDetail.go");
		}else {
			mv.addObject("msg","수정실패");
		}
		return mv;
	}
	
	
	/** 파일 지우기 메소드 (정호)
	 * @param sgRenameFileName
	 * @param request
	 */
	private void deleteFile(String sgRenameFileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\sgloadFiles";
		
		File f = new File(savePath+"\\"+ sgRenameFileName);
		
		if(f.exists()) {
			f.delete();
		}
		
	}
	
	@RequestMapping("sgDelete.go")
	private String sgDelete(Model model, int sgNo, HttpServletRequest request) {
		StudyGroup sg = sgService.selectSg(sgNo);
		
		System.out.println(sg);
		
		if(sg.getSgRenameFileName() != null) {
			deleteFile(sg.getSgRenameFileName(), request);
		}
		
		int result = sgService.sgDelete(sgNo);
		
		if(result > 0) {
			return "redirect:sgList.go";
		}else {
			model.addAttribute("msg","삭제 하기 실패");
			return "common/errorPage";
		}
	}

	/**
	 * 디테일 상세내용 / 참석자
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
		
		ArrayList<Member> ml = sgService.memberList(sgNo);
		
		System.out.println("Controller memberList : " + sg);
		System.out.println("Controller memberList : " + ml);
		
		if (sg != null) {
			mv.addObject("sg", sg)
			  .addObject("ml",ml)
			  .addObject("currentPage", currentPage)
			  .setViewName("study/doitStudyDetail");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}
 
		return mv;
	}
	
	
	/**
	 * 스터디 탈퇴
	 * 작성자 : 서정도
	 * @param model
	 * @param sgNo
	 * @param request
	 * @return
	 */
	@RequestMapping("sgGroupOut.go")
	private String sgGroupOut(Model model, int mno, HttpServletRequest request) {
		
		int result = sgService.sgGroupOut(mno);
		
		if(result > 0) {
			return "redirect:sgList.go";
		}else {
			model.addAttribute("msg","탈퇴 하기 실패");
			return "common/errorPage";
		}
	}
	
	/**
	 * 스터디 가입
	 * 작성자 : 서정도
	 * @param model
	 * @param sgNo
	 * @param request
	 * @return
	 */
	@RequestMapping("sgJoin.go")
	private String sgJoin(Model model, int sgNo, int mno) {
		
		GroupMember gm = new GroupMember(sgNo,mno);
		
		int result = sgService.sgJoin(gm);
		
		if(result > 0) {
			return "redirect:studyDetail.go?sgNo="+sgNo;
			
		}else {
			model.addAttribute("msg","가입 하기 실패");
			return "common/errorPage";
		}
	}
	
	/**
	 * 스터디 시작
	 * 작성자 : 서정도
	 * @param model
	 * @param sgNo
	 * @param request
	 * @return
	 */
	@RequestMapping("sgStart.go")
	private String sgStart(Model model, int sgNo) {
		
		int result = sgService.sgStart(sgNo);
		
		if(result > 0) {
			return "redirect:studyDetail.go?sgNo="+sgNo;
		}else {
			model.addAttribute("msg","시작 하기 실패");
			return "common/errorPage";
		}
	}
	
}
