package com.kh.doit.bookShare.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.doit.bookShare.model.vo.BookShare;
import com.kh.doit.bookShare.model.vo.BookShareReply;

@Repository
public class BookShareDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 1. BS 리스트 가져오기 Kwon
	 * 2020.03.31
	 * @return
	 */
	public ArrayList<BookShare> selectList() {
		return (ArrayList)sqlSession.selectList("msMapper.selectBSList");
	}

	/**
	 * 2. SelectOneBS Kwon
	 * 2020.03.01 
	 * @param bsNo
	 * @return
	 */
	public BookShare selectOne(int bsNo) {
		return sqlSession.selectOne("msMapper.selectOne", bsNo);
	}

	/**
	 * 2-1. BS 댓글 가져오기 Kwon
	 * 2020.04.01
	 * @param bsNo
	 * @return
	 */
	public ArrayList<BookShareReply> selectReplyList(int bsNo) {
		System.out.println("다오 bsNo : " + bsNo);
		ArrayList<BookShareReply> list = (ArrayList)sqlSession.selectList("msMapper.selectBSReply", bsNo);
		System.out.println("Dao 댓글리스트 : " + list);
		return list;
	}

	/**
	 * 2-2. BS 댓글달기 Kwon
	 * 2020.04.02
	 * @param r
	 * @return
	 */
	public int insertReply(BookShareReply r) {
		System.out.println("Dao 댓글달기 : "+r);
		return sqlSession.insert("msMapper.insertReply",r);
	}

	/**
	 * 3. BS 추가하기 Kwon
	 * 2020.04.03 KH
	 * @param bs
	 * @return
	 */
	public int insertBookShare(BookShare bs) {
		return sqlSession.insert("msMapper.insertBookShare", bs);
	}

	/**
	 * BS 삭제하기 Kwon
	 * 2020.04.05 HOME
	 * @param bsNo
	 * @return
	 */
	public int deleteBs(int bsNo) {
		return sqlSession.update("msMapper.deleteBookShare", bsNo);
	}

	/**
	 * 책 나눔이 완료되었다. Kwon
	 * 2020.04.05 HOME
	 * @param bsNo
	 * @return
	 */
	public int endBs(int bsNo) {
		return sqlSession.update("msMapper.endBookShare",bsNo);
	}

	/**
	 * BookShare 수정하기 Kwon
	 * 2020.04.05 HOME
	 * @param bs
	 * @return
	 */
	public int updateBs(BookShare bs) {
		System.out.println("Dao 책 수정하기 bs :  " + bs);
		return sqlSession.update("msMapper.updateBookShare", bs);
	}

}
