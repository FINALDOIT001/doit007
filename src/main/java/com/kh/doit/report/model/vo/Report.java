package com.kh.doit.report.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import com.kh.doit.board.model.vo.Board;
import com.kh.doit.bookShare.model.vo.BookShare;
import com.kh.doit.member.model.vo.Member;
import com.kh.doit.qna.model.vo.Qna;
import com.kh.doit.study.model.vo.StudyGroup;

@Component
public class Report implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5175873422746060550L;
	private int rpNo;			// 신고 번호
	private String rpWriter;	// 리폿한 아이디
	private String rpUserID;	// 리폿당한 아이디
	private String rpTitle;		// 리폿 게시물 제목
	private int rpBno;			// 리폿한 게시물 번호
	private String rpBType;		// 리폿한 게시물 타입
	private String rpCotext;	// 리폿한 내용
	private Date rpDate1;		// 리폿한 날짜
	private Date rpDate2;		// 리폿 처리날짜
	private String rpStatus;	// 리폿 처리상태
	
	private Member member;		// 조인을 위한 멤버
	private Board board;		// 조인을 위한 프리보드
	private Qna qna;			// 조인을 위한 QNA
	private BookShare bookshare;// 조인을 위한 북쉐어
	private StudyGroup studygroup;	// 조인을 위한 스터디그룹
	
	public Report() {}
	
	public Report(String rpWriter, String rpUserID, String rpTitle, int rpBno, String rpBType, String rpCotext) {
		this.rpWriter = rpWriter;
		this.rpUserID = rpUserID;
		this.rpTitle = rpTitle;
		this.rpBno = rpBno;
		this.rpBType = rpBType;
		this.rpCotext = rpCotext;
	}
	
	public Report(int rpNo, String rpWriter, String rpUserID, String rpTitle, int rpBno, String rpBType,
			String rpCotext, Date rpDate1, Date rpDate2, String rpStatus) {
		super();
		this.rpNo = rpNo;
		this.rpWriter = rpWriter;
		this.rpUserID = rpUserID;
		this.rpTitle = rpTitle;
		this.rpBno = rpBno;
		this.rpBType = rpBType;
		this.rpCotext = rpCotext;
		this.rpDate1 = rpDate1;
		this.rpDate2 = rpDate2;
		this.rpStatus = rpStatus;
	}

	public String getRpUserID() {
		return rpUserID;
	}
	public void setRpUserID(String rpUserID) {
		this.rpUserID = rpUserID;
	}
	public String getRpTitle() {
		return rpTitle;
	}
	public void setRpTitle(String rpTitle) {
		this.rpTitle = rpTitle;
	}
	public int getRpBno() {
		return rpBno;
	}
	public void setRpBno(int rpBno) {
		this.rpBno = rpBno;
	}
	public String getRpBType() {
		return rpBType;
	}
	public void setRpBType(String rpBType) {
		this.rpBType = rpBType;
	}
	public String getRpCotext() {
		return rpCotext;
	}
	public void setRpCotext(String rpCotext) {
		this.rpCotext = rpCotext;
	}

	public String getRpWriter() {
		return rpWriter;
	}

	public void setRpWriter(String rpWriter) {
		this.rpWriter = rpWriter;
	}

	public int getRpNo() {
		return rpNo;
	}

	public void setRpNo(int rpNo) {
		this.rpNo = rpNo;
	}

	public String getRpStatus() {
		return rpStatus;
	}

	public void setRpStatus(String rpStatus) {
		this.rpStatus = rpStatus;
	}

	public Date getRpDate1() {
		return rpDate1;
	}

	public void setRpDate1(Date rpDate1) {
		this.rpDate1 = rpDate1;
	}

	public Date getRpDate2() {
		return rpDate2;
	}

	public void setRpDate2(Date rpDate2) {
		this.rpDate2 = rpDate2;
	}

	@Override
	public String toString() {
		return "Report [rpNo=" + rpNo + ", rpWriter=" + rpWriter + ", rpUserID=" + rpUserID + ", rpTitle=" + rpTitle
				+ ", rpBno=" + rpBno + ", rpBType=" + rpBType + ", rpCotext=" + rpCotext + ", rpDate1=" + rpDate1
				+ ", rpDate2=" + rpDate2 + ", rpStatus=" + rpStatus + "]";
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public Qna getQna() {
		return qna;
	}

	public void setQna(Qna qna) {
		this.qna = qna;
	}

	public BookShare getBookshare() {
		return bookshare;
	}

	public void setBookshare(BookShare bookshare) {
		this.bookshare = bookshare;
	}

	public StudyGroup getStudygroup() {
		return studygroup;
	}

	public void setStudygroup(StudyGroup studygroup) {
		this.studygroup = studygroup;
	}

	
}
