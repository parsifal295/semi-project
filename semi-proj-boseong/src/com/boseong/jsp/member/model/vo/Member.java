package com.boseong.jsp.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int memNo;	//MEM_NO	NUMBER
	private String memId;	//MEM_ID	VARCHAR2(20 BYTE)
	private String memPwd;	//MEM_PWD	VARCHAR2(20 BYTE)
	private String memName;	//MEM_NAME	VARCHAR2(20 BYTE)
	private String email;	//EMAIL	VARCHAR2(100 BYTE)
	private String phone;	//PHONE	VARCHAR2(20 BYTE)
	private String area;	//AREA	VARCHAR2(30 BYTE)
	private Date enrollDate;	//ENROLL_DATE	DATE
	private String status;	//STATUS	CHAR(1 BYTE)
	
	public Member() {
		super();
	}

	public Member(int memNo, String memId, String memPwd, String memName, String email, String phone, String area,
			Date enrollDate, String status) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.email = email;
		this.phone = phone;
		this.area = area;
		this.enrollDate = enrollDate;
		this.status = status;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", email=" + email + ", phone=" + phone + ", area=" + area + ", enrollDate=" + enrollDate
				+ ", status=" + status + "]";
	}
	
	
	
	
	
}


