package com.boseong.jsp.regional.model.vo;

public class RegionalProductShop {
	
	private int orderNo;
	private int productNo;
	private int productAmount;
	private int deliveryFee;
	private int prodPriceSum;
	private int paymentSum;
	private String memName;
	private String phone;
	private String receiverName;
	
	public RegionalProductShop() {
		super();
	}

	public RegionalProductShop(int orderNo, int productNo, int productAmount, int deliveryFee, int prodPriceSum,
			int paymentSum, String memName, String phone, String receiverName) {
		super();
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.productAmount = productAmount;
		this.deliveryFee = deliveryFee;
		this.prodPriceSum = prodPriceSum;
		this.paymentSum = paymentSum;
		this.memName = memName;
		this.phone = phone;
		this.receiverName = receiverName;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

	public int getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}

	public int getProdPriceSum() {
		return prodPriceSum;
	}

	public void setProdPriceSum(int prodPriceSum) {
		this.prodPriceSum = prodPriceSum;
	}

	public int getPaymentSum() {
		return paymentSum;
	}

	public void setPaymentSum(int paymentSum) {
		this.paymentSum = paymentSum;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	@Override
	public String toString() {
		return "RegionalProductShop [orderNo=" + orderNo + ", productNo=" + productNo + ", productAmount="
				+ productAmount + ", deliveryFee=" + deliveryFee + ", prodPriceSum=" + prodPriceSum + ", paymentSum="
				+ paymentSum + ", memName=" + memName + ", phone=" + phone + ", receiverName=" + receiverName + "]";
	}
	
	
	
	

}
