package com.kh.doit.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.board.model.dao.BoardDao;
import com.kh.doit.board.model.vo.Board;
import com.kh.doit.board.model.vo.PageInfo_ha;

@Service("bService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao bDao;

	@Override
	public int getListCount() {
		return bDao.getListCount();
	}

	@Override
	public ArrayList<Board> selectList(PageInfo_ha pi_h) {
		return bDao.selectList(pi_h);
	}

	@Override
	public int insertBoard(Board b) {
		return bDao.insertBoard(b);
	}

	@Override
	public Board selectBoard(int b_no) {
		int result = bDao.updateCount(b_no);
		if(result > 0) {
			return bDao.selectBoard(b_no);
		}else {
			return null;
		}
	}

}
