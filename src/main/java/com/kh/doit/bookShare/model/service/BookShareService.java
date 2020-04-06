package com.kh.doit.bookShare.model.service;

import java.util.ArrayList;

import com.kh.doit.bookShare.model.vo.BookShare;
import com.kh.doit.bookShare.model.vo.BookShareReply;

public interface BookShareService {

	/**
	 * 1. 책 나눔 리스트 가져오기 Kwon
	 * 2020.04.01
	 * @return
	 */
	ArrayList<BookShare> selectList();

	/**
	 * 2. 책 한권 Detail 보기 Kwon
	 * 2020.04.01 
	 * @param bsNo
	 * @return
	 */
	BookShare selectOne(int bsNo);

	/**
	 * 2-1. Detail 댓글 가져오기 Kwon
	 * @param bsNo
	 * @return
	 */
	ArrayList<BookShareReply> selectReplyList(int bsNo);

	/**
	 * 2-2. 댓글 달기 Kwon
	 * @param r
	 * @return
	 */
	int insertReply(BookShareReply r);

	/**
	 * 3. InsertBookShare Kwon
	 * 2020.04.03 KH 
	 * @param bs
	 * @return
	 */
	int insertBookShare(BookShare bs);

	/**
	 * DELETE BookShare Kwon
	 * 2020.04.05 HOME
	 * @param bsNo
	 * @return
	 */
	int deleteBs(int bsNo);

	/**
	 * 책 나눔 완료 Kwon
	 * 2020.04.05 HOME
	 * @param bsNo
	 * @return
	 */
	int endBs(int bsNo);

	/**
	 * BS update Kwon
	 * 2020.04.05 HOME
	 * @param bs
	 * @return
	 */
	int updateBs(BookShare bs);

}
