package com.boseong.jsp.reservation.model.vo;

import com.boseong.jsp.freeboard.model.vo.PageInfo;

public class AdminReservation {
	private int reservNo;
	private String member;
	private String phone;
	private String type;
	private String startDate;
	private String status;
	private String reservType;
	
	
	public String getReservType() {
		return reservType;
	}
	public void setReservType(String reservType) {
		this.reservType = reservType;
	}
	public AdminReservation(int reservNo, String member, String phone, String type, String startDate, String status,
			String reservType) {
		super();
		this.reservNo = reservNo;
		this.member = member;
		this.phone = phone;
		this.type = type;
		this.startDate = startDate;
		this.status = status;
		this.reservType = reservType;
	}
	public AdminReservation(int reservNo, String member, String phone, String type, String startDate, String status) {
		super();
		this.reservNo = reservNo;
		this.member = member;
		this.phone = phone;
		this.type = type;
		this.startDate = startDate;
		this.status = status;
	}
	public AdminReservation() {
		super();
	}
	@Override
	public String toString() {
		return "AdminReservation [reservNo=" + reservNo + ", member=" + member + ", phone=" + phone + ", type=" + type
				+ ", startDate=" + startDate + ", status=" + status + ", reservType=" + reservType + "]";
	}
	public int getReservNo() {
		return reservNo;
	}
	public void setReservNo(int reservNo) {
		this.reservNo = reservNo;
	}
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	

}
