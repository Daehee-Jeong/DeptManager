package com.capstone.deptmanager.alarm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.deptmanager.alarm.bean.AlarmBean;
import com.capstone.deptmanager.alarm.dao.AlarmDao;
import com.capstone.deptmanager.member.bean.MemberBean;
import com.capstone.deptmanager.member.dao.MemberDao;

/**
 * AlarmServiceImpl
 * @author daehee
 *
 */

@Service
public class AlarmServiceImpl implements AlarmService{

	@Autowired AlarmDao alarmDao;
	
	@Override
	public int insertAlarm(AlarmBean bean) {
		return alarmDao.insertAlarm(bean);
	}

	@Override
	public AlarmBean selectAlarm(AlarmBean bean) {
		return alarmDao.selectAlarm(bean);
	}

	@Override
	public List<AlarmBean> selectAlarmList(AlarmBean bean) {
		return alarmDao.selectAlarmList(bean);
	}
	
} // end of class
