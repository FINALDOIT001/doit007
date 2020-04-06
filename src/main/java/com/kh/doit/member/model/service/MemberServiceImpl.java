package com.kh.doit.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.member.model.dao.MemberDao;
import com.kh.doit.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
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

	
	

}
