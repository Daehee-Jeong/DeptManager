package com.capstone.deptmanager.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.deptmanager.schedule.bean.ScheduleBean;
import com.capstone.deptmanager.schedule.dao.ScheduleDao;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao scheduleDao;
	
	@Override
	public int insertSchedule(ScheduleBean bean) {
		// TODO Auto-generated method stub
		return scheduleDao.insertSchedule(bean);
	}

	@Override
	public int updateSchedule(ScheduleBean bean) {
		// TODO Auto-generated method stub
		return scheduleDao.updateSchedule(bean);
	}

	@Override
	public ScheduleBean selectSchedule(ScheduleBean bean) {
		// TODO Auto-generated method stub
		return scheduleDao.selectSchedule(bean);
	}

	@Override
	public List<ScheduleBean> selectScheduleList(ScheduleBean bean) {
		// TODO Auto-generated method stub
		return scheduleDao.selectScheduleList(bean);
	}

	@Override
	public int deleteSchedule(ScheduleBean bean) {
		// TODO Auto-generated method stub
		return scheduleDao.deleteSchedule(bean);
	}

}
