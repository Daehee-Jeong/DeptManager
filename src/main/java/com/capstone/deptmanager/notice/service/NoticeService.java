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
	public int insertNotice(NoticeBean bean) throws Exception;
	
	/** 공지 읽기 */
	public NoticeBean selectNotice(NoticeBean bean) throws Exception;
	
	/** 공지 수정 */
	public int updateNotice(NoticeBean bean) throws Exception;
	
	/** 공지 삭제 */
	public int deleteNotice(NoticeBean bean) throws Exception;
	
	/** 공지 전체 목록 출력 */
	public List<NoticeBean> selectNoticeList(int page) throws Exception;

	public List<NoticeBean> selectNoticeFilterList(PageBean bean) throws Exception;
	
	/** 공지 리스트 조회 (index) */
	public List<NoticeBean> selectNoticeIndexList() throws Exception;
	
}
