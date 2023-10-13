package com.boseong.jsp.reservation.model.vo;

import java.sql.Date;

public class HorseReservation {
	private int reservNo;
	private int memNo;
	private String programNo;
	private String horseDate;
	private int horseTime;
	private int riderNum;
	private String message;
	private String status;
	
	
	public HorseReservation(int reservNo, int memNo, String programNo, String horseDate, int horseTime, int riderNum,
			String message, String status) {
		super();
		this.reservNo = reservNo;
		this.memNo = memNo;
		this.programNo = programNo;
		this.horseDate = horseDate;
		this.horseTime = horseTime;
		this.riderNum = riderNum;
		this.message = message;
		this.status = status;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public HorseReservation(int reservNo, int memNo, String programNo, String horseDate, int horseTime, int riderNum,
			String message) {
		super();
		this.reservNo = reservNo;
		this.memNo = memNo;
		this.programNo = programNo;
		this.horseDate = horseDate;
		this.horseTime = horseTime;
		this.riderNum = riderNum;
		this.message = message;
	}
	public HorseReservation() {
		super();
	}
	public HorseReservation(int reservNo, int memNo, String programNo, String horseDate, int horseTime, int riderNum) {
		super();
		this.reservNo = reservNo;
		this.memNo = memNo;
		this.programNo = programNo;
		this.horseDate = horseDate;
		this.horseTime = horseTime;
		this.riderNum = riderNum;
	}
	@Override
	public String toString() {
		return "HorseReservation [reservNo=" + reservNo + ", memNo=" + memNo + ", programNo=" + programNo
				+ ", horseDate=" + horseDate + ", horseTime=" + horseTime + ", riderNum=" + riderNum + ", message="
				+ message + ", status=" + status + "]";
	}
	public int getReservNo() {
		return reservNo;
	}
	public void setReservNo(int reservNo) {
		this.reservNo = reservNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getProgramNo() {
		return programNo;
	}
	public void setProgramNo(String programNo) {
		this.programNo = programNo;
	}
	public String getHorseDate() {
		return horseDate;
	}
	public void setHorseDate(String horseDate) {
		this.horseDate = horseDate;
	}
	public int getHorseTime() {
		return horseTime;
	}
	public void setHorseTime(int horseTime) {
		this.horseTime = horseTime;
	}
	public int getRiderNum() {
		return riderNum;
	}
	public void setRiderNum(int riderNum) {
		this.riderNum = riderNum;
	}
	
	

}
