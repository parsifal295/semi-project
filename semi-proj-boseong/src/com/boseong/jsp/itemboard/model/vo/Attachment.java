package com.boseong.jsp.itemboard.model.vo;

import java.sql.Date;

public class Attachment {
	
	private int fileNo;               // FILE_NO
	private int categoryNo;           // CATEGORY_NO
	private int refNo;                // REF_NO
	private String originName;        // ORIGIN_NAME
	private String modifiedName;      // MODIFIED_NAME
	private String savePath;          // SAVE_PATH
	private Date uploadDate;          // UPLOAD_DATE
	private String status;            // STATUS
	
	
	public Attachment() {
		super();
	}


	public Attachment(int fileNo, int categoryNo, int refNo, String originName, String modifiedName, String savePath,
			Date uploadDate, String status) {
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
	public int getCategoryNo() {
		return categoryNo;
	}
	public int getRefNo() {
		return refNo;
	}
	public String getOriginName() {
		return originName;
	}
	public String getModifiedName() {
		return modifiedName;
	}
	public String getSavePath() {
		return savePath;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public String getStatus() {
		return status;
	}


	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", categoryNo=" + categoryNo + ", refNo=" + refNo + ", originName="
				+ originName + ", modifiedName=" + modifiedName + ", savePath=" + savePath + ", uploadDate="
				+ uploadDate + ", status=" + status + "]";
	}
	
	
	
	
	
	
	

}
