package com.boseong.jsp.reservation.model.vo;

public class greenteaInfo {
	
	public String courseNum;
	public String infoDesc;
	public int price;
	
	
	
	public greenteaInfo() {
		super();
	}
	
	
	
	public greenteaInfo(String courseNum, String infoDesc, int price) {
		super();
		this.courseNum = courseNum;
		this.infoDesc = infoDesc;
		this.price = price;
	}



	public String getCourseNum() {
		return courseNum;
	}



	public void setCourseNum(String courseNum) {
		this.courseNum = courseNum;
	}



	public String getInfoDesc() {
		return infoDesc;
	}



	public void setInfoDesc(String infoDesc) {
		this.infoDesc = infoDesc;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	@Override
	public String toString() {
		return "greenteaInfo [courseNum=" + courseNum + ", infoDesc=" + infoDesc + ", price=" + price + "]";
	}
	
	
	
	
	

}
