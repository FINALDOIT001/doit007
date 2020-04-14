package com.kh.doit.notice.model.service;

import java.util.ArrayList;

import com.kh.doit.notice.model.vo.Notice;
import com.kh.doit.notice.model.vo.PageInfo_no;

public interface NoticeService {

	/**
	 * 공지사항 글 수(필요할 수 있으니)
	 * @return
	 */
	int getNoListCount();

	/**
	 * 공지사항 리스트 조회 
	 * @param pi_n
	 * @return
	 */
	ArrayList<Notice> selectNoList(PageInfo_no pi_n);

	/**
	 * 공지사항 작성
	 * @param n
	 * @return
	 */
	int insertNotice(Notice n);

	/**
	 * 공지사항 조회 
	 * @param n_no
	 * @return
	 */
	Notice selectNotice(int n_no);

	/**
	 * 공지사항 수정
	 * @param n_no
	 * @return
	 */
	Notice selectUpdateNotice(int n_no);

	int updateNotice(Notice n);

	/**
	 * 공지사항 삭제
	 * @param n_no
	 * @return
	 */
	int deleteNotice(int n_no);
	

	

}
