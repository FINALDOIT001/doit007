package com.kh.doit.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.doit.board.common.Pagination_ha;
import com.kh.doit.board.model.service.BoardService;
import com.kh.doit.board.model.vo.Board;
import com.kh.doit.board.model.vo.PageInfo_ha;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
   
	@RequestMapping("fblist.go")
	public ModelAndView fboardList(ModelAndView mv,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		
		int listCount = bService.getListCount(); 
		
		PageInfo_ha pi_h = Pagination_ha.getPageInfo_ha(currentPage,listCount);
		
		ArrayList<Board> list = bService.selectList(pi_h); 
		
		mv.addObject("list",list);
		mv.addObject("pi_h",pi_h);
		mv.setViewName("board/freeBoard_list");
	
		return mv;
		
	}
	
	@RequestMapping("fbInsertForm.go")
	public String fboardInsert() {
		return "board/freeBoard_write";
	}
 
	@RequestMapping("fbInsert.go")
	public String insertfBoard(Board b,HttpServletRequest request,
						@RequestParam(name="uploadFile",required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file,request);
			
			if(renameFileName != null) {
				b.setB_org_filename(file.getOriginalFilename());
				b.setB_re_filename(renameFileName);
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
			folder.mkdir(); // 폴더없음 생성하기 
		}
		
		String originFileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		}catch(Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		return renameFileName;
	}
	
	@RequestMapping("fbDetail.go")
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
	
}