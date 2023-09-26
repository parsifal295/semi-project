package com.boseong.jsp.freeboard.model.vo;

import java.sql.Date;

public class Freeboard {
  private int boardNo;
  private int categoryNo;
  private String writer;
  private String ipAddress;
  private String title;
  private String content;
  private String password;
  private int count;
  private Date createDate;
  private String status;

  public Freeboard() {}

  public Freeboard(
      int boardNo,
      int categoryNo,
      String writer,
      String ipAddress,
      String title,
      String content,
      String password,
      int count,
      Date createDate,
      String status) {
    this.boardNo = boardNo;
    this.categoryNo = categoryNo;
    this.writer = writer;
    this.ipAddress = ipAddress;
    this.title = title;
    this.content = content;
    this.password = password;
    this.count = count;
    this.createDate = createDate;
    this.status = status;
  }

  public int getBoardNo() {
    return this.boardNo;
  }

  public void setBoardNo(int boardNo) {
    this.boardNo = boardNo;
  }

  public int getCategoryNo() {
    return this.categoryNo;
  }

  public void setCategoryNo(int categoryNo) {
    this.categoryNo = categoryNo;
  }

  public String getWriter() {
    return this.writer;
  }

  public void setWriter(String writer) {
    this.writer = writer;
  }

  public String getIpAddress() {
    return this.ipAddress;
  }

  public void setIpAddress(String ipAddress) {
    this.ipAddress = ipAddress;
  }

  public String getTitle() {
    return this.title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return this.content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getPassword() {
    return this.password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public int getCount() {
    return this.count;
  }

  public void setCount(int count) {
    this.count = count;
  }

  public Date getCreateDate() {
    return this.createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }

  public String getStatus() {
    return this.status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  @Override
  public String toString() {
    return "{"
        + " boardNo='"
        + getBoardNo()
        + "'"
        + ", categoryNo='"
        + getCategoryNo()
        + "'"
        + ", writer='"
        + getWriter()
        + "'"
        + ", ipAddress='"
        + getIpAddress()
        + "'"
        + ", title='"
        + getTitle()
        + "'"
        + ", content='"
        + getContent()
        + "'"
        + ", password='"
        + getPassword()
        + "'"
        + ", count='"
        + getCount()
        + "'"
        + ", createDate='"
        + getCreateDate()
        + "'"
        + ", status='"
        + getStatus()
        + "'"
        + "}";
  }
}
