package com.capstone.deptmanager.member.dao;

/**
 * DeptManager MemberDao
 * @author "dev.daehyoung"
 *
 */

import java.util.List;

import com.capstone.deptmanager.member.bean.MemberBean;

public interface MemberDao {

	/** 회원정보를 삽입한다. (회원가입) **/
	public int insertMember(MemberBean bean);
	
	/** 회원정보를 1건 조회해서 가져온다. **/
	public MemberBean selectMember(MemberBean bean);
	
	/** 회원정보를 수정한다. **/
	public int updateMember(MemberBean bean);
	
	/** 회원정보를 삭제한다. **/
	public int deleteMember(MemberBean bean);
	
	/** 회원정보를 조회해서 리스트로 가져온다. **/
	public List<MemberBean> selectMemberList();
	
	/** 학번이 주입된 MemberBean List를 넘겨받아 앱토큰을 포함한 MemberBean List 로 리턴 **/
	public List<MemberBean> selectMemberBeanWithTokenList(List<MemberBean> memberBeanList);
}
