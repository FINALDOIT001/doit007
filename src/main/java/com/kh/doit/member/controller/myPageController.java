package com.kh.doit.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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

import com.kh.doit.board.model.vo.Board;
import com.kh.doit.member.model.service.myPageService;
import com.kh.doit.member.model.vo.Member;

@SessionAttributes("loginUser")

@Controller
public class myPageController {
	
	@Autowired
	private myPageService mpService;
	
	// 암호화 처리 
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;


	@RequestMapping("myinfo.me")
	public ModelAndView myinfo(ModelAndView mv,@RequestParam String mId) {
		Member m = mpService.selectOne(mId);
		
		if(m != null) {
			mv.addObject("m",m);
			mv.setViewName("member/myPage");
		}
		return mv;
		
	}
	
	@RequestMapping("mylist.me")
	public ModelAndView mylist(ModelAndView mv, @RequestParam String mId) {
		
		ArrayList<Board> fblist = null;
		
		fblist = mpService.selectfbList(mId);
		
		
		return mv;
	}
	
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
				m.setmOrginalfilename(file.getOriginalFilename());
				m.setmRenamefilename(mRenamefilename);
			}
		}
		
		int result = mpService.memberUpdate(m);
		
		if(result > 0) {
			// 정보수정 했을 때 마이페이지로 돌아옴
			return "redirect:myinfo.me?mId="+m.getmId();
		}else {
			model.addAttribute("msg","정보수정 실패!");
			return "common/errorPage";
		}
		
	}
	
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
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 저장할 경로 설정 
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\img" + "\\user";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdir(); // 폴더가 없으면 생성
		}
		
		String mOrginalfilename = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String mRenamefilename = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." 
						+ mOrginalfilename.substring(mOrginalfilename.lastIndexOf(".")+1);
		
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
