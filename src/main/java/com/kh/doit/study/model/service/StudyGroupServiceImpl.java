package com.kh.doit.study.model.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.study.model.dao.StudyGroupDao;
import com.kh.doit.study.model.vo.GroupMember;
import com.kh.doit.study.model.vo.PageInfojung;
import com.kh.doit.study.model.vo.StudyGroup;

@Service("sgService")
public class StudyGroupServiceImpl implements StudyGroupService {

	@Autowired
	private StudyGroupDao sgDao;
	
	
	@Override
	public int getlistCount() {
		
		
		return sgDao.getlistCount();
	}


	@Override
	public ArrayList<StudyGroup> selectList(PageInfojung pi) {
		 
		return sgDao.selectList(pi);
	}



	@Override
	public int sgInsert(StudyGroup sg) {
		// TODO Auto-generated method stub
		return sgDao.sgInsert(sg);
	}
	

	/**
	 * 작성자 : 서정도 
	 */
	@Override
	public StudyGroup selectSg(int sgNo) {
		return sgDao.selectSg(sgNo);
	}


	@Override
	public ArrayList<GroupMember> selectGroupMember(int sgNo) {
		return sgDao.selectGroupMember(sgNo);
	}
	
	

}
