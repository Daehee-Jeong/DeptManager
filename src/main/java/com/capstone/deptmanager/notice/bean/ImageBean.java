package com.capstone.deptmanager.notice.bean;

import org.springframework.web.multipart.MultipartFile;

public class ImageBean {
	private String CKEditorFuncNum;
	private MultipartFile upload;
	private String fileName;
	private String attachPath;
	
	public ImageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ImageBean(String cKEditorFuncNum, MultipartFile upload, String fileName, String attachPath) {
		super();
		CKEditorFuncNum = cKEditorFuncNum;
		this.upload = upload;
		this.fileName = fileName;
		this.attachPath = attachPath;
	}
	public String getCKEditorFuncNum() {
		return CKEditorFuncNum;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public String getFileName() {
		return fileName;
	}
	public String getAttachPath() {
		return attachPath;
	}
	public void setCKEditorFuncNum(String cKEditorFuncNum) {
		CKEditorFuncNum = cKEditorFuncNum;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setAttachPath(String attachPath) {
		this.attachPath = attachPath;
	}
	@Override
	public String toString() {
		return "ImageBean [CKEditorFuncNum=" + CKEditorFuncNum + ", upload=" + upload + ", fileName=" + fileName
				+ ", attachPath=" + attachPath + "]";
	}
	
	
	
}
