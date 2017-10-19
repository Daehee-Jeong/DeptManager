package com.capstone.deptmanager.quest.controller;

import java.util.ArrayList;

/**
 * DeptManager QuestController
 * @author "dev.daehyoung"
 *
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.capstone.deptmanager.common.Constants;
import com.capstone.deptmanager.member.bean.MemberBean;
import com.capstone.deptmanager.quest.bean.QuestBean;
import com.capstone.deptmanager.quest.service.QuestService;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

@Controller
public class QuestController {

	// 파일 업로드 저장경로
	@Value("#{config['file.upload.path']}")
	private String FILE_UPLOAD_PATH;

	// 서비스 선언
	@Autowired
	private QuestService questService;
	
	// 설문지 등록 화면
	@RequestMapping("/quest/insertQuestForm")
	public String insertQuestForm() {
		return "/quest/insertQuest";
	} // end of insertMemberForm

	// 설문지 등록 처리
	@RequestMapping("/quest/insertQuestProc")
	@ResponseBody
	public Map<String, Object> insertQuestProc(@RequestParam(value="memberIds", required=true) String memberIds, QuestBean bean){

		Map<String, Object> resMap = new HashMap<String, Object>();

		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "설문지 등록에 실패 하였습니다.");

		try {
			int res = questService.insertQuest(bean);
			if(res > 0){
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "설문지 등록에 성공 하였습니다.");
			}
		}catch (Exception e) {

		}

		// 설문지 등록 완료 후 푸쉬 알림
		
		JsonParser parser = new JsonParser();
		JsonArray array = (JsonArray) parser.parse(memberIds);
		
		List<MemberBean> mBeanList = new ArrayList<>();
		for (int i = 0; i < array.size(); i++) {
			MemberBean mBean = new MemberBean();
			String id = array.get(i).getAsString();
			mBean.setMemberId(id);
			mBeanList.add(mBean);
			System.out.println("id : " + id);
		}
		
		return resMap;
	}

	// 설문지 재등록화면 (수정화면)
	@RequestMapping("/quest/updateQuestForm")
	public String updateQuestForm(){
		return "/quest/updateQuest";
	}

	// 설문지 재등록처리
	@RequestMapping("/quest/updateQuestProc")
	@ResponseBody
	public Map<String, Object> updateQuestProc(QuestBean questBean){

		Map<String, Object> resMap = new HashMap<String, Object>();

		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "설문지 재등록에 실패 하였습니다.");

		try {
			int res = questService.updateQuest(questBean);

			if(res > 0) {
				questBean = questService.selectQuest(questBean);

				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "설문지 재등록에 성공 하였습니다.");
			}
		} catch (Exception e) {

		}

		return resMap;
	}

	// 설문지 삭제화면
	@RequestMapping("/quest/deleteQuestForm")
	public String deleteQuestForm(){
		return "/quest/deleteQuest";
	}

	// 설문지 삭제처리
	@RequestMapping("/quest/deleteQuestProc")
	@ResponseBody
	public Map<String, Object> deleteQuestProc(QuestBean questBean){

		Map<String, Object> resMap = new HashMap<String, Object>();

		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "설문지 삭제에 실패 하였습니다.");

		try {
			int res = questService.deleteQuest(questBean);

			if(res > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "설문지 삭제에 성공 하였습니다.");
			}
		} catch (Exception e) {

		}

		return resMap;
	}

	// 설문지 조회
	@RequestMapping("/quest/selectQuestProc")
	@ResponseBody
	public Map<String, Object> selectQuest(QuestBean questBean) {

		Map<String, Object> resMap = new HashMap<String, Object>();

		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "설문 조회에 실패 하였습니다.");

		try {
			QuestBean qBean = questService.selectQuest(questBean);

			if(qBean != null) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "설문지 조회에 성공 하였습니다.");
				resMap.put("qBean", qBean);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		return resMap;
	}
	
	// 설문지 등록 화면
	@RequestMapping("/quest/selectQuestListForm")
	public String selectQuestForm() {
		return "/quest/selectQuestList";
	} // end of insertMemberForm

	// 설문지 리스트 최초 10건 조회
	@RequestMapping("/quest/selectQuestListProc")
	@ResponseBody
	public Map<String, Object> selectQuestList(QuestBean questBean) {

		Map<String, Object> resMap = new HashMap<String, Object>();

		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "설문지 리스트 조회에 실패 하였습니다.");

		try {
			List<QuestBean> questList = questService.selectQuestList();

			if(questList != null && questList.size() > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "설문 리스트 조회에 성공 하였습니다.");
				resMap.put("qList", questList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		return resMap;
	}
	
	// 설문지 리스트 조회 (무한 스크롤)
	@RequestMapping("/quest/selectQuestListScrollDownProc")
	@ResponseBody
	public Map<String, Object> selectQuestListScrollDown(QuestBean questBean) {

		Map<String, Object> resMap = new HashMap<String, Object>();

		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "설문지를 모두 조회 하였습니다.");

		try {
			List<QuestBean> questList = questService.selectQuestListScrollDown(questBean);

			if(questList != null && questList.size() > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "설문 리스트 조회에 성공 하였습니다.");
				resMap.put("qList", questList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		return resMap;
	}
	
	// 설문지 설정 화면 (excel명단 학번 추출)
	@RequestMapping("/quest/selectTargetForm")
	public String selectTargetForm(QuestBean questBean, Model model) {
		
		model.addAttribute("questBean", questBean);
		
		return "/quest/selectTarget";
	}
	
} // end of class
