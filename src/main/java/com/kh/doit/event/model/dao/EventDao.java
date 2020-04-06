package com.kh.doit.event.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.doit.event.model.vo.Event;
import com.kh.doit.event.model.vo.EventPageInfo;

@Repository
public class EventDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 1-1. 이벤트 리스트 개수 가져오기 Kwon
	 * 2020.04.06 KH
	 * @return
	 */
	public int getListCount() {
		return sqlSession.selectOne("evMapper.getListCount");
	}

	/**
	 * 1-2. 이벤트 리스트 가져오기 Kwon
	 * 2020.04.06 KH
	 * @param epi
	 * @return
	 */
	public ArrayList<Event> getEventList(EventPageInfo pi) {
		
		// 몇 개를 건너뛰고 갯수를 가져올거냐
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("evMapper.getEventList",null, rowBounds);
	}
}







