package com.capstone.deptmanager.alarm.dao;

import java.util.List;

import com.capstone.deptmanager.alarm.bean.AlarmBean;

/**
 * AlarmDao
 * @author daehee
 *
 */

public interface AlarmDao {

	/** 푸시알림 기록을 삽입한다. **/
	public int insertAlarm(AlarmBean bean);
	
	/** 푸시알림 기록 1건을 조회해서 가져온다. **/
	public AlarmBean selectAlarm(AlarmBean bean);
	
	/** 푸시알림 기록 목록을 조회해서 가져온다. **/
	public List<AlarmBean> selectAlarmList(AlarmBean bean);
	
} // end of class
