package com.kh.doit.board.model.service;

import java.util.ArrayList;

import com.kh.doit.board.model.vo.Board;
import com.kh.doit.board.model.vo.PageInfo_ha;

public interface BoardService {
	
	/**
	 * 1. 게시판 총 개수 조회 
	 * @return
	 */
	int getListCount();

	/**
	 * 2. 게시판 리스트 조회 
	 * @param pi_h
	 * @return
	 */
	ArrayList<Board> selectList(PageInfo_ha pi_h);

	/**
	 * 3. 게시글 작성(insert)
	 * @param b
	 * @return
	 */
	int insertBoard(Board b);

	/**
	 * 4. 게시판 상세보기
	 * @param b_no
	 * @return
	 */
	Board selectBoard(int b_no);

}
