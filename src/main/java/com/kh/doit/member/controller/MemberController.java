package com.kh.doit.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.doit.member.model.service.MemberService;
import com.kh.doit.member.model.vo.Member;
import com.kh.doit.util.UserSha256;

@SessionAttributes("loginUser")

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
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
	public String moveLogin(@ModelAttribute Member m, Model model ) {
		
		System.out.println(m);
		
		Member loginUser = mService.memberLogin(m);
		
		System.out.println(loginUser);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getmPwd(), loginUser.getmPwd())) {
			
			model.addAttribute("loginUser", loginUser);
			return "redirect:index.jsp"; 
			
			
		}else {
			
			model.addAttribute("msg","로그인 실패!");
			return "common/errorPage";
			
		}
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
			
			return "redirect:commom/main.jsp";
		}
	
		@RequestMapping("join.me")
		public ModelAndView insertMember(Member m, ModelAndView mv, @RequestParam(value="phone1", required=false) String phone1,
																@RequestParam(value="phone2", required=false) String phone2,
																@RequestParam(value="phone3", required=false) String phone3,
																@RequestParam(value="email",required=false) String email,
																@RequestParam(value="selbox",required=false) String selbox,
																@RequestParam(value="selboxDirect",required=false) String selboxDirect,
																@RequestParam(value="address1",required=false) String address1,
																@RequestParam(value="address2",required=false) String address2,
																@RequestParam(value="address3",required=false) String address3) {
			
			System.out.println(m);
			
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
			
			int result = mService.insertMember(m);
			
			if(result > 0) {
				// 회원가입 성공 했을 때 로그인으로 보내주기
				mv.setViewName("redirect:index.jsp");
			}else {
				mv.addObject("msg","회원가입 실패!");
				mv.setViewName("common/errorPage");
			}
			return mv;
			
		}
		
}
