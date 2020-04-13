package com.kh.doit.bookShare.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
import com.kh.doit.bookShare.model.service.BookShareService;
import com.kh.doit.bookShare.model.vo.BookShare;
import com.kh.doit.bookShare.model.vo.BookShareReply;
import com.kh.doit.common.CommonFile;

@Controller
public class BookShareController {
	
	@Autowired
	private BookShareService bsService;
	
	@Autowired
	private CommonFile cf;
	
	@RequestMapping("moveBS.go")
	public ModelAndView moveBookShare(ModelAndView mv) {
		
		ArrayList<BookShare> list = null;
		
		list = bsService.selectList();
		
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("board/bookShare_list");
		} else {
			mv.addObject("msg", "리스트 불러오기 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
		
	}
	
	@RequestMapping("bsView.ev")
	public ModelAndView moveBookShareView(ModelAndView mv, BookShare bs, int bsNo) {
		bs = bsService.selectOne(bsNo);
		
//		ArrayList<BookShareReply> rList = null;
//		
//		rList = bsService.selectReplyList(bsNo);
//		System.out.println("rList : " + rList);
		

		
		if(bs != null) {
			mv.addObject("bs",bs);
			mv.setViewName("board/bookShare_view");
		} else {
			mv.addObject("msg","게시글 보기 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 댓글 보여주기(ajax) Kwon
	 * 2020.04.02
	 * @param response
	 * @param bsNo
	 * @throws JsonIOException
	 * @throws IOException
	 */
	@RequestMapping("bsReply.do")
	public void selectReplyList(HttpServletResponse response, int bsNo) throws JsonIOException, IOException {
	
		ArrayList<BookShareReply> rList = bsService.selectReplyList(bsNo);
		
		System.out.println("Servlet 댓글 리스트 : " + rList);
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(rList,response.getWriter());
		
	}

	/**
	 * BookShare 댓글 넣기 Kwon
	 * 2020.04.02 집에서
	 * @param r
	 * @return
	 */
	@RequestMapping("addReply.do")
	@ResponseBody
	public String addReply(BookShareReply r) {
		System.out.println("servlet 댓글추가 : " + r);
		int result = bsService.insertReply(r);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping("delBsReply.do")
	@ResponseBody
	public String delBsReply(int bscNo) {
		System.out.println("댓글삭제 bscNo : " + bscNo);
		int result = bsService.deleteReply(bscNo);
		System.out.println("삭제결과  : " + result);
		
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
		
	}
	
	
	
	
	
	@RequestMapping("bsInsert.go")
	public String moveBookShareWrite() {
		return "board/bookShare_write";
	}
	
	/**
	 * BookShare 추가 Kwon
	 * 2020.04.02 집에서
	 * @return
	 */
	@RequestMapping("insertBook.do")
	public String insertBookShare(BookShare bs, HttpServletRequest request,
								@RequestParam(name="bsFileName", required=false) MultipartFile file) {
		System.out.println("Servlet Insert Bs : " + bs);
		System.out.println("사진 : " + file.getOriginalFilename());
		// 들어온 파일값이 공백이 아니면
		if (!file.getOriginalFilename().equals("")) {
			// 서버에 업로드
			// saveFile메소드 : 내가 저장하고자 하는 file과 request를 전달하여 서버에 업로드시키고 그 저장된 파일명을 반환해주는 메소드

			String renameFileName = cf.saveFile(file, request, "bsUploadFiles"); // 아래쪽에 메소드로 새로 빼준다

			if (renameFileName != null) {
				bs.setBsOriginalFileName(file.getOriginalFilename());
				bs.setBsRenameFileName(renameFileName);
			}
			
		}
		System.out.println("Servlet BS 추가 : " + bs);
		
		int result = bsService.insertBookShare(bs);
		
		if (result > 0) {
			return "redirect:moveBS.go";
		} else {
			return "common/errorPage";
		}
		
		
	}

	/**
	 * 4. 업데이트용 화면 쏘기
	 * @param bsNo
	 * @return
	 */
	@RequestMapping("bsUpdate.go")
	public ModelAndView moveBookShareUpdate(ModelAndView mv, BookShare bs, int bsNo) {
		System.out.println("Servlet 업데이트 bsNo : " + bsNo);
		bs = bsService.selectOne(bsNo);
		System.out.println("Servlet 업데이트 bs : " + bs);
		mv.addObject("bs", bs);
		mv.setViewName("board/bookShare_update");
		return mv;
	}
	
	/**
	 * BS 업데이트 하기 Kwon
	 * 2020.04.05 HOME
	 * @param bs
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("bsUpdate.do")
	public ModelAndView updateBookShare(ModelAndView mv, BookShare bs, HttpServletRequest request,
			@RequestParam(name="bsFileName", required=false) MultipartFile file) {
		
		if (file != null && !file.isEmpty()) { // 새로 업로드된 파일이 있다면!
			if (bs.getBsRenameFileName() != null) { // 기존 업로드된 파일이 있었다면?
				cf.deleteFile(bs.getBsRenameFileName(), request, "bsUploadFiles");
			}
			// 기존 파일을 지운 뒤, 새로 넣을 파일이 있으니까 renameFileName 으로 만들어준다.
			String bsRenameFileName = cf.saveFile(file, request, "bsUploadFiles"); // 아래쪽 메소드로 다시 달라고 한다
			
			if (bsRenameFileName != null) {
				bs.setBsOriginalFileName(file.getOriginalFilename());
				bs.setBsRenameFileName(bsRenameFileName);
			}

		}
		
		int result = bsService.updateBs(bs);
		
		if (result > 0) {
			mv.addObject("bsNo", bs.getBsNo()).setViewName("redirect:bsView.go");
		} else {
			mv.addObject("msg", "게시글 수정 실패하였습니다만 어쩌라고?").setViewName("common/errorPage");
		}
		
		return mv;

		
	}
	
	/**
	 * BS 게시글 삭제 Kwon
	 * 2020.04.05 HOME
	 * @param bsNo
	 * @return
	 */
	@RequestMapping("deleteBs.do") 
	public String deleteBookShare(int bsNo) {
		System.out.println("Servlet Delete bsNo : " + bsNo);
		
		int result = bsService.deleteBs(bsNo);
		
		if(result > 0) {
			return "redirect:moveBS.go";
		} else {
			return "common/errorPage.jsp";
		}
		
	}
	
	/**
	 * 나눔완료 된 BookShare Kwon
	 * 2020.04.05 HOME
	 * @param bsNo
	 * @return
	 */
	@RequestMapping("endBs.do")
	public String endBookShare(int bsNo) {
		System.out.println("Servlet End bsNo : " + bsNo);
		
		int result = bsService.endBs(bsNo);
		
		if(result > 0) {
			return "redirect:moveBS.go";
		} else {
			return "common/errorPage.jsp";
		}
	}
	
}
