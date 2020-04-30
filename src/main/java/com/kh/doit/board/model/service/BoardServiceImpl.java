package com.kh.doit.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.board.model.dao.BoardDao;
import com.kh.doit.board.model.vo.Board;
import com.kh.doit.board.model.vo.Board_Comments;
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

	@Override
	public Board selectUpdateBoard(int b_no) {
		return bDao.selectBoard(b_no);
	}

	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(b);
	}

	@Override
	public int deleteBoard(int b_no) {
		return bDao.deleteBoard(b_no);
	}

	@Override
	public ArrayList<Board_Comments> selectCommentList(int b_no) {
		return bDao.selectCommentList(b_no);
	}

	@Override
	public int insertComment(Board_Comments bc) {
		return bDao.insertComment(bc);
	}

	@Override
	public int deleteComment(int bc_no) {
		return bDao.deleteComment(bc_no);
	}

	@Override
	public ArrayList<Board> AdBoardFree() {
		
		return bDao.AdBoardFree();
	}

	@Override
	public int BSDelete(String[] delList) {
		return bDao.BSDelete(delList);
	}

}
