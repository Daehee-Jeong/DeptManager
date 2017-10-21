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
	public int insertNoticeProc(NoticeBean bean);
	
	/** 공지 읽기 */
	public NoticeBean selectNoticeProc(NoticeBean bean);
	
	/** 공지 페이징 출력 */
	public List<NoticeBean> selectNoticeListProc(PageBean bean);
	
	/** 공지 수정 */
	public int updateNoticeProc(NoticeBean bean);
	
	/** 공지 삭제 */
	public int deleteNoticeProc(NoticeBean bean);
}
