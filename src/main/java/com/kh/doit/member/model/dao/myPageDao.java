package com.kh.doit.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.doit.board.model.vo.Board;
import com.kh.doit.bookShare.model.vo.BookShare;
import com.kh.doit.member.model.vo.Hodu;
import com.kh.doit.member.model.vo.Member;

@Repository("mpDao")
public class myPageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int memberUpdate(Member m) {
		return sqlSession.update("memberMapper.memberupdate",m);
	}

	public Member selectOne(String mId) {
		return sqlSession.selectOne("memberMapper.selectMember",mId);
	}

	public int deleteMember(String mId) {
		return sqlSession.delete("memberMapper.deleteMember",mId);
	}

	public ArrayList<Board> selectfbList(String mId) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectfbList",mId);
	}
	
	public ArrayList<BookShare> selectbsList(int mno) {
		System.out.println(mno);
		return (ArrayList)sqlSession.selectList("msMapper.selectbsList",mno);
	}

	public int inserthodu(Hodu hodu) {
		return sqlSession.insert("memberMapper.inserthodu",hodu);
	}

	public ArrayList<Hodu> selecthList(String mId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selecthList",mId);
	}
	
}
