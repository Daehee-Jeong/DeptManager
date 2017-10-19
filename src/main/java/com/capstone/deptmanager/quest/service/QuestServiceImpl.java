package com.capstone.deptmanager.quest.service;

/**
 * DeptManager QuestServiceImpl
 * @author "dev.daehyoung"
 *
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.deptmanager.quest.bean.QuestBean;
import com.capstone.deptmanager.quest.dao.QuestDao;


@Service
public class QuestServiceImpl implements QuestService{

	@Autowired
	private QuestDao questDao;
	
	// 설문지 등록
	@Override
	public int insertQuest(QuestBean bean) throws Exception {
		return questDao.insertQuest(bean);
	}
	
	// 설문지 재등록 (수정)
	@Override
	public int updateQuest(QuestBean bean) throws Exception {
		return questDao.updateQuest(bean);
	}
	
	// 설문지 삭제
	@Override
	public int deleteQuest(QuestBean bean) throws Exception {
		return questDao.deleteQuest(bean);
	}
	
	// 설문지 1건 조회
	@Override
	public QuestBean selectQuest(QuestBean bean) throws Exception {
		return questDao.selectQuest(bean);
	}
	
	// [관리자] 설문지 리스트 최초 10건 조회
	@Override
	public List<QuestBean> selectQuestList() throws Exception {
		return questDao.selectQuestList();
	}

	// [관리자] 설문지 리스트 조회 (무한 스크롤)
	@Override
	public List<QuestBean> selectQuestListScrollDown(QuestBean bean) throws Exception {
		return questDao.selectQuestListScrollDown(bean);
	}
	
	// [학생] 설문지 리스트 최초 10건 조회
	@Override
	public List<QuestBean> selectQuestListStudent(QuestBean bean) throws Exception {
		return questDao.selectQuestListStudent(bean);
	}

	// [학생] 설문지 리스트 조회 (무한 스크롤)
	@Override
	public List<QuestBean> selectQuestListStudentScrollDown(QuestBean bean) throws Exception {
		return questDao.selectQuestListStudentScrollDown(bean);
	}
	
} // end of class
