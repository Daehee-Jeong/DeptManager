package com.capstone.deptmanager.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.capstone.deptmanager.common.Constants;
import com.capstone.deptmanager.notice.bean.ImageBean;
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

	@RequestMapping("/notice/noticeForm")
	public String noticeForm() {
		return "/notice/noticeForm";
	}
	
	@RequestMapping("/notice/insertNoticeProc")
	@ResponseBody
	public Map<String, Object> insertNotice(NoticeBean bean) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "공지 등록에 실패했습니다.");
		
		try {
			System.out.println(bean.getNoticeTitle());
			int res = noticeService.insertNotice(bean);
			System.out.println("res 값:" + res);
			if(res > 0){
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "공지 등록에 성공했습니다.");
			}
		}catch (Exception e) {
			
		}
		return resMap;
	}
	
	@RequestMapping("/notice/deleteNoticeProc")
	@ResponseBody
	public Map<String, Object> deleteNotice(NoticeBean bean) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "공지 삭제에 실패했습니다.");
		
		try {
			System.out.println(bean.getNoticeNo());
			int res = noticeService.deleteNotice(bean);
			System.out.println("res 값:" + res);
			if(res > 0){
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "공지 삭제에 성공했습니다.");
			}
		}catch (Exception e) {
			
		}
		return resMap;
	}


	@RequestMapping("/notice/imageUpload")
	public String imageUpload(ImageBean bean, HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		String root_path = session.getServletContext().getRealPath("/");
		String attach_path = "resources/image";
		MultipartFile upload = bean.getUpload();
		
		String filename = "";
		String CKEditorFuncNum = "";
		
		if (upload != null) {
			filename = upload.getOriginalFilename();
			bean.setNewFileName(filename);
			
			CKEditorFuncNum = bean.getCKEditorFuncNum();
			
			try {
				File file = new File(root_path + attach_path + filename);
				System.out.println(root_path + attach_path + filename);
				
				upload.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		String file_path = root_path + attach_path + filename;
		
		model.addAttribute("file_path", file_path);
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
		
		return "/notice/upload";
	}

	// 공지 리스트 페이징 처리
	@RequestMapping("/notice/selectNoticeListProc")
	@ResponseBody
	public Map<String, Object> selectNoticeListProc(PageBean bean) {

		Map<String, Object> resMap = new HashMap<String, Object>();

		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "공지를 읽어 오는데 실패했습니다.");

		try {
			List<NoticeBean> noticeList = noticeService.selectNoticeList(bean);

			System.out.println(noticeList);

			if (noticeList != null && noticeList.size() > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "공지 리스트 조회에 성공 하였습니다.");
				resMap.put("mList", noticeList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resMap;

	}
}
