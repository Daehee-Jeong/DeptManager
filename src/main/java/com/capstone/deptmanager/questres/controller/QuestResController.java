package com.capstone.deptmanager.questres.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.capstone.deptmanager.common.Constants;
import com.capstone.deptmanager.quest.bean.QuestBean;
import com.capstone.deptmanager.questres.bean.QuestResBean;
import com.capstone.deptmanager.questres.service.QuestResService;

/**
 * QuestResController
 * @author daehee
 *
 */

@Controller
public class QuestResController {
	
	@Autowired
	private QuestResService questResService;
	
	@RequestMapping("/questres/insertQuestResForm")
	public String insertQuestResForm(Model model, QuestBean qBean) {
		model.addAttribute("qBean", qBean);
		return "/questres/insertQuestRes";
	} // end of insertQuestResForm
	
	@RequestMapping("/questres/insertQuestResProc")
	@ResponseBody
	public Map<String, Object> insertQuestResProc(QuestResBean qBean){
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "설문제출에 실패하였습니다.");
		
		try{
			int res = questResService.insertQuestRes(qBean);
			if( res > 0 ) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "설문제출에 성공하였습니다.");
			}
		}catch (Exception e) {
			
		}
		return resMap;
	} // end of insertQuestResProc
	
	@RequestMapping("/questres/selectQuestResProc")
	@ResponseBody
	public Map<String, Object> selectQuestResProc(QuestResBean qBean){
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "설문목록 조회에 실패하였습니다.");
		
		try{
			QuestResBean questResBean = questResService.selectQuestRes(qBean);
			if( questResBean != null) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "설문목록 조회에 성공하였습니다.");
				resMap.put("questResBean", questResBean);
			}
		}catch (Exception e) {
			
		}
		return resMap;
	} // end of selectQuestResListProc
	
	@RequestMapping("/questres/selectQuestResListProc")
	@ResponseBody
	public Map<String, Object> selectQuestResListProc(QuestResBean qBean){
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "설문 응답목록 조회에 실패하였습니다.");
		
		try{
			List<QuestResBean> questResBeanList = questResService.selectQuestResList(qBean);
			if( questResBeanList != null && questResBeanList.size() > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "설문 응답목록 조회에 성공하였습니다.");
				resMap.put("questResBeanList", questResBeanList);
			}
		}catch (Exception e) {
			
		}
		return resMap;
	} // end of selectQuestResListProc
	
} // end of class
