package com.boseong.jsp.scrap.model.vo;

import java.sql.Date;

public class Scrap {
	
	private int scrapNo;
	private int memberNo;
	private int boardNo;
	private Date createDate;
	private String status;
	
	
	
	public Scrap() {
		super();
	}



	public Scrap(int scrapNo, int memberNo, int boardNo, Date createDate, String status) {
		super();
		this.scrapNo = scrapNo;
		this.memberNo = memberNo;
		this.boardNo = boardNo;
		this.createDate = createDate;
		this.status = status;
	}



	public int getScrapNo() {
		return scrapNo;
	}



	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
	}



	public int getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}



	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	@Override
	public String toString() {
		return "Scrap [scrapNo=" + scrapNo + ", memberNo=" + memberNo + ", boardNo=" + boardNo + ", createDate="
				+ createDate + ", status=" + status + "]";
	}

	
	
	
	
	
	
}
