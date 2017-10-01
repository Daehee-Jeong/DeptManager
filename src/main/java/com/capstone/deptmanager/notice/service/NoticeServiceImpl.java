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
	public List<NoticeBean> selectNoticeList(PageBean bean) throws Exception {
		return noticeDao.selectNoticeList(bean);
	}
	
} // end of class
