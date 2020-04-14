package com.kh.doit.qna.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.qna.model.dao.QnaDao;
import com.kh.doit.qna.model.vo.Qna;

@Service("qService")
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDao qDao;

	@Override
	public ArrayList<Qna> selectQnaList() {
		return qDao.selectQnaList();
	}

	@Override
	public Qna selectQna(int qno) {
		return qDao.selectQna(qno);
	}

	@Override
	public int insertQna(Qna qna) {
		return qDao.insertQna(qna);
	}
	
	

}
