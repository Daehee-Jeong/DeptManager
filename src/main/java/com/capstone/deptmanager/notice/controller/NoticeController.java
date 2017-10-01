package com.capstone.deptmanager.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.capstone.deptmanager.common.Constants;
import com.capstone.deptmanager.notice.bean.NoticeBean;
import com.capstone.deptmanager.notice.bean.PageBean;
import com.capstone.deptmanager.notice.service.NoticeService;

@Controller
public class NoticeController {
	
	// 파일 업로드 저장경로
	@Value("#{config['file.upload.path']}")
	private String FILE_UPLOAD_PATH;
	
	// 서비스 선언
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/notice/notice")
	public String notice() {
		return "/notice/notice";
	}
	
	// 공지등록 화면
	@RequestMapping("/notice/insertNoticeForm")
	public String insertNoticeForm() {
		return "/notice/insertNoticeForm";
	} 

	// 공지 리스트 페이징 처리
	@RequestMapping("/notice/selectNoticeListProc")
	@ResponseBody
	public Map<String, Object> selectNoticeList(PageBean bean){
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "공지를 읽어 오는데 실패했습니다.");
		
		try {
			List<NoticeBean> noticeList = noticeService.selectNoticeList(bean);
	
			System.out.println(noticeList);
			
			if(noticeList != null && noticeList.size() > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "공지 리스트 조회에 성공 하였습니다.");
				resMap.put("mList", noticeList);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return resMap;

	}
}
