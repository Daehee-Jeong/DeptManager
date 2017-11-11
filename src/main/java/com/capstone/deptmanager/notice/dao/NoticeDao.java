package com.capstone.deptmanager.notice.dao;

import java.util.List;

import com.capstone.deptmanager.notice.bean.NoticeBean;
import com.capstone.deptmanager.notice.bean.PageBean;

/**
 * Notice Table 접근을 위한 Dao Interface
 * -- CRUD -- 
 * @author 이재현
 *
 */


public interface NoticeDao {

	/** 공지 생성 */
	public int insertNotice(NoticeBean bean);
	
	/** 공지 읽기 */
	public NoticeBean selectNotice(NoticeBean bean);
	
	/** 공지 페이징 출력 */
	public List<NoticeBean> selectNoticeList(int page);
	
	public List<NoticeBean> selectNoticeFilterList(PageBean bean);
	
	/** 공지 수정 */
	public int updateNotice(NoticeBean bean);
	
	/** 공지 삭제 */
	public int deleteNotice(NoticeBean bean);
	
	/** 공지 리스트 조회 (index) */
	public List<NoticeBean> selectNoticeIndexList();
	
/*	*//** 공지 검색 *//*
	public List<NoticeBean> searchNoticeList(PageBean bean);*/
}
