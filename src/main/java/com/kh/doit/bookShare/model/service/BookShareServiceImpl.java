package com.kh.doit.bookShare.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.bookShare.model.dao.BookShareDao;
import com.kh.doit.bookShare.model.vo.BookShare;
import com.kh.doit.bookShare.model.vo.BookShareReply;

@Service("bsService")
public class BookShareServiceImpl implements BookShareService {

	@Autowired
	private BookShareDao bsDao;
	
	@Override
	public ArrayList<BookShare> selectList() {
		return bsDao.selectList();
	}
	@Override
	public BookShare selectOne(int bsNo) {
		return bsDao.selectOne(bsNo);
	}
	@Override
	public ArrayList<BookShareReply> selectReplyList(int bsNo) {
		return bsDao.selectReplyList(bsNo);
	}
	@Override
	public int insertReply(BookShareReply r) {
		return bsDao.insertReply(r);
	}
	@Override
	public int insertBookShare(BookShare bs) {
		return bsDao.insertBookShare(bs);
	}
	@Override
	public int deleteBs(int bsNo) {
		return bsDao.deleteBs(bsNo);
	}
	@Override
	public int endBs(int bsNo) {
		return bsDao.endBs(bsNo);
	}
	@Override
	public int updateBs(BookShare bs) {
		return bsDao.updateBs(bs);
	}
	@Override
	public int deleteReply(int bscNo) {
		return bsDao.deleteReply(bscNo);
	}
	
	


}
