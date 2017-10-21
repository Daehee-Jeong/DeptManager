package com.capstone.deptmanager.notice.service;

/**
 * Notice Service (B.L.)
 * @author 이재현
 *
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.deptmanager.notice.bean.NoticeBean;
import com.capstone.deptmanager.notice.bean.PageBean;
import com.capstone.deptmanager.notice.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;
	
	// 공지 등록
	@Override
	public int insertNoticeProc(NoticeBean bean) throws Exception {
		return noticeDao.insertNoticeProc(bean);
	}
	
	// 회원정보 1건 조회
	@Override
	public NoticeBean selectNoticeProc(NoticeBean bean) throws Exception {
		return noticeDao.selectNoticeProc(bean);
	}
	
	// 공지 수정
	@Override
	public int updateNoticeProc(NoticeBean bean) throws Exception {
		return noticeDao.updateNoticeProc(bean);
	}
	
	// 공지 삭제
	@Override
	public int deleteNoticeProc(NoticeBean bean) throws Exception {
		return noticeDao.deleteNoticeProc(bean);
	}
	
	// 공지 리스트 조회
	@Override
	public List<NoticeBean> selectNoticeListProc(PageBean bean) throws Exception {
		return noticeDao.selectNoticeListProc(bean);
	}
	
} // end of class
