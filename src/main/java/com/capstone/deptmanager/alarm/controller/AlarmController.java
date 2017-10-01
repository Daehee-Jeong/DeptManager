package com.capstone.deptmanager.alarm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.capstone.deptmanager.alarm.bean.AlarmBean;
import com.capstone.deptmanager.alarm.service.AlarmService;
import com.capstone.deptmanager.common.Constants;

/**
 * AlarmController
 * @author daehee
 *
 */

@Controller
public class AlarmController {
	
	// 서비스 선언
	@Autowired
	private AlarmService alarmService;
	
	// 푸시알림 기록 저장
	@RequestMapping("/alarm/insertAlarmProc")
	@ResponseBody
	public Map<String, Object> insertAlarmProc(AlarmBean bean){
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "푸시알림 기록 저장에 성공하였습니다.");
		
		try {
			int res = alarmService.insertAlarm(bean);
			System.out.println("res 값:" + res);
			if(res > 0){
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "푸시알림 기록 저장에 실패하였습니다.");
			}
		}catch (Exception e) {
			
		}
		return resMap;
	}
	
	// 회원정보 조회
	@RequestMapping("/alarm/selectAlarmProc")
	@ResponseBody
	public Map<String, Object> selectAlarm(AlarmBean alarmBean) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "푸시알림 기록 1건 조회에 실패하였습니다.");
		
		try {
			AlarmBean aBean = alarmService.selectAlarm(alarmBean);
			
			if(aBean != null) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "푸시알림 기록 1건 조회에 성공하였습니다.");
				resMap.put("aBean", aBean);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	} // end of selectAlarmProc
	
	// 회원정보 리스트 조회
	@RequestMapping("/alarm/selectAlarmListProc")
	@ResponseBody
	public Map<String, Object> selectAlarmList(AlarmBean alarmBean) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "푸시알림 기록 조회에 성공하였습니다.");
		
		try {
			List<AlarmBean> alarmList = alarmService.selectAlarmList(alarmBean);
			
			if(alarmList != null && alarmList.size() > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "푸시알림 기록 조회에 성공하였습니다.");
				resMap.put("aList", alarmList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	} // end of selectAlarmList
	
} // end of class
