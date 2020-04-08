package com.kh.doit.board.model.service;

import java.util.ArrayList;

import com.kh.doit.board.model.vo.Board;
import com.kh.doit.board.model.vo.Board_Comments;
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
	 * 4. 게시글 상세보기
	 * @param b_no
	 * @return
	 */
	Board selectBoard(int b_no);

	/**
	 * 5. 게시글 수정
	 * @param b_no
	 * @return
	 */
	Board selectUpdateBoard(int b_no);

	int updateBoard(Board b);

	/**
	 * 6. 게시글 삭제
	 * @param b_no
	 * @return
	 */
	int deleteBoard(int b_no);

	/**
	 * 7. 댓글 조회 
	 * @param b_no
	 * @return
	 */
	ArrayList<Board_Comments> selectCommentList(int b_no);

	/**
	 * 8. 댓글 등록
	 * @param bc
	 * @return
	 */
	int insertComment(Board_Comments bc);

	/**
	 * 9. 댓글 삭제
	 * @param b_no
	 * @return
	 */
	int deleteComment(int bc_no);

}
