package com.kh.doit.event.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.doit.bookShare.model.vo.BookShareReply;
import com.kh.doit.event.model.vo.Event;
import com.kh.doit.event.model.vo.EventPageInfo;
import com.kh.doit.event.model.vo.EventReply;

public interface EventService {

	/**
	 * 1-1. 리스트 개수 불러오기 Kwon
	 * 2020.04.06 KH
	 * @return
	 */
	int getListCount();

	/**
	 * 1-2. 리스트 불러오기 Kwon
	 * 2020.04.06 KH
	 * @param epi
	 * @return
	 */
	ArrayList<Event> selectList(EventPageInfo epi);
	
	/**
	 * 1-3. 댓글 리스트 불러오기
	 * @param eNo
	 * @return
	 */
	ArrayList<EventReply> selectReplyList(int eNo);

	/**
	 * 2. Event 1개 불러오기 Kwon
	 * 2020.04.06 HOME
	 * @param eNo
	 * @return
	 */
	Event selectEvent(int eNo);

	/**
	 * 3. Add Event Reply Kwon
	 * 2020.04.07 KH
	 * @param er
	 * @return
	 */
	int insertReply(EventReply er);

	/**
	 * 4. Insert Event Kwon
	 * 2020.04.08 KH
	 * @param e
	 * @return
	 */
	int insertEvent(Event ev);

	/**
	 * 5. update Event Kwon
	 * 2020.04.09 KH
	 * @param ev
	 * @return
	 */
	int updateEvent(Event ev);

	/**
	 * 6. Delete Event Kwon
	 * 2020.04.09 KH
	 * @param eNo
	 * @return
	 */
	int deleteEvent(int eNo);

	/**
	 * 7. delete Event Reply  Kwon
	 * 2020.04.09 KH
	 * @param ecNo
	 * @return
	 */
	int deleteEr(int ecNo);

	/**
	 * 8. 검색용 리스트 갯수 가져오기
	 * @param evSearch 
	 * @return
	 */
	int getSearchListCount(String evSearch);

	/**
	 * 검색한 리스트 가져오기
	 * @param epi
	 * @param evSearch
	 * @return
	 */
	ArrayList<Event> getSearchList(EventPageInfo epi, String evSearch);

	/**
	 * 9. 태그용 리스트 개수 가져오기 Kwon
	 * 2020.04.16 KH
	 * @param eTag
	 * @return
	 */
	int getTagListCount(String eTag);

	/**
	 * 9-2. 태그로 리스트 가져오기 Kwon
	 * 2020.4.16 KH
	 * @param epi
	 * @param eTag
	 * @return
	 */
	ArrayList<Event> getTagList(EventPageInfo epi, String eTag);

	/**
	 * 9-1. 전체 리스트 가져오기
	 * @return
	 */
	ArrayList<Event> selectListAll();

	/**
	 * 10. 조회수 추가
	 * @param eNo
	 * @return
	 */
	int updateCount(int eNo);


}
