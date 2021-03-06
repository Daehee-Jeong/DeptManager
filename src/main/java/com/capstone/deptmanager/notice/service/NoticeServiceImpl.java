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
	public int insertNotice(NoticeBean bean) throws Exception {
		return noticeDao.insertNotice(bean);
	}
	
	// 회원정보 1건 조회
	@Override
	public NoticeBean selectNotice(NoticeBean bean) throws Exception {
		return noticeDao.selectNotice(bean);
	}
	
	// 공지 수정
	@Override
	public int updateNotice(NoticeBean bean) throws Exception {
		return noticeDao.updateNotice(bean);
	}
	
	// 공지 삭제
	@Override
	public int deleteNotice(NoticeBean bean) throws Exception {
		return noticeDao.deleteNotice(bean);
	}
	
	// 공지 리스트 조회
	@Override
	public List<NoticeBean> selectNoticeList(int page) throws Exception {
		return noticeDao.selectNoticeList(page);
	}
	
	public List<NoticeBean> selectNoticeFilterList(PageBean bean) throws Exception {
		return noticeDao.selectNoticeFilterList(bean);
	}
	
	// 공지 리스트 조회 (index)
	@Override
	public List<NoticeBean> selectNoticeIndexList() throws Exception {
		return noticeDao.selectNoticeIndexList();
	}
	
/*	*//** 공지 검색 *//*
	public List<NoticeBean> searchNoticeList(PageBean bean) throws Exception {
		return noticeDao.searchNoticeList(bean);
	}*/
	
} // end of class
