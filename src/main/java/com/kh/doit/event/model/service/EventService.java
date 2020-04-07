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
	ArrayList<BookShareReply> selectReplyList(int eNo);

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


}
