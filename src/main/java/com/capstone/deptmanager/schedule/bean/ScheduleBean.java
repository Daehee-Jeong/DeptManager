package com.capstone.deptmanager.schedule.bean;

public class ScheduleBean {
	
	int scheduleNo;
	int scheduleNotice;
	int scheduleAllday;
	String scheduleTitle;
	String scheduleStart;
	String scheduleEnd;
	String scheduleType;
	String scheduleTarget;
	String scheduleDesc;
	
	
	
	public ScheduleBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ScheduleBean(int scheduleNo, int scheduleNotice, int scheduleAllday, String scheduleTitle,
			String scheduleStart, String scheduleEnd, String scheduleType, String scheduleTarget, String scheduleDesc) {
		super();
		this.scheduleNo = scheduleNo;
		this.scheduleNotice = scheduleNotice;
		this.scheduleAllday = scheduleAllday;
		this.scheduleTitle = scheduleTitle;
		this.scheduleStart = scheduleStart;
		this.scheduleEnd = scheduleEnd;
		this.scheduleType = scheduleType;
		this.scheduleTarget = scheduleTarget;
		this.scheduleDesc = scheduleDesc;
	}
	public int getScheduleNo() {
		return scheduleNo;
	}
	public int getScheduleNotice() {
		return scheduleNotice;
	}
	public int getScheduleAllday() {
		return scheduleAllday;
	}
	public String getScheduleTitle() {
		return scheduleTitle;
	}
	public String getScheduleStart() {
		return scheduleStart;
	}
	public String getScheduleEnd() {
		return scheduleEnd;
	}
	public String getScheduleType() {
		return scheduleType;
	}
	public String getScheduleTarget() {
		return scheduleTarget;
	}
	public String getScheduleDesc() {
		return scheduleDesc;
	}
	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public void setScheduleNotice(int scheduleNotice) {
		this.scheduleNotice = scheduleNotice;
	}
	public void setScheduleAllday(int scheduleAllday) {
		this.scheduleAllday = scheduleAllday;
	}
	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}
	public void setScheduleStart(String scheduleStart) {
		this.scheduleStart = scheduleStart;
	}
	public void setScheduleEnd(String scheduleEnd) {
		this.scheduleEnd = scheduleEnd;
	}
	public void setScheduleType(String scheduleType) {
		this.scheduleType = scheduleType;
	}
	public void setScheduleTarget(String scheduleTarget) {
		this.scheduleTarget = scheduleTarget;
	}
	public void setScheduleDesc(String scheduleDesc) {
		this.scheduleDesc = scheduleDesc;
	}
	@Override
	public String toString() {
		return "ScheduleBean [scheduleNo=" + scheduleNo + ", scheduleNotice=" + scheduleNotice + ", scheduleAllday="
				+ scheduleAllday + ", scheduleTitle=" + scheduleTitle + ", scheduleStart=" + scheduleStart
				+ ", scheduleEnd=" + scheduleEnd + ", scheduleType=" + scheduleType + ", scheduleTarget="
				+ scheduleTarget + ", scheduleDesc=" + scheduleDesc + "]";
	}
	
	
	
}
