package com.boseong.jsp.gallery.model.vo;

public class Gallery {

	
	private int galleryNo;        // GALLERY_NO
	private String status; // STATUS
	private int fileNo;    // FILE_NO
	private int refNo;     // REF_NO
	private String originName; //llORIGIN_NAME
	private String modifiedName; //MODIFIED_NAME
	private String savePath;   // SAVE_PATH
	private String link;
	
	public Gallery() {
		super();
	}


	public Gallery(int galleryNo, String status, int fileNo, int refNo, String originName, String modifiedName,
			String savePath,String link) {
		super();
		this.galleryNo = galleryNo;
		this.status = status;
		this.fileNo = fileNo;
		this.refNo = refNo;
		this.originName = originName;
		this.modifiedName = modifiedName;
		this.savePath = savePath;
		this.link = link;
	}


	public int getGalleryNo() {
		return galleryNo;
	}


	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
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
	
	public String getLink() {
		return link;
	}
	
	public void setLink(String link) {
		this.link = link;
	}


	@Override
	public String toString() {
		return "Gallery [galleryNo=" + galleryNo + ", status=" + status + ", fileNo=" + fileNo + ", refNo=" + refNo
				+ ", originName=" + originName + ", modifiedName=" + modifiedName + ", savePath=" + savePath + ", link=" + link + "]";
		
	}
	
	
	
	
	
}
