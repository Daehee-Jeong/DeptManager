package com.capstone.deptmanager.alarm.bean;

/**
 * 푸시 알림 기록 객체
 * @author daehee
 *
 */
public class AlarmBean {
	
	private String alarmNo;
	private String alarmTo;
	private String alarmTitle;
	private String alarmMsg;
	private String alarm_date;
	private String alarm_check;
	
	public AlarmBean(String alarmNo, String alarmTo, String alarmTitle, String alarmMsg, String alarm_date,
			String alarm_check) {
		super();
		this.alarmNo = alarmNo;
		this.alarmTo = alarmTo;
		this.alarmTitle = alarmTitle;
		this.alarmMsg = alarmMsg;
		this.alarm_date = alarm_date;
		this.alarm_check = alarm_check;
	}

	public AlarmBean() {}

	public String getAlarmNo() {
		return alarmNo;
	}

	public void setAlarmNo(String alarmNo) {
		this.alarmNo = alarmNo;
	}

	public String getAlarmTo() {
		return alarmTo;
	}

	public void setAlarmTo(String alarmTo) {
		this.alarmTo = alarmTo;
	}

	public String getAlarmTitle() {
		return alarmTitle;
	}

	public void setAlarmTitle(String alarmTitle) {
		this.alarmTitle = alarmTitle;
	}

	public String getAlarmMsg() {
		return alarmMsg;
	}

	public void setAlarmMsg(String alarmMsg) {
		this.alarmMsg = alarmMsg;
	}

	public String getAlarm_date() {
		return alarm_date;
	}

	public void setAlarm_date(String alarm_date) {
		this.alarm_date = alarm_date;
	}

	public String getAlarm_check() {
		return alarm_check;
	}

	public void setAlarm_check(String alarm_check) {
		this.alarm_check = alarm_check;
	}
	
} // end of class
