package com.capstone.deptmanager.notice.service;


/**
 * Notice Service (B.L.)
 * @author 이재현
 *
 */

import java.util.List;

import com.capstone.deptmanager.notice.bean.NoticeBean;
import com.capstone.deptmanager.notice.bean.PageBean;


public interface NoticeService {
	
	/** 공지 생성 */
	public int insertNoticeProc(NoticeBean bean) throws Exception;
	
	/** 공지 읽기 */
	public NoticeBean selectNoticeProc(NoticeBean bean) throws Exception;
	
	/** 공지 수정 */
	public int updateNoticeProc(NoticeBean bean) throws Exception;
	
	/** 공지 삭제 */
	public int deleteNoticeProc(NoticeBean bean) throws Exception;
	
	/** 공지 전체 목록 출력 */
	public List<NoticeBean> selectNoticeListProc(PageBean bean) throws Exception;
	
}
