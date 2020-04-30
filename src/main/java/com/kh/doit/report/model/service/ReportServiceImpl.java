package com.kh.doit.report.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.doit.report.model.dao.ReportDao;
import com.kh.doit.report.model.vo.Report;

@Service("rpService")
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private ReportDao rpDao;

	@Override
	public int Write(Report r) {
		
		return rpDao.Write(r);
	}

	@Override
	public ArrayList<Report> gogoAdmin() {
		
		return rpDao.gogoAdmin();
	}

	@Override
	public ArrayList<Report> MemberReport() {

		return rpDao.MemberReport();
	}

	@Override
	public ArrayList<Report> BookShareReport() {
		
		return rpDao.BookShareReport();
	}

	@Override
	public ArrayList<Report> FreeBoardReport() {

		return rpDao.FreeBoardReport();
	}

	@Override
	public ArrayList<Report> QnaReport() {
		
		return rpDao.QnaReport();
	}

	@Override
	public int FBdelete(String[] delList) {
		
		return rpDao.FBdelete(delList);
	}

	@Override
	public int banUser(String[] delList) {
		return rpDao.banUser(delList);
	}

	@Override
	public int salvation(String[] delList) {
		return rpDao.salvation(delList);
	}

	@Override
	public int FBdelete2(String[] delList) {
		return rpDao.FBdelete2(delList);
	}

	@Override
	public ArrayList<Report> AdDepositeManager() {
		return rpDao.AdDepositeManager();
	}
	
}
