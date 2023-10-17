package com.boseong.jsp.reservation.model.vo;

public class MonthlivingReservation {
	private int reservationNo;
	private int lodgeNo;
	private int memNo;
	private String startDate;
	private int peopleNum;
	private String status;
	

	//전체
	public MonthlivingReservation(int reservationNo, int lodgeNo, int memNo, String startDate, int peopleNum,
			String status) {
		super();
		this.reservationNo = reservationNo;
		this.lodgeNo = lodgeNo;
		this.memNo = memNo;
		this.startDate = startDate;
		this.peopleNum = peopleNum;
		this.status = status;
	}



	public MonthlivingReservation(int lodgeNo, int memNo, String startDate, int peopleNum) {
		super();
		this.lodgeNo = lodgeNo;
		this.memNo = memNo;
		this.startDate = startDate;
		this.peopleNum = peopleNum;
	}





	public MonthlivingReservation(int reservationNo, int lodgeNo, int memNo, String startDate, int peopleNum) {
		super();
		this.reservationNo = reservationNo;
		this.lodgeNo = lodgeNo;
		this.memNo = memNo;
		this.startDate = startDate;
		this.peopleNum = peopleNum;
	}




	
	
	


	public MonthlivingReservation() {
		super();
	}
	
	
	


	public int getReservationNo() {
		return reservationNo;
	}





	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}





	public int getLodgeNo() {
		return lodgeNo;
	}





	public void setLodgeNo(int lodgeNo) {
		this.lodgeNo = lodgeNo;
	}





	public int getMemNo() {
		return memNo;
	}





	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}





	public String getStartDate() {
		return startDate;
	}





	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}





	public int getPeopleNum() {
		return peopleNum;
	}





	public void setPeopleNum(int peopleNum) {
		this.peopleNum = peopleNum;
	}





	public String getStatus() {
		return status;
	}





	public void setStatus(String status) {
		this.status = status;
	}

	




	@Override
	public String toString() {
		return "MonthlivingReservation [reservationNo=" + reservationNo + ", lodgeNo=" + lodgeNo + ", memNo=" + memNo
				+ ", startDate=" + startDate + ", peopleNum=" + peopleNum + ", status=" + status + "]";
	}
	
	
}