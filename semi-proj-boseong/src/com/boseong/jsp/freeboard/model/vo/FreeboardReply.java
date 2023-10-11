package com.boseong.jsp.freeboard.model.vo;

import java.sql.Date;

public class FreeboardReply {
  private int replyNo;
  private int refNo;
  private String writer;
  private String ipAddress;
  private String content;
  private Date createDate;
  private String status;
  private String password;

  public FreeboardReply() {}

  public FreeboardReply(
      int replyNo,
      int refNo,
      String writer,
      String ipAddress,
      String content,
      Date createDate,
      String status,
      String password) {
    this.replyNo = replyNo;
    this.refNo = refNo;
    this.writer = writer;
    this.ipAddress = ipAddress;
    this.content = content;
    this.createDate = createDate;
    this.status = status;
    this.password = password;
  }

  public int getReplyNo() {
    return this.replyNo;
  }

  public void setReplyNo(int replyNo) {
    this.replyNo = replyNo;
  }

  public int getRefNo() {
    return this.refNo;
  }

  public void setRefNo(int refNo) {
    this.refNo = refNo;
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

  public String getContent() {
    return this.content;
  }

  public void setContent(String content) {
    this.content = content;
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

  public String getPassword() {
    return this.password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  @Override
  public String toString() {
    return "{"
        + " replyNo='"
        + getReplyNo()
        + "'"
        + ", refNo='"
        + getRefNo()
        + "'"
        + ", writer='"
        + getWriter()
        + "'"
        + ", ipAddress='"
        + getIpAddress()
        + "'"
        + ", content='"
        + getContent()
        + "'"
        + ", createDate='"
        + getCreateDate()
        + "'"
        + ", status='"
        + getStatus()
        + "'"
        + ", password='"
        + getPassword()
        + "'"
        + "}";
  }
}
