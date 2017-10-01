package com.capstone.deptmanager.questres.bean;

/**
 * 설문응답 객체
 * @author daehee
 *
 */
public class QuestResBean {

	private String questResNo;			// 설문응답 번호
	private String questResQuest;		// 설문응답 설문지 번호
	private String questResMember;		// 설문응답 회원 번호
	private String questResContent;		// 설문응답 설문내용
	private String questResDate;			// 설문응답 날짜
	
	public QuestResBean() {}

	public QuestResBean(String questResNo, String questResQuest, String questResMember, String questResContent,
			String questResDate) {
		this.questResNo = questResNo;
		this.questResQuest = questResQuest;
		this.questResMember = questResMember;
		this.questResContent = questResContent;
		this.questResDate = questResDate;
	}

	public String getQuestResNo() {
		return questResNo;
	}

	public void setQuestResNo(String questResNo) {
		this.questResNo = questResNo;
	}

	public String getQuestResQuest() {
		return questResQuest;
	}

	public void setQuestResQuest(String questResQuest) {
		this.questResQuest = questResQuest;
	}

	public String getQuestResMember() {
		return questResMember;
	}

	public void setQuestResMember(String questResMember) {
		this.questResMember = questResMember;
	}

	public String getQuestResContent() {
		return questResContent;
	}

	public void setQuestResContent(String questResContent) {
		this.questResContent = questResContent;
	}

	public String getQuestResDate() {
		return questResDate;
	}

	public void setQuestResDate(String questResDate) {
		this.questResDate = questResDate;
	}
	
} // end of class
