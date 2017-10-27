package com.capstone.deptmanager.common.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.capstone.deptmanager.common.Constants;
import com.capstone.deptmanager.common.bean.StudentScheduleBean;

@Controller
public class IndexController {
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	} // end of index
	
	// 학사 일정 조회 처리
	@RequestMapping("/index/selectStudentScheculeProc")
	@ResponseBody
	public Map<String, Object> selectStudentScheculeProc() {

		Map<String, Object> resMap = new HashMap<String, Object>();

		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "학사일정을 불러오는데 실패했습니다.");
		
		List<StudentScheduleBean> sList = new ArrayList<>();
		try {
			Document doc = Jsoup.connect("http://www.kongju.ac.kr/service/schedule.jsp").get();
			Elements newsHeadlines = doc.select(".cal_sub li");
			
			StudentScheduleBean sBean = null;
			String sDate = "";
			String sContent = "";
			
			int cnt = 1;
			for (Element e : newsHeadlines) {
				if(cnt%2 == 1) {
					sBean = new StudentScheduleBean();
					
					sDate = e.text();
				} else if (cnt%2 == 0) {
					sContent = e.text();
					
					sBean.setsNo(cnt/2+"");
					sBean.setsDate(sDate);
					sBean.setsContent(sContent);
					
					sList.add(sBean);
				}
				cnt++;
			}
			
			resMap.put("ssList", sList);
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
			resMap.put(Constants.RESULT_MSG, "학사일정을 성공적으로 불러왔습니다.");
		} catch (IOException e) {
			
		}

		return resMap;
	} // end of selectStudentScheculeProc
	
} // end of class
