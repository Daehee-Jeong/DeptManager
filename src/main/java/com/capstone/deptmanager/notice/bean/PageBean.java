package com.capstone.deptmanager.notice.bean;

public class PageBean {

	int page;

	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PageBean(int page) {
		super();
		this.page = page;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "PageBean [page=" + page + "]";
	}
	
	
}
