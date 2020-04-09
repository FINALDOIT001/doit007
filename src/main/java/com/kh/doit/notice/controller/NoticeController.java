package com.kh.doit.notice.controller;

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

import com.kh.doit.notice.common.Pagination_no;
import com.kh.doit.notice.model.service.NoticeService;
import com.kh.doit.notice.model.vo.Notice;
import com.kh.doit.notice.model.vo.PageInfo_no;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	/**
	 * 현아.공지사항 리스트
	 * @param mv
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("nlist.go")
	public ModelAndView noticeList(ModelAndView mv,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage ) {
		
		int listCount = nService.getNoListCount(); 
		
		PageInfo_no pi_n = Pagination_no.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> nlist = nService.selectNoList(pi_n);
		
		mv.addObject("nlist",nlist);
		mv.addObject("pi_n",pi_n);
		mv.setViewName("board/notice_list");
		
		return mv;
		
	}
	
	/**
	 * 현아.공지사항 입력 
	 * @return
	 */
	@RequestMapping("nInsertForm.go")
	public String nInsert() {
		return "board/notice_write";
	}
	
	/**
	 * 현아.공지사항 인서트
	 * @param n
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("nInsert.go")
	public String insertNotice(Notice n,HttpServletRequest request,@RequestParam(name="uploadFile",required=false) MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) {
			String n_re_filename = saveFile(file,request);
			
			if(n_re_filename != null) {
				n.setN_org_filename(file.getOriginalFilename());
				n.setN_re_filename(n_re_filename);
			}
		}
		int result = nService.insertNotice(n);
		
		if(result > 0) {
			return "redirect:nlist.go";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("nDetail.go")
	public ModelAndView noticeDetail(ModelAndView mv,int n_no,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		Notice n = nService.selectNotice(n_no);
		
		if(n != null) {
			mv.addObject("n",n).addObject("currentPage",currentPage).setViewName("board/notice_view");
		}else {
			mv.addObject("msg","공지사항 상세조회가 불가능합니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	/**
	 * 파일 저장 
	 * @param file
	 * @param request
	 * @return
	 */
	public String saveFile(MultipartFile file, HttpServletRequest request) {
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = root + "\\buploadFiles";
			
			File folder = new File(savePath);
			
			if(!folder.exists()) {
				folder.mkdir(); 
			}
			
			String n_org_filename = file.getOriginalFilename();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String n_re_filename = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
							+ n_org_filename.substring(n_org_filename.lastIndexOf(".")+1);
			
			System.out.println("b_re_filename : " + n_re_filename);
			
			String renamePath = folder + "\\"+ n_re_filename;
			
			try {
				file.transferTo(new File(renamePath)); // 이때 전달받은 file이 rename명으로 저장이된다.
			}catch (Exception e) {
				System.out.println("파일 전송 에러 : " + e.getMessage());
			} 
			
			return n_re_filename;
		}

}
