package com.kh.doit.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.doit.board.model.vo.Board;
import com.kh.doit.bookShare.model.vo.BookShare;
import com.kh.doit.member.model.service.myPageService;
import com.kh.doit.member.model.vo.Hodu;
import com.kh.doit.member.model.vo.Member;
import com.kh.doit.member.model.vo.TestHodu;
import com.kh.doit.qna.model.vo.Qna;
import com.kh.doit.study.model.vo.GroupMember;
import com.kh.doit.study.model.vo.StudyGroup;

@SessionAttributes("loginUser")

@Controller
public class myPageController {
	
	@Autowired
	private myPageService mpService;
	
	// 암호화 처리 
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("hodu.me")
	public String hodu() {
		return "member/hodupay";
	}
	
	
	/**
	 * mypage로 이동
	 * 김혜림
	 * @param mv
	 * @param mId
	 * @return
	 */
	@RequestMapping("myinfo.me")
	public ModelAndView myinfo(ModelAndView mv,@RequestParam String mId, int mno) {
		Member m = mpService.selectOne(mId);
		ArrayList<Hodu> hlist = mpService.selecthList(mId);
		ArrayList<StudyGroup> sglist = mpService.selectsglist(mno);
		ArrayList<StudyGroup> sllist = mpService.selectsllist(mno);
		System.out.println("마이페이지 : " + m);
		if(m != null) {
			mv.addObject("m",m);
			mv.addObject("hlist",hlist);
			mv.addObject("sglist",sglist);
			mv.addObject("sllist",sllist);
			System.out.println("마이페이지 리스트 : " + sllist);
			mv.setViewName("member/myPage");
		}
		return mv;
		
	}
	
	/**
	 * mylist로 이동 
	 * 김혜림
	 * @param mv
	 * @param mId
	 * @param mno
	 * @return
	 */
	@RequestMapping("mylist.me")
	public ModelAndView mylist(ModelAndView mv, @RequestParam String mId, @RequestParam int mno) {
		
		Member m = mpService.selectOne(mId);
		
		ArrayList<Board> fblist = mpService.selectfbList(mId);
		ArrayList<BookShare> bslist = mpService.selectbsList(mno);
		ArrayList<Qna> qnalist = mpService.selectqnalist(mno);
		

		if(m != null) {
			mv.addObject("m", m);
			mv.addObject("fblist", fblist);
			mv.addObject("bslist", bslist);
			mv.addObject("qnalist",qnalist);
			System.out.println(bslist);
			mv.setViewName("member/myList");
		}else {
			mv.addObject("msg", "자유게시판 리스트 불러오기 실패 !");
			mv.setViewName("common/errorPage");
		}
		
		
		return mv;
	}
	
	/**
	 * 정보수정 
	 * 김혜림
	 * @param m
	 * @param model
	 * @param request
	 * @param file
	 * @param phone1
	 * @param phone2
	 * @param phone3
	 * @param email
	 * @param selbox
	 * @param selboxDirect
	 * @param address1
	 * @param address2
	 * @param address3
	 * @return
	 */
	@RequestMapping("mupdate.go")
	public String memberUpdate(Member m, Model model,HttpServletRequest request, 
															@RequestParam(name="updatefile", required=false) MultipartFile file, 
															@RequestParam(value="phone1", required=false) String phone1,
															@RequestParam(value="phone2", required=false) String phone2,
															@RequestParam(value="phone3", required=false) String phone3,
															@RequestParam(value="email",required=false) String email,
															@RequestParam(value="selbox",required=false) String selbox,
															@RequestParam(value="selboxDirect",required=false) String selboxDirect,
															@RequestParam(value="address1",required=false) String address1,
															@RequestParam(value="address2",required=false) String address2,
															@RequestParam(value="address3",required=false) String address3) {
		
		// 비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getmPwd());
		m.setmPwd(encPwd);
					
		m.setmPhone(phone1 + "-" + phone2 + "-" + phone3);
		if(!selbox.equals("") && !selbox.equals("direct")) {
			m.setmEmail(email + "@" + selbox);
		}else if(selbox.equals("direct")){
			m.setmEmail(email + "@" + selboxDirect);
		}
		if(!address1.equals("")) {
			m.setmAddr(address1 + "," + address2 +"," + address3);
		}
		
		System.out.println("이미지 : " + file);
		
		// 이미지 업데이트
		if(file != null && !file.isEmpty()) {
			if(m.getmRenamefilename() != null) {
				deleteFile(m.getmRenamefilename(), request);
			}
			
			String mRenamefilename = saveFile(file, request);
			
			System.out.println(mRenamefilename);
			if(mRenamefilename != null) {
				m.setmOriginalfilename(file.getOriginalFilename());
				m.setmRenamefilename(mRenamefilename);
			}
		}
		
		int result = mpService.memberUpdate(m);
		
		if(result > 0) {
			// 정보수정 했을 때 마이페이지로 돌아옴
			return "redirect:myinfo.me?mId="+m.getmId()+"&mno="+m.getMno();
		}else {
			model.addAttribute("msg","정보수정 실패!");
			return "common/errorPage";
		}
		
	}
	
	/**
	 * 회원탈퇴
	 * 김혜림
	 * @param mId
	 * @param model
	 * @param status
	 * @return
	 */
	@RequestMapping("mdelete.go")
	public String deleteMember(String mId, Model model, SessionStatus status) {
		
		int result = mpService.deleteMember(mId);
		
		if(result > 0) {
			status.setComplete();
			return "redirect:index.jsp";
		}else {
			model.addAttribute("msg","회원 탈퇴 실패!");
			return "common/errorPage";
		}
	}
	
	/**
	 * 호두 결제 페이지
	 * 2020-04-13 김혜림
	 * @param response
	 * @param hodu
	 * @param hPrice
	 * @param hmNo
	 * @param hmId
	 * @param hoduNum
	 * @throws JsonIOException
	 * @throws IOException
	 */
	@RequestMapping("hpay.go")
	public void hodupay(HttpServletResponse response,Hodu hodu,@RequestParam int hPrice, @RequestParam int hmNo,@RequestParam String hmId, @RequestParam int hoduNum) throws JsonIOException, IOException {
		

		hodu.setHmNo(hmNo);
		hodu.setHmId(hmId);
		hodu.sethPrice(hPrice); 
		hodu.setHoduNum(hoduNum);
		
		TestHodu th = new TestHodu(hmNo, hoduNum);
		
		int result = mpService.inserthodu(hodu);
		System.out.println(result);
		int houpdate = mpService.updatemho(th);
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().create();
		
		if(result > 0) {
			gson.toJson(result,response.getWriter());
		}else {
			gson.toJson(result,response.getWriter());
		}
	}
	
	@RequestMapping("hodunum.go")
	public void hodumnum(HttpServletResponse response, @RequestParam(value="mno", required=false) int mno) throws JsonIOException, IOException {
		Member m = mpService.selectHodunum(mno);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().create();
		
		gson.toJson(m,response.getWriter());
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 저장할 경로 설정 
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\img" + "\\user";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdir(); // 폴더가 없으면 생성
		}
		
		String mOriginalfilename = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String mRenamefilename = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." 
						+ mOriginalfilename.substring(mOriginalfilename.lastIndexOf(".")+1);
		
		String renamePath = folder + "\\" + mRenamefilename;
		
		try {
			file.transferTo(new File(renamePath));
		}catch(Exception e) {
			System.out.println("파일 전송 에러 :" + e.getMessage());
		}
		
		return mRenamefilename;
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\img" + "\\user";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	

	
	
	
}
