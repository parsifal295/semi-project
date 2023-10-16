package com.boseong.jsp.notice.model.vo;

public class Notice {
  private int noticeNo;
  private int category;
  private String noticeTitle;
  private String noticeContent;
  private String createDate;
  private String modifyDate;
  private int count;
  private String status;

  public Notice() {}

  public Notice(
      int noticeNo,
      int category,
      String noticeTitle,
      String noticeContent,
      String createDate,
      String modifyDate,
      int count,
      String status) {
    this.noticeNo = noticeNo;
    this.category = category;
    this.noticeTitle = noticeTitle;
    this.noticeContent = noticeContent;
    this.createDate = createDate;
    this.modifyDate = modifyDate;
    this.count = count;
    this.status = status;
  }

  public int getNoticeNo() {
    return this.noticeNo;
  }

  public void setNoticeNo(int noticeNo) {
    this.noticeNo = noticeNo;
  }

  public int getCategory() {
    return this.category;
  }

  public void setCategory(int category) {
    this.category = category;
  }

  public String getNoticeTitle() {
    return this.noticeTitle;
  }

  public void setNoticeTitle(String noticeTitle) {
    this.noticeTitle = noticeTitle;
  }

  public String getNoticeContent() {
    return this.noticeContent;
  }

  public void setNoticeContent(String noticeContent) {
    this.noticeContent = noticeContent;
  }

  public String getCreateDate() {
    return this.createDate;
  }

  public void setCreateDate(String createDate) {
    this.createDate = createDate;
  }

  public String getModifyDate() {
    return this.modifyDate;
  }

  public void setModifyDate(String modifyDate) {
    this.modifyDate = modifyDate;
  }

  public int getCount() {
    return this.count;
  }

  public void setCount(int count) {
    this.count = count;
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
        + " noticeNo='"
        + getNoticeNo()
        + "'"
        + ", category='"
        + getCategory()
        + "'"
        + ", noticeTitle='"
        + getNoticeTitle()
        + "'"
        + ", noticeContent='"
        + getNoticeContent()
        + "'"
        + ", createDate='"
        + getCreateDate()
        + "'"
        + ", modifyDate='"
        + getModifyDate()
        + "'"
        + ", count='"
        + getCount()
        + "'"
        + ", status='"
        + getStatus()
        + "'"
        + "}";
  }
}
