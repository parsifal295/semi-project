package com.boseong.jsp.reservation.model.vo;

public class GreenteaReservation {
	
	public int reservationNo;
	public String startDate;
	public String courseNum;
	public int memNo;
	public int bookNum;
	//public String status;
	
	
	public GreenteaReservation() {
		super();
	}


	public GreenteaReservation(int reservationNo, String startDate, String courseNum, int memNo, int bookNum,
			String status) {
		super();
		this.reservationNo = reservationNo;
		this.startDate = startDate;
		this.courseNum = courseNum;
		this.memNo = memNo;
		this.bookNum = bookNum;
		//this.status = status;
	}


	public int getReservationNo() {
		return reservationNo;
	}


	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getCourseNum() {
		return courseNum;
	}


	public void setCourseNum(String courseNum) {
		this.courseNum = courseNum;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public int getBookNum() {
		return bookNum;
	}


	public void setBookNum(int bookNum) {
		this.bookNum = bookNum;
	}

	/*
	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
	*/

	@Override
	public String toString() {
		return "GreenteaReservation [reservationNo=" + reservationNo + ", startDate=" + startDate + ", courseNum="
				+ courseNum + ", memNo=" + memNo + ", bookNum=" + bookNum +  "]";
	}
	
	

}
