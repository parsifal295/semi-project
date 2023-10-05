package com.boseong.jsp.reservation.model.vo;

public class Room {
	private int roomNo;
	private String roomType;
	private int baseNum;
	private int maxNum;
	private int price;
	private int extraPrice;
	private String size;
	private String amenity;
	private String roomIntro;
	private String roomDetail;
	
	public Room() {
		super();
	}
	public Room(int roomNo, String roomType, int baseNum, int maxNum, int price, int extraPrice, String size, String amenity,
			String roomIntro, String roomDetail) {
		super();
		this.roomNo = roomNo;
		this.roomType = roomType;
		this.baseNum = baseNum;
		this.maxNum = maxNum;
		this.price = price;
		this.extraPrice = extraPrice;
		this.size = size;
		this.amenity = amenity;
		this.roomIntro = roomIntro;
		this.roomDetail = roomDetail;
	}
	public Room(int roomNo, String roomType, int baseNum, int maxNum, int price, int extraPrice) {
		super();
		this.roomNo = roomNo;
		this.roomType = roomType;
		this.baseNum = baseNum;
		this.maxNum = maxNum;
		this.price = price;
		this.extraPrice = extraPrice;
	}

	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", roomType=" + roomType + ", baseNum=" + baseNum + ", maxNum=" + maxNum
				+ ", price=" + price + ", extraPrice=" + extraPrice + ", size=" + size + ", amenity=" + amenity
				+ ", roomIntro=" + roomIntro + ", roomDetail=" + roomDetail + "]";
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getBaseNum() {
		return baseNum;
	}
	public void setBaseNum(int baseNum) {
		this.baseNum = baseNum;
	}
	public int getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getExtraPrice() {
		return extraPrice;
	}
	public void setExtraPrice(int extraPrice) {
		this.extraPrice = extraPrice;
	}
	public String getAmenity() {
		return amenity;
	}
	public void setAmenity(String amenity) {
		this.amenity = amenity;
	}
	public String getRoomIntro() {
		return roomIntro;
	}
	public void setRoomIntro(String roomIntro) {
		this.roomIntro = roomIntro;
	}
	public String getRoomDetail() {
		return roomDetail;
	}
	public void setRoomDetail(String roomDetail) {
		this.roomDetail = roomDetail;
	}
	
	

}
