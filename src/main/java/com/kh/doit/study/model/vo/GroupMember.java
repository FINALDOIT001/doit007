package com.kh.doit.study.model.vo;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.kh.doit.member.model.vo.Member;

@Component
public class GroupMember {
	private int gm_sgNo;
	private int gm_mNo;
	
	private ArrayList<Member> memberList;
	
	public GroupMember() {
	}
	 
	public GroupMember(int gm_sgNo, int gm_mNo, ArrayList<Member> memberList) {
		super();
		this.gm_sgNo = gm_sgNo;
		this.gm_mNo = gm_mNo;
		this.memberList = memberList;
	}

	public int getGm_sgNo() {
		return gm_sgNo;
	}

	public void setGm_sgNo(int gm_sgNo) {
		this.gm_sgNo = gm_sgNo;
	}

	public int getGm_mNo() {
		return gm_mNo;
	}

	public void setGm_mNo(int gm_mNo) {
		this.gm_mNo = gm_mNo;
	}

	public ArrayList<Member> getMemberList() {
		return memberList;
	}

	public void setMemberList(ArrayList<Member> memberList) {
		this.memberList = memberList;
	}

	@Override
	public String toString() {
		return "GroupMember [gm_sgNo=" + gm_sgNo + ", gm_mNo=" + gm_mNo + ", memberList=" + memberList + "]";
	}
}
