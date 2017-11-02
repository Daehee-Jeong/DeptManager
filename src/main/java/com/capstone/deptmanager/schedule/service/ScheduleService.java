package com.capstone.deptmanager.schedule.service;

import java.util.List;

import com.capstone.deptmanager.schedule.bean.ScheduleBean;

public interface ScheduleService {

public int insertSchedule(ScheduleBean bean);
	
	public int updateSchedule(ScheduleBean bean);
	
	public ScheduleBean selectSchedule(ScheduleBean bean);
	
	public List<ScheduleBean> selectScheduleList(ScheduleBean bean);
	
	public int deleteSchedule(ScheduleBean bean);
}
