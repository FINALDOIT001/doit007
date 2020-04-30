package com.kh.doit.qna.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.doit.board.model.vo.Board;
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
	
	@RequestMapping("qnaUpdate.go")
	public ModelAndView moveUpdateQna(ModelAndView mv, int qNo) {
		qna = qService.selectQna(qNo);
		
		if (qna != null) {
			mv.addObject("qna", qna);
			mv.setViewName("board/qna_update");
		} else {
			mv.addObject("msg", "QNA 업데이트 페이지를 불러오는데 실패했습니다. %n 관리자에게 문의해주시기 바랍니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("updateQna.do")
	public ModelAndView updateQna(ModelAndView mv, Qna qna, HttpServletRequest request,
			@RequestParam(name="qFileName", required=false) MultipartFile file) {

		System.out.println("Serlvete Update 들어온 qna : " + qna);

		if (file != null && !file.isEmpty()) { // 새로 업로드된 파일이 있다면!
			if (qna.getqRenameFileName() != null) { // 기존 업로드된 파일이 있었다면?
				cf.deleteFile(qna.getqRenameFileName(), request, "qUploadFiles");
			}
			// 기존 파일을 지운 뒤, 새로 넣을 파일이 있으니까 renameFileName 으로 만들어준다.
			String bsRenameFileName = cf.saveFile(file, request, "qUploadFiles"); // 아래쪽 메소드로 다시 달라고 한다
			
			if (bsRenameFileName != null) {
				qna.setqOriginalFileName(file.getOriginalFilename());
				qna.setqRenameFileName(bsRenameFileName);
			}
		}
		System.out.println("Serlvet Update 수정 후 준비된 qna : " + qna);
		
		int result = qService.updateQna(qna);
		
		if (result > 0) {
			qna = qService.selectQna(qna.getqNo());
			mv.addObject("qna", qna);
			mv.setViewName("board/qna_view");
		} else {
			mv.addObject("msg","질문 수정에 실패했습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	@RequestMapping("deleteQna.do")
	public ModelAndView deleteQna(ModelAndView mv, int qNo) {
		System.out.println("servlet Delete qna : " + qNo);
		
		int result = qService.deleteQna(qNo);
		
		if (result > 0) {
			mv.setViewName("redirect:qna.go");
		} else {
			mv.addObject("msg", "질문 삭제에 실패했습니다.");
			mv.setViewName("common/errorPage");
		}

		return mv;
	}
	
	/**
	  * @Method Name : deleteQna
	  * @작성일 : Apr 30, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : QNA 삭제
	  * @param mv
	  * @param qNo
	  * @return
	  */
	@RequestMapping(value="deleteQna2.do",method= {RequestMethod.GET, RequestMethod.POST})
	public void QNAdelete(HttpServletRequest request,
							  HttpServletResponse response,
							  @RequestParam String[] delList
							  ) throws JsonIOException, IOException {
		
		int result = qService.QNAdelete(delList);

		Gson gson = new GsonBuilder().create();
		
		gson.toJson(result,response.getWriter());
			
	}
	
	@RequestMapping("endQna.do")
	public ModelAndView endQna(ModelAndView mv, int qNo) {
		System.out.println("Serlvet End QNA qno : " + qNo);
		int result = qService.endQna(qNo);
		
		if (result > 0) {
			qna = qService.selectQna(qNo);
			mv.addObject("qna", qna);
			mv.setViewName("board/qna_view");
		} else {
			mv.addObject("msg", "에러가 발생했습니다. 다시 시도해 주십시옼ㅋㅋㅋ");
			mv.setViewName("common/errorPage");
		}

		return mv;
		
	}
	
	public void profileUpload(String email, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("profileUpload");
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = realFolder + "\\" + email + "\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("profileUpload/"+email+"/"+str_filename);
		out.close();
	}
	
	/**
	  * @Method Name : QnA게시판 관리 접근
	  * @작성일 : Apr 2, 2020
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 :
	  * @return
	  */
	@RequestMapping("AdBQnA.ad")
	public ModelAndView AdBoardQnA(ModelAndView mv) {
		
		ArrayList<Qna> qaList = qService.AdBoardQnA();
		
		mv.setViewName("AdminPage/AdBoardQnA");
		mv.addObject("qaList", qaList);
		
		return mv;
	}
	
	
	
	
	

}
