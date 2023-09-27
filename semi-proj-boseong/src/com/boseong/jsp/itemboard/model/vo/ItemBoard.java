package com.boseong.jsp.itemboard.model.vo;

import java.sql.Date;

public class ItemBoard {

	private int boardNo;       // BOARD_NO
	private int memberNo;      // MEM_NO
	private String title;      // IBOARD_TITLE
	private String content;    // IBOARD_CONTENT
	private Date postDate;     // IBOARD_POST_DATE
	private Date modifyDate;   // IBOARD_MODIFY_DATE
	private int count;         // COUNT
	private String status;     // STATUS
	
	
	
	
	public ItemBoard() {
		super();
	}

	
	

	public ItemBoard(int boardNo, int memberNo, String title, String content, Date postDate, Date modifyDate, int count,
			String status) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.title = title;
		this.content = content;
		this.postDate = postDate;
		this.modifyDate = modifyDate;
		this.count = count;
		this.status = status;
	}

	
	

	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getPostDate() {
		return postDate;
	}


	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}

	
	

	@Override
	public String toString() {
		return "ItemBoard [boardNo=" + boardNo + ", memberNo=" + memberNo + ", title=" + title + ", content=" + content
				+ ", postDate=" + postDate + ", modifyDate=" + modifyDate + ", count=" + count + ", status=" + status
				+ "]";
	}
	
	
	
	
	
	
	
}
