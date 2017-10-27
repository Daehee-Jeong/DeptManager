package com.capstone.deptmanager.notice.bean;

public class PageBean {

	int page;
	String type;
	String target;
	
	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PageBean(int page, String type, String target) {
		super();
		this.page = page;
		this.type = type;
		this.target = target;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	@Override
	public String toString() {
		return "PageBean [page=" + page + ", type=" + type + ", target=" + target + "]";
	}

	
}
