package com.kh.doit.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.doit.board.common.Pagination_ha;
import com.kh.doit.board.model.service.BoardService;
import com.kh.doit.board.model.vo.Board;
import com.kh.doit.board.model.vo.Board_Comments;
import com.kh.doit.board.model.vo.PageInfo_ha;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	/**
	 * about페이지 이동 (딱히 쓸곳없어서 보드에 끼워놈)
	 * @return
	 */
	@RequestMapping("about.go")
	public String about() {
		return "common/about";
	}
   
	/**
	 * 현아.자유게시판 리스트
	 * @param mv
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("fblist.go")
	public ModelAndView fboardList(ModelAndView mv,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		
		int listCount = bService.getListCount(); 
		
		PageInfo_ha pi_h = Pagination_ha.getPageInfo(currentPage,listCount);
		
		ArrayList<Board> list = bService.selectList(pi_h); 
		
		mv.addObject("list",list);
		mv.addObject("pi_h",pi_h);
		mv.setViewName("board/freeBoard_list");
	
		return mv;
		
	}
	
	/**
	 * 현아.자유게시판 입력하기
	 * @return
	 */
	@RequestMapping("fbInsertForm.go")
	public String fboardInsert() {
		return "board/freeBoard_write";
	}
 
	/**
	 * 현아.자유게시판 insert
	 * @param b
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("fbInsert.go")
	public String insertfBoard(Board b,HttpServletRequest request,
						@RequestParam(name="uploadFile",required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) {
			String b_re_filename = saveFile(file,request);
			
			if(b_re_filename != null) {
				b.setB_org_filename(file.getOriginalFilename());
				b.setB_re_filename(b_re_filename);
			}
		}
		
		int result = bService.insertBoard(b); 
		
		if(result > 0) {
			return "redirect:fblist.go";
		}else {
			return "common/errorPage";
		}
		
	}

	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\buploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdir(); // 폴더가 없다면 생성해주세요
		}
		
		String b_org_filename = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String b_re_filename = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
						+ b_org_filename.substring(b_org_filename.lastIndexOf(".")+1);
		
		System.out.println("b_re_filename : " + b_re_filename);
		
		String renamePath = folder + "\\"+ b_re_filename;
		
		try {
			file.transferTo(new File(renamePath)); // 이때 전달받은 file이 rename명으로 저장이된다.
		}catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		} 
		
		return b_re_filename;
	}
	
	/**
	 * 현아.자유게시판 상세보기 
	 * @param mv
	 * @param b_no
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("fbDetail.ev")
	public ModelAndView fboardDetail(ModelAndView mv,int b_no,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		Board b = bService.selectBoard(b_no);
		if(b != null) {
			mv.addObject("b",b).addObject("currentPage",currentPage).setViewName("board/freeBoard_view");
		}else {
			mv.addObject("msg","게시글 상세조회 실패@@").setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 현아.자유게시판 수정폼
	 * @param mv
	 * @param b_no
	 * @return
	 */
	@RequestMapping("fbUpdateForm.go")
	public ModelAndView fboardUpdate(ModelAndView mv,int b_no) {
		mv.addObject("b",bService.selectUpdateBoard(b_no)).setViewName("board/freeBoard_upwrite");
		
		return mv;
	}
	
	/**
	 * 현아.자유게시판 수정하기
	 * @param mv
	 * @param b
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("fbUpdate.go")
	public ModelAndView updatefboard(ModelAndView mv,@ModelAttribute Board b,HttpServletRequest request,
										@RequestParam(value="reloadFile",required=false) MultipartFile file) {
		if(file != null && !file.isEmpty()) {
			if(b.getB_re_filename() != null) {
				deleteFile(b.getB_re_filename(),request);
			}
			
			String b_re_filename = saveFile(file, request);
			
			if(b_re_filename != null) {
				b.setB_org_filename(file.getOriginalFilename());
				b.setB_re_filename(b_re_filename);
			}
		}
		
		int result = bService.updateBoard(b);
		
		if(result > 0) {
			mv.addObject("b_no",b.getB_no()).setViewName("redirect:fbDetail.ev");
		}else {
			mv.addObject("msg","게시글 수정 실패");
		}
		
		return mv;
	}

	public void deleteFile(String fileName,HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	/**
	 * 현아.자유게시판 삭제
	 * @param model
	 * @param b_no
	 * @param request
	 * @return
	 */
	@RequestMapping("fbdelete.go")
	public String fboardDelete(Model model,int b_no,HttpServletRequest request) {
		Board b = bService.selectUpdateBoard(b_no);
		
		if(b.getB_re_filename() != null) {
			deleteFile(b.getB_re_filename(),request);
		}
		
		int result = bService.deleteBoard(b_no);
		
		if(result > 0) {
			return "redirect:fblist.go";
		}else {
			model.addAttribute("msg","게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	/**
	 * 현아.댓글리스트 
	 * @param response
	 * @param b_no
	 * @throws JsonIOException
	 * @throws IOException
	 */
	@RequestMapping("bcList.go")
	public void getCommentList(HttpServletResponse response,int b_no) throws JsonIOException, IOException {
		
		ArrayList<Board_Comments> bcList = bService.selectCommentList(b_no);
		
		
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create(); 
		gson.toJson(bcList,response.getWriter());
	}
	
		
	
	/**
	 * 현아.댓글등록
	 * @param bc
	 * @return
	 */
	@RequestMapping("addComment.go")
	@ResponseBody
	public String addComment(Board_Comments bc) {
		int result = bService.insertComment(bc);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	/**
	 * 현아.댓글삭제
	 * @param bc_no
	 * @return
	 */
	@RequestMapping("deleteComment.go")
	@ResponseBody
	public String deleteComment(int bc_no) {
		int result = bService.deleteComment(bc_no);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
}