package com.capstone.deptmanager.notice.bean;

/**
 * Notice Table의 Bean(Domain) 클래스
 * 
 * @author 이재현
 *
 */

public class NoticeBean {

	int noticeNo;
	String noticeTitle;
	String noticeContent;
	String noticeDate;
	String noticeTarget;
	String noticeType;
	
	public NoticeBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public NoticeBean(int noticeNo, String noticeTitle, String noticeContent, String noticeDate, String noticeTarget,
			String noticeType) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeTarget = noticeTarget;
		this.noticeType = noticeType;
	}
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public String getNoticeTarget() {
		return noticeTarget;
	}
	public String getNoticeType() {
		return noticeType;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	public void setNoticeTarget(String noticeTarget) {
		this.noticeTarget = noticeTarget;
	}
	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}
	
	@Override
	public String toString() {
		return "NoticeBean [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + ", noticeTarget=" + noticeTarget + ", noticeType=" + noticeType + "]";
	}	
}
