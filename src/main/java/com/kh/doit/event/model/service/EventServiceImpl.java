package com.kh.doit.event.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.event.model.dao.EventDao;
import com.kh.doit.event.model.vo.Event;
import com.kh.doit.event.model.vo.EventPageInfo;

@Service("eService")
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDao eDao;

	@Override
	public int getListCount() {
		return eDao.getListCount();
	}

	@Override
	public ArrayList<Event> selectList(EventPageInfo epi) {
		return eDao.getEventList(epi);
	}
}
