package com.capstone.deptmanager.schedule.dao;

import java.util.List;

import com.capstone.deptmanager.schedule.bean.ScheduleBean;

public interface ScheduleDao {

	public int insertSchedule(ScheduleBean bean);
	
	public int updateSchedule(ScheduleBean bean);
	
	public ScheduleBean selectSchedule(ScheduleBean bean);
	
	public List<ScheduleBean> selectScheduleList();
	
	public int deleteScheduleProc(ScheduleBean bean);
}
