package com.kh.doit.member.model.service;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.kh.doit.member.model.dao.MemberDao;
import com.kh.doit.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	private Log log = LogFactory.getLog(MemberServiceImpl.class);
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	
	
	/**
	 * 아이디 중복 체크
	 * 김혜림
	 */
	@Override
	public int idCheck(String id) {
		
		return mDao.idCheck(id);
	}


	/**
	 * 회원 가입
	 * 김혜림
	 */
	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}

	@Override
	public Member memberLogin(Member m) {
		
		return mDao.memberLogin(m);
	}


	@Override
	public String searchId(String email) {
		return mDao.searchId(email);
	}


	@Override
	public int countId(String email) {
		return mDao.countId(email);
	}


	@Override
	public int countPwd(Member m) {
		return mDao.countPwd(m);
	}


	@Override
	public boolean send(String subject, String text, String from, String to, String filePath) {
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(subject);
			helper.setText(text, true);
			helper.setFrom(from);
			helper.setTo(to);
			
			if(filePath != null) {
				File file = new File(filePath);
				if(file.exists()) {
					helper.addAttachment(file.getName(), new File(filePath));
				}
			}
			javaMailSender.send(message);
			return true;
		} catch(MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}


	@Override
	public int pwdUpdate(Member m) {
		return mDao.pwdUpdate(m);
	}




	
	

}
