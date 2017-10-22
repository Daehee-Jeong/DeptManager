package com.capstone.deptmanager.notice.bean;

import org.springframework.web.multipart.MultipartFile;

public class ImageBean {
	private String CKEditorFuncNum;
	private MultipartFile upload;
	private String fileName;
	private String attach_path;
	
	
	
	
	public ImageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ImageBean(String cKEditorFuncNum, MultipartFile upload, String fileName, String attach_path) {
		super();
		CKEditorFuncNum = cKEditorFuncNum;
		this.upload = upload;
		this.fileName = fileName;
		this.attach_path = attach_path;
	}
	public String getCKEditorFuncNum() {
		return CKEditorFuncNum;
	}
	public void setCKEditorFuncNum(String cKEditorFuncNum) {
		CKEditorFuncNum = cKEditorFuncNum;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getAttach_path() {
		return attach_path;
	}
	public void setAttach_path(String attach_path) {
		this.attach_path = attach_path;
	}
	
	@Override
	public String toString() {
		return "ImageBean [CKEditorFuncNum=" + CKEditorFuncNum + ", upload=" + upload + ", fileName=" + fileName
				+ ", attach_path=" + attach_path + "]";
	}
	
	
}
