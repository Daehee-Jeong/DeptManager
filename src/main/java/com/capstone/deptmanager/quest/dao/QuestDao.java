package com.capstone.deptmanager.quest.dao;

/**
 * DeptManager QuestDao
 * @author "dev.daehyoung"
 *
 */

import java.util.List;

import com.capstone.deptmanager.quest.bean.QuestBean;

public interface QuestDao {

	/** 설문지를 등록한다. **/
	public int insertQuest(QuestBean bean);
	
	/** 설문지를 재등록한다. (수정) **/
	public int updateQuest(QuestBean bean);
	
	/** 설문지를 삭제한다. **/
	public int deleteQuest(QuestBean bean);
	
	/** 설문지를 1건 조회해서 가져온다. **/
	public QuestBean selectQuest(QuestBean bean);
	
	/** 설문지를 조회해서 리스트로 가져온다. **/
	public List<QuestBean> selectQuestList();
	
}
