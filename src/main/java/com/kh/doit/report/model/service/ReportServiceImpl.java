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
	
	
}
