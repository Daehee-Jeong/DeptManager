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
import com.capstone.deptmanager.questres.bean.QuestResBean;
import com.capstone.deptmanager.questres.service.QuestResService;
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
	@Autowired
	private QuestResService questResService;
	
	// 설문지 등록 화면
	@RequestMapping("/quest/insertQuestForm")
	public String insertQuestForm() {
		return "/quest/insertQuest";
	} // end of insertQuestForm

	// 설문지 등록 처리
	@RequestMapping("/quest/insertQuestProc")
	@ResponseBody
	public Map<String, Object> insertQuestProc(@RequestParam(value="memberIds", required=true) String memberIds, QuestBean bean){

		Map<String, Object> resMap = new HashMap<String, Object>();

		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "설문지 등록에 실패 하였습니다.");

		JsonParser parser = new JsonParser();
		JsonArray array = (JsonArray) parser.parse(memberIds);
		
		try {
			
			bean.setQuestTo(array.toString());
			
			int res = questService.insertQuest(bean);
			if(res > 0){
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "설문지 등록에 성공 하였습니다.");
			}
		}catch (Exception e) {

		}
		
		// TODO : 설문지 등록 완료 후 푸쉬 알림
		
		System.out.println("JsonArray ToString : " + array.toString());
		
		List<MemberBean> mBeanList = new ArrayList<>();
		for (int i = 0; i < array.size(); i++) {
			MemberBean mBean = new MemberBean();
			String id = array.get(i).getAsString();
			mBean.setMemberId(id);
			mBeanList.add(mBean);
			System.out.println("id : " + id);
		}
		
		return resMap;
	} // end of insertQuestProc

	// 설문지 재등록화면 (수정화면)
	@RequestMapping("/quest/updateQuestForm")
	public String updateQuestForm(){
		return "/quest/updateQuest";
	} // end of updateQuestForm

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
	} // end of updateQuestProc

	// 설문지 삭제화면
	@RequestMapping("/quest/deleteQuestForm")
	public String deleteQuestForm(){
		return "/quest/deleteQuest";
	} // end of deleteQuestForm

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
	} // end of deleteQuestProc

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
	
	// 설문지 결과 조회 화면
	@RequestMapping("/quest/selectQuestResultForm")
	public String selectQuestResultForm() {
		return "/quest/selectQuestResult";
	}
	
	// 설문지 결과 조회 기능
	@RequestMapping("/quest/selectQuestResultProc")
	@ResponseBody
	public Map<String, Object> selectQuestResultProc(QuestBean questBean) {

		Map<String, Object> resMap = new HashMap<String, Object>();

		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "설문 조회에 실패 하였습니다.");

		try {
			QuestBean qBean = questService.selectQuest(questBean);

			if(qBean != null) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "설문지 조회에 성공 하였습니다. 응답목록 조회에 실패하였습니다.");
				
				QuestResBean qrBean = new QuestResBean();
				qrBean.setQuestResQuest(questBean.getQuestNo());
				List<QuestResBean> resList = questResService.selectQuestResListFromQuestNo(qrBean);
				
				if (resList != null && resList.size() > 0) {
					resMap.put(Constants.RESULT_MSG, "설문지 조회에 성공 하였습니다. 응답목록 조회에 성공하였습니다.");
					resMap.put("resList", resList);
				}
				
				resMap.put("qBean", qBean);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		return resMap;
	}
	
	// [관리자] 설문지 목록 화면
	@RequestMapping("/quest/selectQuestListForm")
	public String selectQuestListForm() {
		return "/quest/selectQuestList";
	} // end of selectQuestListForm
	
	// [관리자] 설문지 리스트 최초 10건 조회
	@RequestMapping("/quest/selectQuestListProc")
	@ResponseBody
	public Map<String, Object> selectQuestListProc(QuestBean questBean) {

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
	} // end of selectQuestListProc
	
	// [관리자] 설문지 리스트 조회 (무한 스크롤)
	@RequestMapping("/quest/selectQuestListScrollDownProc")
	@ResponseBody
	public Map<String, Object> selectQuestListScrollDownProc(QuestBean questBean) {

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
	} // end of selectQuestListScrollDownProc
	
	// [학생] 설문지 목록 화면
	@RequestMapping("/quest/selectQuestListStudentForm")
	public String selectQuestListStudentForm() {
		return "/quest/selectQuestListStudent";
	} // end of selectQuestListStudentForm

	// [학생] 설문지 리스트 최초 10건 조회
	@RequestMapping("/quest/selectQuestListStudentProc")
	@ResponseBody
	public Map<String, Object> selectQuestListStudentProc(QuestBean questBean) {

		Map<String, Object> resMap = new HashMap<String, Object>();

		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "설문지 리스트 조회에 실패 하였습니다.");

		try {
			List<QuestBean> questList = questService.selectQuestListStudent(questBean);

			if(questList != null && questList.size() > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "설문 리스트 조회에 성공 하였습니다.");
				resMap.put("qList", questList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		return resMap;
	} // end of selectQuestListStudentProc
	
	// [학생] 설문지 리스트 조회 (무한 스크롤)
	@RequestMapping("/quest/selectQuestListStudentScrollDownProc")
	@ResponseBody
	public Map<String, Object> selectQuestListStudentScrollDownProc(QuestBean questBean) {

		Map<String, Object> resMap = new HashMap<String, Object>();
 
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "설문지를 모두 조회 하였습니다.");

		try {
			List<QuestBean> questList = questService.selectQuestListStudentScrollDown(questBean);

			if(questList != null && questList.size() > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "설문 리스트 조회에 성공 하였습니다.");
				resMap.put("qList", questList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		return resMap;
	} // end of selectQuestListStudentScrollDownProc
	
	//[학생] 응답여부 판별
	@RequestMapping("/quest/isResponseProc")
	@ResponseBody
	public Map<String, Object> isResponseProc(QuestBean questBean) {

		Map<String, Object> resMap = new HashMap<String, Object>();
 
		boolean isResponse = false;
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "응답자 판별 조회에 실패 하였습니다.");

		QuestResBean qrBean = new QuestResBean();
		qrBean.setQuestResQuest(questBean.getQuestNo());
		
		
		try {
			List<QuestResBean> questResList = questResService.selectQuestResListFromQuestNo(qrBean);
			
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
			resMap.put(Constants.RESULT_MSG, "응답자 판별 조회에 성공 하였습니다.");
			
			for (int i = 0; i < questResList.size(); i++) {
				String id = questResList.get(i).getQuestResMember();
				if(questBean.getQuestTo().equals(id)) {
					isResponse = true;
				}
			}
			
			if(isResponse) {
				resMap.put("isResponse", true);
			} else {
				resMap.put("isResponse", false);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		return resMap;
	} // end of isResponseProc
	
	
	// 설문지 설정 화면 (excel명단 학번 추출)
	@RequestMapping("/quest/selectTargetForm")
	public String selectTargetForm(QuestBean questBean, Model model) {
		model.addAttribute("questBean", questBean);
		return "/quest/selectTarget";
	} // end of selectTargetForm
	
	// 미응답자 재송신 화면
	@RequestMapping("/quest/nonResponseForm")
	public String nonResponseForm(QuestBean questBean, Model model) {
		
		model.addAttribute("questBean", questBean);
		
		return "/quest/nonResponse";
	}
	
	// 미응답자 재송신 처리
	@RequestMapping("/quest/nonResponseProc")
	@ResponseBody
	public Map<String, Object> nonResponseProc(QuestBean questBean) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "미응답자 푸쉬알림을 실패하였습니다.");
		
		QuestResBean qrBean = new QuestResBean();
		qrBean.setQuestResQuest(questBean.getQuestNo());
		
		try {
			// 설문지 푸쉬요청 전체 학생학번 추출
			QuestBean qBean = questService.selectQuest(questBean);
			String jsonObjStr = qBean.getQuestTo();
			
			JsonParser parser = new JsonParser();
			JsonArray array = (JsonArray) parser.parse(jsonObjStr);
			
			List<String> entireList = new ArrayList<>();
			for (int i = 0; i < array.size(); i++) {
				String id = array.get(i).getAsString();
				entireList.add(id);
			}
			
			// 설문지 응답한 학생학번 추출 / 설문지 전체학생 - 응답학생 = 미응답 학생
			List<QuestResBean> questResList = questResService.selectQuestResListFromQuestNo(qrBean);
			
			for (int i = 0; i < questResList.size(); i++) {
				String subtractId = questResList.get(i).getQuestResMember();
				entireList.remove(subtractId);
			}
			
			// MemberBean List 생성
			List<MemberBean> mBeanList = new ArrayList<>();
			for (int i = 0; i < entireList.size(); i++) {
				MemberBean mBean = new MemberBean();
				mBean.setMemberId(entireList.get(i));
				mBeanList.add(mBean);
			}
			
			if(mBeanList.size() == 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
				resMap.put(Constants.RESULT_MSG, "해당 설문에 모두 응답하였습니다.");
				
				return resMap;
			}
			
			// TODO 미응답자 푸쉬알림
			
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
			resMap.put(Constants.RESULT_MSG, "미응답자에게 성공적으로 푸쉬알림하였습니다.");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	} // end of nonResponseProc
	
} // end of class
