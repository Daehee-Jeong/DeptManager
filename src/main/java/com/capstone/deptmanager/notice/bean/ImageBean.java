package com.capstone.deptmanager.notice.bean;

import org.springframework.web.multipart.MultipartFile;

public class ImageBean {
	private String CKEditorFuncNum;
	private MultipartFile upload;
	private String newFileName;
	private String imageUrl;
	
	public ImageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ImageBean(String cKEditorFuncNum, MultipartFile upload, String newFileName, String imageUrl) {
		super();
		CKEditorFuncNum = cKEditorFuncNum;
		this.upload = upload;
		this.newFileName = newFileName;
		this.imageUrl = imageUrl;
	}
	public String getCKEditorFuncNum() {
		return CKEditorFuncNum;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setCKEditorFuncNum(String cKEditorFuncNum) {
		CKEditorFuncNum = cKEditorFuncNum;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	@Override
	public String toString() {
		return "ImageBean [CKEditorFuncNum=" + CKEditorFuncNum + ", upload=" + upload + ", newFileName=" + newFileName
				+ ", imageUrl=" + imageUrl + "]";
	}
	
	
	
}
