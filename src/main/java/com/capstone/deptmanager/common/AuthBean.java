package com.capstone.deptmanager.common;

public class AuthBean {

	private String name = "";
	private String memberNo = "";
	private String email = "";
	private String mobilePhoneNo = "";
	private String deptName = "";
	private String state = "";
	private String addr = "";
	
	// 빈 생성자
	public AuthBean() {}

	public AuthBean(String name, String memberNo, String email, String mobilePhoneNo, String deptName, String state,
			String addr) {
		super();
		this.name = name;
		this.memberNo = memberNo;
		this.email = email;
		this.mobilePhoneNo = mobilePhoneNo;
		this.deptName = deptName;
		this.state = state;
		this.addr = addr;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
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
