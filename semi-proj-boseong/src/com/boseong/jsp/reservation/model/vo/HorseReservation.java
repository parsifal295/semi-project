package com.boseong.jsp.reservation.model.vo;

import java.sql.Date;

public class HorseReservation {
	private int reservNo;
	private int memNo;
	private String programNo;
	private Date horseDate;
	private int horseTime;
	private int riderNum;
	public HorseReservation() {
		super();
	}
	public HorseReservation(int reservNo, int memNo, String programNo, Date horseDate, int horseTime, int riderNum) {
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
				+ ", horseDate=" + horseDate + ", horseTime=" + horseTime + ", riderNum=" + riderNum + "]";
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
	public Date getHorseDate() {
		return horseDate;
	}
	public void setHorseDate(Date horseDate) {
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
