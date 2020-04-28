package com.kh.doit.member.model.service;

public interface MailService {
	
	public boolean send(String subject, String text, String from, String to, String filePath);
	
}
