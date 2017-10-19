package com.capstone.deptmanager.questres.dao;

import java.util.List;

import com.capstone.deptmanager.questres.bean.QuestResBean;

/**
 * QuestResDao
 * @author daehee
 *
 */

public interface QuestResDao {

	/** 설문응답을 삽입한다. (응답제출) **/
	public int insertQuestRes(QuestResBean bean);
	
	/** 설문응답 1건 조회해서 가져온다. **/
	public QuestResBean selectQuestRes(QuestResBean bean);
	
	/** 설문응답들을 조회해서 리스트로 가져온다. **/
	public List<QuestResBean> selectQuestResList(QuestResBean bean);
	
	/** 설문지 번호를 이용하여 해당 설문응답들을 조회해서 리스트로 가져온다. **/
	public List<QuestResBean> selectQuestResListFromQuestNo(QuestResBean bean);
	
} // end of class
