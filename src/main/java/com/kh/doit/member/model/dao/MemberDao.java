package com.kh.doit.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.doit.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int idCheck(String id) {
		return sqlSession.selectOne("memberMapper.idCheck",id);
	}

	public Member memberLogin(Member m) {

		return (Member)sqlSession.selectOne("memberMapper.memberLogin",m);
	}
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public String searchId(String email) {
		
		return sqlSession.selectOne("memberMapper.searchId",email);
	}

	public int countId(String email) {
		return sqlSession.selectOne("memberMapper.countId",email);
	}

	public int countPwd(Member m) {
		return sqlSession.selectOne("memberMapper.countPwd",m);
	}

	public int pwdUpdate(Member m) {
		return sqlSession.update("memberMapper.pwdUpdate",m);
	}

	public ArrayList<Member> AdMemberManager() {
		return (ArrayList)sqlSession.selectList("memberMapper.AdMemberManager");
	}

}
