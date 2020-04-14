package com.kh.doit.qna.model.service;

import java.util.ArrayList;

import com.kh.doit.qna.model.vo.Qna;

public interface QnaService {

	/**
	 * 1. QNA 리스트 가져오기 Kwon
	 * 2020.04.14 KH
	 * @return
	 */
	ArrayList<Qna> selectQnaList();

	/**
	 * 2. QNA 상세보기 Kwon
	 * 2020.04.14 KH
	 * @param qno
	 * @return
	 */
	Qna selectQna(int qno);

	/**
	 * 3. QNA 추가하기 Kwon
	 * 2020.04.14 KH
	 * @param qna
	 * @return
	 */
	int insertQna(Qna qna);

}
