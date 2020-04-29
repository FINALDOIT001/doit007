package com.kh.doit.report.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.doit.report.model.vo.Report;

@Repository("rpDao")
public class ReportDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int Write(Report r) {
		
		return sqlSession.insert("ReportMapper.Write", r);
	}

	public ArrayList<Report> gogoAdmin() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("ReportMapper.gogoAdmin");
	}

}
