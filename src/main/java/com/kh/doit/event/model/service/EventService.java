package com.kh.doit.event.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.doit.event.model.vo.Event;
import com.kh.doit.event.model.vo.EventPageInfo;

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

}
