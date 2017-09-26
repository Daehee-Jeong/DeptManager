package com.capstone.deptmanager.common;

public class AuthBean {

	private String name = "";
	private String memberNo = "";
	private String email = "";
	private String mobilePhoneNo = "";
	private String deptName = "";
	
	// 빈 생성자
	public AuthBean() {}

	public AuthBean(String name, String memberNo, String email, String mobilePhoneNo, String deptName) {
		super();
		this.name = name;
		this.memberNo = memberNo;
		this.email = email;
		this.mobilePhoneNo = mobilePhoneNo;
		this.deptName = deptName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobilePhoneNo() {
		return mobilePhoneNo;
	}

	public void setMobilePhoneNo(String mobilePhoneNo) {
		this.mobilePhoneNo = mobilePhoneNo;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
} // end of class
