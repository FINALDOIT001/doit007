package com.kh.doit.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.kh.doit.study.model.vo.GroupMember;

@Component
public class Member{
	private int mno; //번호
	private String mId; //아이디
	private String mPwd; //비밀번호
	private String mName; //이름
	private String mAddr; //주소
	private String mPhone; //전화번호
	private String mEmail; //이메일
	private String mOriginalfilename; //원본 파일명
	private String mRenamefilename; //바뀐 파일명
	private Date mEnrolldate; //가입일
	private Date mUpdatedate; //수정일
	private int mhodu; // 호두갯수
	private int mUserroles; //탈퇴 여부
	private String mStatus; // 
	 
	private GroupMember gm;
	private Hodu hodu;
	
	// 기본 생성자
	public Member() {
		super();
	}

	public Member(int mno, String mId, String mPwd, String mName, String mAddr, String mPhone, String mEmail,
			String mOriginalfilename, String mRenamefilename, Date mEnrolldate, Date mUpdatedate, int mhodu,
			int mUserroles, String mStatus, GroupMember gm, Hodu hodu) {
		super();
		this.mno = mno;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.mAddr = mAddr;
		this.mPhone = mPhone;
		this.mEmail = mEmail;
		this.mOriginalfilename = mOriginalfilename;
		this.mRenamefilename = mRenamefilename;
		this.mEnrolldate = mEnrolldate;
		this.mUpdatedate = mUpdatedate;
		this.mhodu = mhodu;
		this.mUserroles = mUserroles;
		this.mStatus = mStatus;
		this.gm = gm;
		this.hodu = hodu;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmAddr() {
		return mAddr;
	}

	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmOriginalfilename() {
		return mOriginalfilename;
	}

	public void setmOriginalfilename(String mOriginalfilename) {
		this.mOriginalfilename = mOriginalfilename;
	}

	public String getmRenamefilename() {
		return mRenamefilename;
	}

	public void setmRenamefilename(String mRenamefilename) {
		this.mRenamefilename = mRenamefilename;
	}

	public Date getmEnrolldate() {
		return mEnrolldate;
	}

	public void setmEnrolldate(Date mEnrolldate) {
		this.mEnrolldate = mEnrolldate;
	}

	public Date getmUpdatedate() {
		return mUpdatedate;
	}

	public void setmUpdatedate(Date mUpdatedate) {
		this.mUpdatedate = mUpdatedate;
	}

	public int getMhodu() {
		return mhodu;
	}

	public void setMhodu(int mhodu) {
		this.mhodu = mhodu;
	}

	public int getmUserroles() {
		return mUserroles;
	}

	public void setmUserroles(int mUserroles) {
		this.mUserroles = mUserroles;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public GroupMember getGm() {
		return gm;
	}

	public void setGm(GroupMember gm) {
		this.gm = gm;
	}

	public Hodu getHodu() {
		return hodu;
	}

	public void setHodu(Hodu hodu) {
		this.hodu = hodu;
	}

	@Override
	public String toString() {
		return "Member [mno=" + mno + ", mId=" + mId + ", mPwd=" + mPwd + ", mName=" + mName + ", mAddr=" + mAddr
				+ ", mPhone=" + mPhone + ", mEmail=" + mEmail + ", mOriginalfilename=" + mOriginalfilename
				+ ", mRenamefilename=" + mRenamefilename + ", mEnrolldate=" + mEnrolldate + ", mUpdatedate="
				+ mUpdatedate + ", mhodu=" + mhodu + ", mUserroles=" + mUserroles + ", mStatus=" + mStatus + ", gm="
				+ gm + ", hodu=" + hodu + "]";
	}
	
	

	
}