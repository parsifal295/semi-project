package com.boseong.jsp.reservation.model.vo;

public class HorseProgram {
	private int horseProNo;
	private String horseProName;
	private String description;
	private int price;
	public HorseProgram() {
		super();
	}
	public HorseProgram(int horseProNo, String horseProName, String description, int price) {
		super();
		this.horseProNo = horseProNo;
		this.horseProName = horseProName;
		this.description = description;
		this.price = price;
	}
	public int getHorseProNo() {
		return horseProNo;
	}
	public void setHorseProNo(int horseProNo) {
		this.horseProNo = horseProNo;
	}
	public String getHorseProName() {
		return horseProName;
	}
	public void setHorseProName(String horseProName) {
		this.horseProName = horseProName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "HorseProgram [horseProNo=" + horseProNo + ", horseProName=" + horseProName + ", description="
				+ description + ", price=" + price + "]";
	}
	
	
}
