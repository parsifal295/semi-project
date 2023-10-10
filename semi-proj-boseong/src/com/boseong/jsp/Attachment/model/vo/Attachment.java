package com.boseong.jsp.Attachment.model.vo;

import java.sql.Date;

/*
 * Attachment Class
 * This class represents an single Attachment object that includes informations such as
 * original name and modified name according to the predefined naming convention,
 * saved path .. etc..
 *
 * @author : @ozoizme
 */
public class Attachment {

  private int fileNo; // FILE_NO
  private int categoryNo; // CATEGORY_NO
  private int refNo; // REF_NO
  private String originName; // ORIGIN_NAME
  private String modifiedName; // MODIFIED_NAME
  private String savePath; // SAVE_PATH
  private Date uploadDate; // UPLOAD_DATE
  private String status; // STATUS

  public Attachment() {
    super();
  }

  public Attachment(
      int fileNo,
      int categoryNo,
      int refNo,
      String originName,
      String modifiedName,
      String savePath,
      Date uploadDate,
      String status) {
    super();
    this.fileNo = fileNo;
    this.categoryNo = categoryNo;
    this.refNo = refNo;
    this.originName = originName;
    this.modifiedName = modifiedName;
    this.savePath = savePath;
    this.uploadDate = uploadDate;
    this.status = status;
  }

  public int getFileNo() {
    return fileNo;
  }

  public void setFileNo(int fileNo) {
    this.fileNo = fileNo;
  }

  public int getCategoryNo() {
    return categoryNo;
  }

  public void setCategoryNo(int categoryNo) {
    this.categoryNo = categoryNo;
  }

  public int getRefNo() {
    return refNo;
  }

  public void setRefNo(int refNo) {
    this.refNo = refNo;
  }

  public String getOriginName() {
    return originName;
  }

  public void setOriginName(String originName) {
    this.originName = originName;
  }

  public String getModifiedName() {
    return modifiedName;
  }

  public void setModifiedName(String modifiedName) {
    this.modifiedName = modifiedName;
  }

  public String getSavePath() {
    return savePath;
  }

  public void setSavePath(String savePath) {
    this.savePath = savePath;
  }

  public Date getUploadDate() {
    return uploadDate;
  }

  public void setUploadDate(Date uploadDate) {
    this.uploadDate = uploadDate;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  @Override
  public String toString() {
    return "Attachment [fileNo="
        + fileNo
        + ", categoryNo="
        + categoryNo
        + ", refNo="
        + refNo
        + ", originName="
        + originName
        + ", modifiedName="
        + modifiedName
        + ", savePath="
        + savePath
        + ", uploadDate="
        + uploadDate
        + ", status="
        + status
        + "]";
  }
}
