package com.kh.doit.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.doit.member.model.service.MailService;
import com.kh.doit.member.model.service.MemberService;
import com.kh.doit.member.model.vo.Member;

@SessionAttributes("loginUser")

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	MailService mailService;
	
	
	// 암호화 처리 
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	/**
	 * 로그인 화면으로 이동 Kwon
	 * @return
	 */
	@RequestMapping("moveLogin.go")
	public String moveLogin() {
		return "member/login";
	}
	
	/**
	 * 회원가입 화면으로 이동 Kwon
	 * @return
	 */
	@RequestMapping("moveJoin.go")
	public String moveJoin() {
		return "member/join_2";
	}
	
	@RequestMapping("joinform.go")
	public String moveJoin2() {
		return "member/join";
	}
	
	/**
	 * 아이디 중복체크
	 * 2020-04-01 김혜림
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String id) {
		int result = mService.idCheck(id);
		
		if(result > 0) {
			return "fail";
		}else {
			return "ok";
		}
	}
	
	/**
	 * 비밀번호 확인 
	 * 2020-04-01 김혜림
	 * @param userPwd
	 * @param userPwd2
	 * @return
	 */
	@ResponseBody
	@RequestMapping("pwdCheck.do")
	public String pwdCheck(String mPwd, String userPwd2) {
		if(mPwd.equals(userPwd2)) {
			return "ok";
		}else {
			return "fail";
		}
	}
	
	/**
	 * 로그인 inseok
	 * @param m
	 * @param session
	 * @return
	 */
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public ModelAndView moveLogin(@ModelAttribute Member m, ModelAndView mv ) {
		
		System.out.println(m);
		
		Member loginUser = mService.memberLogin(m);
		
		System.out.println(loginUser);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getmPwd(), loginUser.getmPwd())) {
			
			if( loginUser.getmStatus().equals("Y") ) {
				
				mv.addObject("loginUser", loginUser);
				mv.setViewName("common/main");
				
			}else {
				
				mv.addObject("msg","불건전 게시물로 정지조치되었습니다.");
				mv.setViewName("common/errorPage");
				
			}

		}else {
			
			mv.addObject("msg","로그인 실패!");
			mv.setViewName("common/errorPage");
			
		}
		
		return mv;
	}
	

		/**
		 * 로그아웃 기능 inseok
		 * @param status
		 * @return
		 */
		@RequestMapping("logout.do")
		public String logout(SessionStatus status) {
			// 로그아웃 처리를 위해 커맨드 객체로 세션의 상태를 관리할 수 있는 SessionStatus 객체가 필요
			
			// 세션의 상태를 확정지어주는 메소드
			status.setComplete();
			
			return "redirect:index.jsp";

		}
	
		/**
		 * 회원가입 
		 * 김혜림
		 * @param m
		 * @param mv
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
		@RequestMapping("join.me")
		public ModelAndView insertMember(@ModelAttribute Member m, ModelAndView mv, @RequestParam(value="phone1", required=false) String phone1,
																@RequestParam(value="phone2", required=false) String phone2,
																@RequestParam(value="phone3", required=false) String phone3,
																@RequestParam(value="email",required=false) String email,
																@RequestParam(value="selbox",required=false) String selbox,
																@RequestParam(value="selboxDirect",required=false) String selboxDirect,
																@RequestParam(value="address1",required=false) String address1,
																@RequestParam(value="address2",required=false) String address2,
																@RequestParam(value="address3",required=false) String address3) {
			
			System.out.println("회원가입 : " +m);
			
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
				m.setmAddr(address1 + "/" + address2 +"/" + address3);
			}
			
			int result = mService.insertMember(m);
			
			if(result > 0) {
				// 회원가입 성공 했을 때 로그인으로 보내주기
				Member loginUser = mService.memberLogin(m);
				mv.addObject("loginUser", loginUser);
				mv.setViewName("redirect:index.jsp");
			}else {
				mv.addObject("msg","회원가입 실패!");
				mv.setViewName("common/errorPage");
			}
			return mv;
			
		}
		
		/**
		 * 아이디찾기 화면 이동
		 * 김혜림
		 * @return
		 */
		@RequestMapping("searchId.go")
		public String searchId() {
			return "member/SearchId";
		}
		
		@RequestMapping("searchId2.go")
		public ModelAndView searchId2(ModelAndView mv, @RequestParam(value="id", required=false) String id) {
			mv.addObject("id",id);
			mv.setViewName("member/SearchId2");
			return mv;
		}
		
		/**
		 * 아이디 찾기 
		 * 김혜림
		 * @param response
		 * @param email
		 * @throws JsonIOException
		 * @throws IOException
		 */
		@RequestMapping("startSearch.go")
		public void startSearch(HttpServletResponse response, @RequestParam String email) throws JsonIOException, IOException {
			
			int result = mService.countId(email);
			
			response.setContentType("application/json; charset=utf-8");
			
			Gson gson = new GsonBuilder().create();
			if(result > 0) {
				String sId = mService.searchId(email);
				gson.toJson(sId,response.getWriter());
			}else {
				gson.toJson("no",response.getWriter());
			}
			
		}

		
		/**
		 * 비밀번호 찾기 화면 이동
		 * 김혜림
		 * @return
		 */
		@RequestMapping("searchPwd.go")
		public String searchPwd() {
			return "member/SearchPwd";
		}
		
		@RequestMapping("startPwd.go")
		public void startPwd( Member m,HttpServletResponse response, @RequestParam String id, @RequestParam String email) throws JsonIOException, IOException {
			m.setmId(id);
			m.setmEmail(email);
			int result = mService.countPwd(m);
			
			response.setContentType("application/json; charset=utf-8");
			
			Gson gson = new GsonBuilder().create();
			if(result > 0) {
				int ran = new Random().nextInt(900000) + 100000;
				gson.toJson(ran,response.getWriter());
				
			}else {
				gson.toJson("no",response.getWriter());
			}
		}
		
		/**
		 * 이메일 보내는 메소드
		 * 2020-04-23 김혜림
		 * @param email
		 * @param id
		 * @param random
		 * @param req
		 * @return
		 */
		@ResponseBody
		@RequestMapping("emailsend.go")
		public boolean createEmailCheck(@RequestParam String email,@RequestParam String id, @RequestParam int random, HttpServletRequest req) {
		/* int ran = new Random().nextInt(900000) + 100000; */
			HttpSession session = req.getSession(true);
			String authCode = String.valueOf(random);
			session.setAttribute("authCode", authCode);
			session.setAttribute("random", random);
			String subject="[Doit]비밀번호 찾기 인증번호 발급 안내 입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append(id + "님의 인증번호는 " + authCode + "입니다.");
			
			return mailService.send(subject, sb.toString(), "dodoit2020", email, null);
			
		}
		
		/**
		 * 임시비밀번호 페이지 
		 * 2020-04-23 김혜림
		 * @return
		 */
		@RequestMapping("pwdnum.go")
		public ModelAndView pwdnum(ModelAndView mv,@RequestParam String id) {
			mv.addObject("id",id);
			mv.setViewName("member/SearchPwd2");
			return mv;
		}
		
		/**
		 * 비밀번호 변경 
		 * 2020-04-23 김혜림
		 * @return
		 */
		@RequestMapping("rePwd.go")
		public ModelAndView repwd(ModelAndView mv, Member m,String mPwd,String userid) {
			// 비밀번호 암호화
			String encPwd = bcryptPasswordEncoder.encode(mPwd);
			m.setmPwd(encPwd);
			m.setmId(userid);
			
			int result = mService.pwdUpdate(m);
			if(result > 0) {
				mv.setViewName("common/main");
			}
			else {
				mv.addObject("msg","비밀번호 변경 실패!");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
		
		/**
		  * @Method Name : 회원 정보 관리 페이지 접근
		  * @작성일 : Apr 2, 2020
		  * @작성자 : songinseok
		  * @변경이력 : 
		  * @Method 설명 :
		  * @return
		  */
		@RequestMapping("AdMemMani.ad")
		public ModelAndView AdMemberManager(
					ModelAndView mv,
					HttpServletRequest request,
					HttpServletResponse response
				) {
			
			ArrayList<Member> mList = mService.AdMemberManager();
			
			mv.addObject("mList", mList);
			mv.setViewName("AdminPage/AdMemberManager");
			
			return mv;
		}
		
}
