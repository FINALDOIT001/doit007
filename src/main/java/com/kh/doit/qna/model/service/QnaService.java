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

	/**
	 * 4. QNA 수정하기 Kwon
	 * 2020.04.16 KH
	 * @param qna
	 * @return
	 */
	int updateQna(Qna qna);

	/**
	 * 5. QNA 삭제하기 Kwon
	 * 2020.04.16 KH
	 * @param qNo
	 * @return
	 */
	int deleteQna(int qNo);

	/**
	 * 6. QNA 질문 -> 답변완료로 변경 Kwon
	 * 2020.04.16 KH
	 * @param qNo
	 * @return
	 */
	int endQna(int qNo);

}
