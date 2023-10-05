package com.boseong.jsp.reservation.model.vo;

import java.sql.Date;

public class HanokReservation {
	private int reservNo;
	private int roomNo;
	private int memNo;
	private Date fromDate;
	private Date toDate;
	private int clientNum;
	private String message;
	public HanokReservation() {
		super();
	}
	public HanokReservation(int reservNo, int roomNo, int memNo, Date fromDate, Date toDate, int clientNum,
			String message) {
		super();
		this.reservNo = reservNo;
		this.roomNo = roomNo;
		this.memNo = memNo;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.clientNum = clientNum;
		this.message = message;
	}
	public int getReservNo() {
		return reservNo;
	}
	public void setReservNo(int reservNo) {
		this.reservNo = reservNo;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	public int getClientNum() {
		return clientNum;
	}
	public void setClientNum(int clientNum) {
		this.clientNum = clientNum;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "HanokReservation [reservNo=" + reservNo + ", roomNo=" + roomNo + ", memNo=" + memNo + ", fromDate="
				+ fromDate + ", toDate=" + toDate + ", clientNum=" + clientNum + ", message=" + message + "]";
	}
	
	
}
