package com.capstone.deptmanager.schedule.service;

import java.util.List;

import com.capstone.deptmanager.schedule.bean.ScheduleBean;

public interface ScheduleService {

public int insertScheduleProc(ScheduleBean bean);
	
	public int updateSchedule(ScheduleBean bean);
	
	public ScheduleBean selectScheduleProc(ScheduleBean bean);
	
	public List<ScheduleBean> selectScheduleListProc();
	
	public int deleteScheduleProc(ScheduleBean bean);
}
