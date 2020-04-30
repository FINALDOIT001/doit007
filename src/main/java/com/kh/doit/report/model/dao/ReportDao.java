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
		
		return (ArrayList)sqlSession.selectList("ReportMapper.gogoAdmin");
	}

	public ArrayList<Report> MemberReport() {
		
		return (ArrayList)sqlSession.selectList("ReportMapper.MemberReport");
	}

	public ArrayList<Report> BookShareReport() {
		
		return (ArrayList)sqlSession.selectList("ReportMapper.BookShareReport");
	}

	public ArrayList<Report> FreeBoardReport() {
		
		return (ArrayList)sqlSession.selectList("ReportMapper.FreeBoardReport");
	}

	public ArrayList<Report> QnaReport() {
		
		return (ArrayList)sqlSession.selectList("ReportMapper.QnaReport");
	}

	public int FBdelete(String[] delList) {
		// TODO Auto-generated method stub
		return sqlSession.update("ReportMapper.FBdelete",delList);
	}

	public int banUser(String[] delList) {
		
		return sqlSession.update("ReportMapper.banUser",delList);
	}

	public int salvation(String[] delList) {
		return sqlSession.update("ReportMapper.salvation",delList);
	}

	public int FBdelete2(String[] delList) {
		return sqlSession.delete("ReportMapper.FBdelete2",delList);
	}

	public ArrayList<Report> AdDepositeManager() {
		return (ArrayList)sqlSession.selectList("ReportMapper.AdDepositeManager");
	}

}
