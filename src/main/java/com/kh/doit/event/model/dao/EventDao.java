package com.kh.doit.event.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.doit.bookShare.model.vo.BookShareReply;
import com.kh.doit.event.model.vo.Event;
import com.kh.doit.event.model.vo.EventPageInfo;
import com.kh.doit.event.model.vo.EventReply;

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

	/**
	 * 2. Event 1개 가져오기 Kwon	
	 * 2020.04.06 HOME
	 * @param eNo
	 * @return
	 */
	public Event selectEvent(int eNo) {
		return sqlSession.selectOne("evMapper.selectEvent",eNo);
	}

	/**
	 * 1-3. 이벤트 댓글 가져오기 Kwon
	 * 2020.04.07 KH
	 * @param eNo
	 * @return
	 */
	public ArrayList<EventReply> selectReplyList(int eNo) {
		return (ArrayList)sqlSession.selectList("evMapper.selectReply", eNo);
	}

	/**
	 * Event Page 댓글달기 Kwon
	 * 2020.04.07 KH
	 * @param er
	 * @return
	 */
	public int insertReply(EventReply er) {
		return sqlSession.insert("evMapper.insertReply", er);
	}

	/**
	 * Event 추가하기 Kwon
	 * 2020.04.08 KH
	 * @param ev
	 * @return
	 */
	public int insertEvent(Event ev) {
		return sqlSession.insert("evMapper.insertEvent",ev);
	}

	/**
	 * Event update Kwon
	 * 2020.04.09 KH
	 * @param ev
	 * @return
	 */
	public int updateEvent(Event ev) {
		return sqlSession.update("evMapper.updateEvent", ev);
	}

	/**
	 * 이벤트 글 삭제하기 Kwon
	 * 2020.04.09 KH
	 * @param eNo
	 * @return
	 */
	public int deleteEvent(int eNo) {
		return sqlSession.update("evMapper.deleteEvent", eNo);
	}

	/**
	 * 이벤트 댓글 삭제하기 Kwon
	 * 2020.04.09 KH
	 * @param ecNo
	 * @return
	 */
	public int deleteEr(int ecNo) {
		return sqlSession.update("evMapper.deleteEr",ecNo);
	}

	/**
	 * 검색한 게시글 갯수 가져오기
	 * @return
	 */
	public int getSearchListCount(String evSearch) {
		return sqlSession.selectOne("evMapper.getSearchListCount", evSearch);
	}
	
	public ArrayList<Event> getSearchList(EventPageInfo epi, String evSearch) {
		
		int offset = (epi.getCurrentPage() - 1) * epi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, epi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("evMapper.SearchList", evSearch, rowBounds);
	}
	
	
	
	
	
	
	
	
	
	
}







