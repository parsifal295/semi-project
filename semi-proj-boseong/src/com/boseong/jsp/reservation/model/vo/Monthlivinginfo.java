package com.boseong.jsp.reservation.model.vo;

import java.util.ArrayList;

public class Monthlivinginfo {
	private int lodgeNo;
	private String lodgeName;
	private String lodgeLocation;
	private int price;
	private String lodgeInfo;
	
	
	public Monthlivinginfo(int lodgeNo, String lodgeName, int price) {
		super();
		this.lodgeNo = lodgeNo;
		this.lodgeName = lodgeName;
		this.price = price;
	}


	public Monthlivinginfo() {
		super();
	}


	public Monthlivinginfo(int lodgeNo, String lodgeName, String lodgeLocation, int price, String lodgeInfo) {
		super();
		this.lodgeNo = lodgeNo;
		this.lodgeName = lodgeName;
		this.lodgeLocation = lodgeLocation;
		this.price = price;
		this.lodgeInfo = lodgeInfo;
	}


	public int getLodgeNo() {
		return lodgeNo;
	}


	public void setLodgeNo(int lodgeNo) {
		this.lodgeNo = lodgeNo;
	}


	public String getLodgeName() {
		return lodgeName;
	}


	public void setLodgeName(String lodgeName) {
		this.lodgeName = lodgeName;
	}


	public String getLodgeLocation() {
		return lodgeLocation;
	}


	public void setLodgeLocation(String lodgeLocation) {
		this.lodgeLocation = lodgeLocation;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getLodgeInfo() {
		return lodgeInfo;
	}


	public void setLodgeInfo(String lodgeInfo) {
		this.lodgeInfo = lodgeInfo;
	}


	@Override
	public String toString() {
		return "Monthlivinginfo [lodgeNo=" + lodgeNo + ", lodgeName=" + lodgeName + ", lodgeLocation=" + lodgeLocation
				+ ", price=" + price + ", lodgeInfo=" + lodgeInfo + "]";
	}


	
	
	
	
	
}
