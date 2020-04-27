package com.kh.doit.study.model.vo;

import org.springframework.stereotype.Component;

@Component
public class EtcFile {
	
	private int etcfNo; // FK
	private String etcfOriginalFileName;
	private String etcfRenameFileName;
	
	public EtcFile() {
	}

	public EtcFile(int etcfNo, String etcfOriginalFileName, String etcfRenameFileName) {
		super();
		this.etcfNo = etcfNo;
		this.etcfOriginalFileName = etcfOriginalFileName;
		this.etcfRenameFileName = etcfRenameFileName;
	}

	public int getEtcfNo() {
		return etcfNo;
	}

	public void setEtcfNo(int etcfNo) {
		this.etcfNo = etcfNo;
	}

	public String getEtcfOriginalFileName() {
		return etcfOriginalFileName;
	}

	public void setEtcfOriginalFileName(String etcfOriginalFileName) {
		this.etcfOriginalFileName = etcfOriginalFileName;
	}

	public String getEtcfRenameFileName() {
		return etcfRenameFileName;
	}

	public void setEtcfRenameFileName(String etcfRenameFileName) {
		this.etcfRenameFileName = etcfRenameFileName;
	}

	@Override
	public String toString() {
		return "EtcFile [etcfNo=" + etcfNo + ", etcfOriginalFileName=" + etcfOriginalFileName + ", etcfRenameFileName="
				+ etcfRenameFileName + "]";
	}


	

}
