package com.kh.doit.qna.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.qna.model.dao.QnaDao;

@Service("qService")
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDao qDao;
	
	

}
