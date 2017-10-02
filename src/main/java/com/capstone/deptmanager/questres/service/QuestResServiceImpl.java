package com.capstone.deptmanager.questres.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.deptmanager.questres.bean.QuestResBean;
import com.capstone.deptmanager.questres.dao.QuestResDao;

/**
 * QuestResServiceImpl
 * @author daehee
 *
 */

@Service
public class QuestResServiceImpl implements QuestResService{
	
	@Autowired
	private QuestResDao questResDao;
	
	@Override
	public int insertQuestRes(QuestResBean bean) {
		return questResDao.insertQuestRes(bean);
	}

	@Override
	public QuestResBean selectQuestRes(QuestResBean bean) {
		return questResDao.selectQuestRes(bean);
	}

	@Override
	public List<QuestResBean> selectQuestResList(QuestResBean bean) {
		return questResDao.selectQuestResList(bean);
	}

} // end of class
