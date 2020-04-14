package com.kh.doit.qna.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.doit.common.CommonFile;
import com.kh.doit.qna.model.service.QnaService;
import com.kh.doit.qna.model.vo.Qna;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qService;
	
	@Autowired
	private Qna qna;
	
	@Autowired
	private CommonFile cf;
	
	/**
	 * 1. QNA 리스트 가져오기 Kwon
	 * 2020.04.14 KH
	 * @param mv
	 * @return
	 */
	@RequestMapping("qna.go")
	public ModelAndView movingQna(ModelAndView mv) {
		
		ArrayList<Qna> list = qService.selectQnaList();
		System.out.println("Servlet Qna List : " + list);
		
		mv.addObject("qlist", list);
		mv.setViewName("board/qna_list");
		return mv;
	}
	
	/**
	 * 2. QNA 상세보기 Kwon
	 * 2020.04.14 KH
	 * @param mv
	 * @param qNo
	 * @return
	 */
	@RequestMapping("qnaView.ev")
	public ModelAndView selectQna(ModelAndView mv, int qNo) {
		
		qna = qService.selectQna(qNo);
		
		if (qna != null) {
			mv.addObject("qna",qna);
			mv.setViewName("board/qna_view");
		} else {
			mv.addObject("msg","QNA 상세보기에 실패했습니다");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	@RequestMapping("qnaInsert.go")
	public String moveInsertQna() {
		return "board/qna_write";
	}
	
	/**
	 * 3. qna 추가하기 Kwon
	 * 2020.04.14 KH
	 * @param mv
	 * @param qna
	 * @return
	 */
	@RequestMapping("insertQna.do")
	public String insertQna(Qna qna, HttpServletRequest request,
			@RequestParam(name="qFileName", required=false) MultipartFile file) {
		
		System.out.println("사진 : " + file.getOriginalFilename());

		// 들어온 파일값이 공백이 아니면
		if (!file.getOriginalFilename().equals("")) {
			// 서버에 업로드
			// saveFile메소드 : 내가 저장하고자 하는 file과 request를 전달하여 서버에 업로드시키고 그 저장된 파일명을 반환해주는 메소드

			String renameFileName = cf.saveFile(file, request, "qUploadFiles"); // 아래쪽에 메소드로 새로 빼준다

			if (renameFileName != null) {
				qna.setqOriginalFileName(file.getOriginalFilename());
				qna.setqRenameFileName(renameFileName);
			}
			
		}
		
		System.out.println("Servlet QNA 추가 : " + qna);

		int result = qService.insertQna(qna);
		
		if (result > 0) {
			return "redirect:qna.go";
		} else {
			return "common/errorPage";
		}
		
	}
	
	
	
	

}
