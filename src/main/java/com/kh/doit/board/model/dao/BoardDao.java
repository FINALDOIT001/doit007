package com.kh.doit.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.doit.board.model.vo.Board;
import com.kh.doit.board.model.vo.PageInfo_ha;

@Repository("bDao")
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession; 

	public int getListCount() {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public ArrayList<Board> selectList(PageInfo_ha pi_h) {
		
		int offset = (pi_h.getCurrentPage() - 1) * pi_h.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi_h.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList",null,rowBounds);
	}

	public int insertBoard(Board b) {
		return sqlSession.insert("boardMapper.insertBoard",b);
	}

	public Board selectBoard(int b_no) {
		return sqlSession.selectOne("boardMapper.selectBoard",b_no);
	}

	public int updateCount(int b_no) {
		return sqlSession.update("boardMapper.updateCount",b_no);
	}

}
