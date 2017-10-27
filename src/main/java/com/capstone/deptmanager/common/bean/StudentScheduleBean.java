package com.capstone.deptmanager.common.bean;

/**
 * DeptManager StudentScheduleBean
 * @author "dev.daehyoung"
 *
 */

// DTO
public class StudentScheduleBean {
	
	private String sNo;
	private String sDate;
	private String sContent;
	
	public String getsNo() {
		return sNo;
	}
	public void setsNo(String sNo) {
		this.sNo = sNo;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String getsContent() {
		return sContent;
	}
	public void setsContent(String sContent) {
		this.sContent = sContent;
	}
	
} // end of class
