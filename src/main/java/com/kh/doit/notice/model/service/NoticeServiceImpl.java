package com.kh.doit.notice.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.notice.model.dao.NoticeDao;
import com.kh.doit.notice.model.vo.Notice;
import com.kh.doit.notice.model.vo.PageInfo_no;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao nDao;

	@Override
	public int getNoListCount() {
		return nDao.getNoListCount();
	}

	@Override
	public ArrayList<Notice> selectNoList(PageInfo_no pi_n) {
		return nDao.selectNoList(pi_n);
	}

	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(n);
	}

	@Override
	public Notice selectNotice(int n_no) {
		int result = nDao.updateCount(n_no);
		if(result > 0) {
			return nDao.selectNotice(n_no);
		}else {
			return null;
		}
	}

	@Override
	public Notice selectUpdateNotice(int n_no) {
		return nDao.selectNotice(n_no);
	}

	@Override
	public int updateNotice(Notice n) {
		return nDao.updateNotice(n);
	}

	@Override
	public int deleteNotice(int n_no) {
		return nDao.deleteNotice(n_no);
	}
	

}
