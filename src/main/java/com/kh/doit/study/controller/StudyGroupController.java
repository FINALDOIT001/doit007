package com.kh.doit.study.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.doit.member.model.vo.Member;
import com.kh.doit.study.common.paginationJung;
import com.kh.doit.study.model.service.StudyGroupService;
import com.kh.doit.study.model.vo.DailyStudy;
import com.kh.doit.study.model.vo.Etc;
import com.kh.doit.study.model.vo.EtcFile;
import com.kh.doit.study.model.vo.Gallery;
import com.kh.doit.study.model.vo.GroupMember;
import com.kh.doit.study.model.vo.PageInfojung;
import com.kh.doit.study.model.vo.StudyCheck;
import com.kh.doit.study.model.vo.StudyGroup;
import com.kh.doit.study.model.vo.StudyLike;


@Controller
public class StudyGroupController {

	@Autowired
	private StudyGroupService sgService;

	/**
	 * 스터디 리스트 불러오기 (정호)
	 * 
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

	/**
	 * 스터디그룹 인설트(정호)
	 * 
	 * @param sg
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("sgInsert.go")
	public String sgInsert(StudyGroup sg, HttpServletRequest request,
			@RequestParam(name = "sbul", required = false) MultipartFile file) {

		String join = sg.getSgJoin();

		if (join == null) {
			sg.setSgJoin("N");

		} else {
			sg.setSgJoin("Y");
		}

		System.out.println(sg.getSgJoin());
		System.out.println("사진 : " + file.getOriginalFilename());

		if (!file.getOriginalFilename().equals("")) {

			String renameFileName = saveFile(file, request);

			if (renameFileName != null) {
				sg.setSgOriginalFileName(file.getOriginalFilename());
				sg.setSgRenameFileName(renameFileName);
			}

		}
		System.out.println(sg);
		int result = sgService.sgInsert(sg);

		if (result > 0) {
			return "redirect:sgList.go";
		} else {
			return "common/errorPage";

		}
	}

	/**
	 * 파일 저장 메소드(정호)
	 * 
	 * @param file
	 * @param request
	 * @return
	 */
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\sgloadFiles";
		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdir();
		}
		String originFileName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String renamePath = folder + "\\" + renameFileName;
		System.out.println(renamePath);

		try {

			file.transferTo(new File(renamePath));

		} catch (Exception e) {
			System.out.println("파일 전송 오류 :" + e.getMessage());
		}
		System.out.println(renameFileName);
		return renameFileName;
	}

	/**
	 * 스터티 그룹 수정 뷰 불러오기 (정호)
	 * 
	 * @param mv
	 * @param sgNo
	 * @return
	 */
	@RequestMapping("sgUpview.go")
	public ModelAndView sgUpdateView(ModelAndView mv, int sgNo) {

		mv.addObject("sg", sgService.sgUpdateView(sgNo)).setViewName("study/doitStudyUpdateFrom");

		return mv;

	}

	/**
	 * 스터티 그룹 수정 하기(정호)
	 * 
	 * @param mv
	 * @param sg
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("sgUdate.go")
	public ModelAndView sgUpdate(ModelAndView mv, StudyGroup sg, HttpServletRequest request,
			@RequestParam(name = "fileReLoader", required = false) MultipartFile file) {

		if (file != null && !file.isEmpty()) {
			if (sg.getSgRenameFileName() != null) {
				deleteFile(sg.getSgRenameFileName(), request);

			}
			String renameFileName = saveFile(file, request);

			if (renameFileName != null) {
				sg.setSgOriginalFileName(file.getOriginalFilename());
				sg.setSgRenameFileName(renameFileName);
			}
		}
		String join = sg.getSgJoin();
		if (join == null) {
			sg.setSgJoin("N");

		} else {
			sg.setSgJoin("Y");
		}
		int result = sgService.sgUpdate(sg);

		if (result > 0) {
			mv.addObject("sgNo", sg.getSgNo()).setViewName("redirect:studyDetail.go");
		} else {
			mv.addObject("msg", "수정실패");
		}
		return mv;
	}

	/**
	 * 파일 지우기 메소드 (정호)
	 * 
	 * @param sgRenameFileName
	 * @param request
	 */
	private void deleteFile(String sgRenameFileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\sgloadFiles";

		File f = new File(savePath + "\\" + sgRenameFileName);

		if (f.exists()) {
			f.delete();
		}

	}

	@RequestMapping("sgDelete.go")
	private String sgDelete(Model model, int sgNo, HttpServletRequest request) {
		StudyGroup sg = sgService.selectSg(sgNo);

		System.out.println(sg);

		if (sg.getSgRenameFileName() != null) {
			deleteFile(sg.getSgRenameFileName(), request);
		}

		int result = sgService.sgDelete(sgNo);

		if (result > 0) {
			return "redirect:sgList.go";
		} else {
			model.addAttribute("msg", "삭제 하기 실패");
			return "common/errorPage";
		}
	}

	/**
	 * 디테일 상세내용 / 참석자 작성자 : 서정도
	 * 권구현도 수정합니다~ 자료실 리스트 가져오기 2020.04.24 Kwon
	 * 
	 * @param mv
	 * @param sgNo
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("studyDetail.go")
	public ModelAndView studyDetail(ModelAndView mv, int sgNo, String mno,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {

		StudyGroup sg = sgService.selectSg(sgNo);

		ArrayList<Member> ml = sgService.memberList(sgNo);
		
		StudyLike sl = new StudyLike();
		if(mno != "" && mno !=null) {
		
		String slNo= mno+sgNo;
		System.out.println("유저 넘버 넘어 오는가? "+ slNo);
		
			 sl = sgService.studyLikeList(slNo);
			System.out.println("studyList" + sl);
		}
		
		// 구현 추가 부분
		ArrayList<Etc> etc = sgService.etcList(sgNo);
		System.out.println("Servlet Kwon Etc : " + etc);
	

		System.out.println("Controller memberList : " + sg);
		System.out.println("Controller memberList : " + ml);

		if (sg != null) {
			
			mv.addObject("sg", sg).addObject("ml", ml).addObject("currentPage", currentPage).addObject("sl",sl).addObject("etc",etc)
					.setViewName("study/doitStudyDetail");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}

		return mv;
	}

	/**
	 * 스터디 탈퇴 작성자 : 서정도
	 * 
	 * @param model
	 * @param sgNo
	 * @param request
	 * @return
	 */
	@RequestMapping("sgGroupOut.go")
	private String sgGroupOut(Model model, int mno, HttpServletRequest request) {

		int result = sgService.sgGroupOut(mno);

		if (result > 0) {
			return "redirect:sgList.go";
		} else {
			model.addAttribute("msg", "탈퇴 하기 실패");
			return "common/errorPage";
		}
	}

	/**
	 * 스터디 가입 작성자 : 서정도
	 * 
	 * @param model
	 * @param sgNo
	 * @param request
	 * @return
	 */
	@RequestMapping("sgJoin.go")
	private String sgJoin(Model model, int sgNo, int mno) {

		GroupMember gm = new GroupMember(sgNo, mno);

		int result = sgService.sgJoin(gm);

		if (result > 0) {
			return "redirect:studyDetail.go?sgNo=" + sgNo;

		} else {
			model.addAttribute("msg", "가입 하기 실패");
			return "common/errorPage";
		}
	}

	/**
	 * 스터디 시작 작성자 : 서정도
	 * 
	 * @param model
	 * @param sgNo
	 * @param request
	 * @return
	 */
	@RequestMapping("sgStart.go")
	private String sgStart(Model model, int sgNo) {
		
		System.out.println(sgNo);

		int result = sgService.sgStart(sgNo);

		if (result > 0) {
			return "redirect:studyDetail.go?sgNo=" + sgNo;
		} else {
			model.addAttribute("msg", "시작 하기 실패");
			return "common/errorPage";
		}
	}

	/**
	 * 이것슨 스터디 스케쥴 리스트 불러오기 정호가 만든겨
	 * 
	 * @param response
	 * @param sgNo
	 * @throws JsonIOException
	 * @throws IOException
	 */
	@RequestMapping("dailyStudyList.go")
	public void getdailyStudyList(HttpServletResponse response, int sgNo) throws JsonIOException, IOException {
		ArrayList<DailyStudy> dsList = sgService.sgDailySlist(sgNo);
		System.out.println(dsList);
		response.setContentType("application/json; charset=UTF-8");

		Gson gson = new GsonBuilder().create();

		gson.toJson(dsList, response.getWriter());

	}

	/**
	 * 이것슨 스터디 스케쥴 리스트 저장하기 정호가 만든겨
	 * 
	 * @param ds
	 * @param request
	 * @return
	 */
	@RequestMapping("dailyStudyinsert.go")
	private String dailyStudyinsert(DailyStudy ds, HttpServletRequest request,
			@RequestParam(value = "ssTimeDate", required = false) String ssTimeDate) {
		System.out.println(ssTimeDate);

		System.out.println(ds);

		int result = sgService.dailyStudyinsert(ds);

		if (result > 0) {
			return "redirect:studyDetail.go?sgNo=" + ds.getSsSgNo();
		} else {
			return "common/errorPage";
		}

	}

	/**
	 * 이거슨 스터티 스케줄 디테일 뷰 불러오기 정호가 만든거
	 * 
	 * @param response
	 * @param ssNo
	 * @throws JsonIOException
	 * @throws IOException
	 */
	@RequestMapping("dailyStudyView.go")
	public void dailyStudyView(HttpServletResponse response, int ssNo) throws JsonIOException, IOException {
		DailyStudy sd = sgService.dailyStudyView(ssNo);
		System.out.println(sd);
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().create();
		gson.toJson(sd, response.getWriter());

	}

	@RequestMapping("dailyStudyUpdate.go")
	private ModelAndView dailyStudyUpdate(ModelAndView mv, HttpServletRequest request, DailyStudy ds) {

		int result = sgService.dailyStudyUpdate(ds);

		if (result > 0) {
			mv.addObject("sgNo", ds.getSsSgNo()).setViewName("redirect:studyDetail.go");
		} else {
			mv.addObject("msg", "스터디 스케줄 업데이트 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	@RequestMapping("dailyStudyDelete.go")
	@ResponseBody
	private String dailyStudyDelete(String ssNo, HttpServletRequest request) {

		int result = sgService.dailyStudyDelete(ssNo);

		if (result > 0) {
			return "ok";
		} else {
			return "fail";
		}

	}

	@RequestMapping("studyLikeInsert.go")
	@ResponseBody
	private String studyLikeInsert(StudyLike sl, HttpServletRequest request) {

		int slno = Integer.parseInt(Integer.toString(sl.getSlmNo()) + sl.getSlsgNo());

		sl.setSlNo(slno);

		System.out.println(sl);
		int result = sgService.studyLikeInsert(sl);
		System.out.println(result);

		if (result > 0) {
			return "ok";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping("studyLikeDelete.go")
	@ResponseBody
	private String studyLikeDelete(HttpServletRequest requset, int slmNo, int slsgNo ) {
		int slNo = Integer.parseInt(Integer.toString(slmNo) + slsgNo);
		
		int result = sgService.studyLikeDelete(slNo);
		
		if(result > 0) {
			return "ok";
		}else {
			return "fail";
		
		}
		
	}
	
	

	/**
	 * 출석 체크 페이지 이동
	 * 정호가 만든거
	 * @return
	 */
	@RequestMapping("checkStudy.go")
	public ModelAndView checkStudy(ModelAndView mv, int sgNo, int ssNo, String ssDayDate,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		
		ArrayList<Member> ml = sgService.memberList(sgNo);
		
		System.out.println(sgNo);
		System.out.println(ssNo);
		System.out.println(ml);
		
		
		if (ml != null) {
			mv.addObject("sgNo", sgNo)
			  .addObject("ml",ml)
			  .addObject("ssNo", ssNo)
			  .addObject("ssDayDate",ssDayDate)
			  .setViewName("study/doitStudy_check");
		} else {
			mv.addObject("msg", "출석 불러오기 실패").setViewName("common/errorPage");
		}
 
		return mv;
	}
	
	
	
	/**
	 * Gallery / Multi-File Insert 
	 * 작성자 : 서정도
	 * @param file
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@RequestMapping("photoUpload.go")
	public String photoUpload(Gallery g, HttpServletRequest request,
			@RequestParam(name = "filedata") MultipartFile[] file) throws Exception {
		
		int result = 0;
		
		for (int i = 0; i < file.length; i++) {
			if (file.length > 0) {
				
				String g_RenameFile = saveMultiFile(file[i], request);
				
				if (g_RenameFile != null) {
					
					g.setG_Original_FileName(file[i].getOriginalFilename());
					g.setG_Rename_FileName(g_RenameFile);

					System.out.println("g.ori : " + g.getG_Original_FileName());
					System.out.println("g.re : " + g.getG_Rename_FileName());
					
				}
			}
			result = sgService.photoUpload(g);
		}

		System.out.println("photoUpload : " + result);
		
		if(result > 0) {
			return "redirect:sgList.go";
		}else {
			return "common/errorPage";
		}
	}

	/**
	 * Gallery / Multi-File Insert
	 * 작성자 : 서정도
	 * @param file
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public String saveMultiFile(MultipartFile file, HttpServletRequest request)throws IllegalStateException, IOException {

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\sgUploadFiles";
		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdir();
		}

		String renameFileName = null;

		String originFileName = file.getOriginalFilename();
		System.out.println(originFileName);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS"); // yyyy : 년 / MM : 월 / dd : 일 / HH : 시 / mm : 분 / ss : 초 / SS : 1/1000초(0~999) 
																		 // ==> 사진을 여러장 업로드 하기 때문에 초까지만 이름을 정해주면 이름 중접이 발생해 같은 파일명으로 파일 계속 생성된다.(덮어쓰기됨) 한개의 파일만 보임
		renameFileName = originFileName.substring(0, originFileName.lastIndexOf(".")) + sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String renamePath = folder + "\\" + renameFileName;
		System.out.println(renamePath);

		file.transferTo(new File(renamePath));

		System.out.println(renameFileName);

		return renameFileName;
	}
	
	/**
	 * Gallery Detail
	 * 작성자 : 서정도
	 * @param mv
	 * @param sgNo
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("galleryDetail.go")
	public ModelAndView galleryDatail(ModelAndView mv, Gallery g, ArrayList<Gallery> multiFile, int sgNo, int gNo, int gNum) {
		
		g.setG_Sg_No(sgNo);
		g.setG_No(gNo);
		g.setG_Num(gNum);
		g = sgService.selectGallery(g);
		System.out.println("######"+g);
		
		multiFile = sgService.multiFile(gNum);
		System.out.println("######"+multiFile);
		
		if (g != null /* && multiFile !=null */) {
			mv.addObject("g", g)
			  .addObject("multiFile",multiFile)
			  .setViewName("study/galleryDetail");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}
 
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 검색으로 스터디 리스트 찾기 Kwon
	 * 2020.04.23 KH
	 * @param mv
	 * @param ssSearch
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("studySearch.do")
	public ModelAndView studySearch(ModelAndView mv, String ssSearch,
				@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		System.out.println(currentPage);

		int listCount = sgService.getSearchListCount(ssSearch);

		System.out.println("servlet 검색 스터디 카운트 : " + listCount);

		PageInfojung pi = paginationJung.getPageInfo(currentPage, listCount);

		ArrayList<StudyGroup> sgList = sgService.selectSearchList(pi, ssSearch);

		mv.addObject("sgList", sgList);
		mv.addObject("pi", pi);
		mv.addObject("listCount", listCount);
		mv.setViewName("study/doitStudyList");

		return mv;
	}
	
	
	
	/**
	 * 자료실 화면으로 Kwon
	 * 2020.04.23 KH
	 * @return
	 */
	@RequestMapping("insertEtc.go")
	public String moveEtc() {
		return "study/etcInsert";
	}
	
	@RequestMapping("insertEtc.do")
	public String insertEtc(Etc etc, EtcFile etcF, HttpServletRequest request,
				@RequestParam(name = "filedata") MultipartFile[] file) throws Exception {

		int result = 0;
		int result2 = 0;
		
		result = sgService.insertEtc(etc);

		if (result > 0 ) {
			for (int i = 0; i < file.length; i++) {
				if (file.length > 0) {
	
					String g_RenameFile = saveMultiFile(file[i], request);
	
					if (g_RenameFile != null) {
	
						etcF.setEtcfOriginalFileName(file[i].getOriginalFilename());
						etcF.setEtcfRenameFileName(g_RenameFile);
	
						System.out.println("etc.ori : " + etcF.getEtcfOriginalFileName());
						System.out.println("etc.re : " + etcF.getEtcfRenameFileName());
	
					}
				}
				result2 = sgService.insertEtcFile(etcF);
			}
			
		}

		System.out.println("자료 업로드 : " + result);

		if (result > 0) {
			return "redirect:sgList.go";
		} else {
			return "common/errorPage";
		}
		
	}

	/**
	 * 자료실 상세페이지 Kwon
	 * 2020.04.24 HOME
	 * @param mv
	 * @param etc
	 * @param multiFile
	 * @param etcNo
	 * @return
	 */
	@RequestMapping("etcView.do")
	private ModelAndView etcView(ModelAndView mv, Etc etc, ArrayList<EtcFile> multiFile, int etcNo) {
		etc = sgService.selectEtc(etcNo);
		multiFile = sgService.selectEtcFile(etcNo);
		
		mv.addObject("etc", etc);
		mv.addObject("multiFile",multiFile);
		mv.setViewName("study/etcDetail");
		
		return mv;
	}
	
	@RequestMapping("etcDelete.do")
	private String etcDelete(int etcNo) {
		int result = sgService.deleteEtc(etcNo);
		return "redirect:sgList.go";
	}
	
	/**스터디 출첵 인설트 
	 * 정호
	 * @param mv
	 * @param sc
	 * @param checkList
	 * @param checkMember
	 * @return
	 */
	@RequestMapping(value = "doitCheckInsert.go", method = RequestMethod.POST)
	@ResponseBody
	private String doitCheckInsert(ModelAndView mv, StudyCheck sc,
			@RequestParam(value = "checklist") List<String> checkList,
			@RequestParam(value = "checkmember") List<String> checkMember) {

		int cmiNumber = 0;
		int sciNumber = 0;

		for (int i = 0; i < checkMember.size(); ++i) {

			sc.setScMno(Integer.parseInt(checkMember.get(i)));
			sc.setScNo(Integer.parseInt(sc.getSsNo() + checkMember.get(i)));
			cmiNumber += checkMemberInsert(sc);

		}

		for (int i = 0; i < checkList.size(); ++i) {
			sciNumber += studyCheckInsert(Integer.parseInt(sc.getSsNo() + checkList.get(i)));
		}
		if (cmiNumber == checkMember.size() && sciNumber==checkList.size()) {
			return "ok";

		} else {
			return "fail";
		}

	}

	public int checkMemberInsert(StudyCheck sc) {
		int result = sgService.checkMemeberInsert(sc);
		return result;
	}

	public int studyCheckInsert(int scNo) {

		int result = sgService.studyCheckInsert(scNo);

		return result;
	}
	
	

}