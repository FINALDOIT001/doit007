package com.kh.doit.qna.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.doit.qna.model.vo.Qna;

@Repository
public class QnaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 1. QNA List 가져오기 Kwon
	 * 2020.04.14 KH
	 * @return
	 */
	public ArrayList<Qna> selectQnaList() {
		return (ArrayList)sqlSession.selectList("boardMapper.selectQnaList");
	}

	/**
	 * 2. QNA 상세보기 Kwon
	 * 2020.04.14 KH
	 * @param qno
	 * @return
	 */
	public Qna selectQna(int qNo) {
		return sqlSession.selectOne("boardMapper.selectQna", qNo);
	}

	/**
	 * 3. QNA 추가하기 Kwon
	 * 2020.04.14 KH
	 * @param qna
	 * @return
	 */
	public int insertQna(Qna qna) {
		return sqlSession.insert("boardMapper.insertQna", qna);
	}

	

}
