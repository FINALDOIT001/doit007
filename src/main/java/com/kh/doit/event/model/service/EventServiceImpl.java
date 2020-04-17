package com.kh.doit.event.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.event.model.dao.EventDao;
import com.kh.doit.event.model.vo.Event;
import com.kh.doit.event.model.vo.EventPageInfo;
import com.kh.doit.event.model.vo.EventReply;

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

	@Override
	public ArrayList<EventReply> selectReplyList(int eNo) {
		return eDao.selectReplyList(eNo);
	}

	@Override
	public Event selectEvent(int eNo) {
		return eDao.selectEvent(eNo);
	}

	@Override
	public int insertReply(EventReply er) {
		return eDao.insertReply(er);
	}

	@Override
	public int insertEvent(Event ev) {
		return eDao.insertEvent(ev);
	}

	@Override
	public int updateEvent(Event ev) {
		return eDao.updateEvent(ev);
	}

	@Override
	public int deleteEvent(int eNo) {
		return eDao.deleteEvent(eNo);
	}

	@Override
	public int deleteEr(int ecNo) {
		return eDao.deleteEr(ecNo);
	}

	@Override
	public int getSearchListCount(String evSearch) {
		return eDao.getSearchListCount(evSearch);
	}

	@Override
	public ArrayList<Event> getSearchList(EventPageInfo epi, String evSearch) {
		return eDao.getSearchList(epi,evSearch);
	}

	@Override
	public int getTagListCount(String eTag) {
		return eDao.getTagListCount(eTag);
	}

	@Override
	public ArrayList<Event> getTagList(EventPageInfo epi, String eTag) {
		return eDao.getTagList(epi,eTag);
	}

}
