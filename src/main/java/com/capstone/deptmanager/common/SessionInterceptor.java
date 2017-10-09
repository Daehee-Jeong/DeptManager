package com.capstone.deptmanager.common;

/**
 * DeptManager SessionInterceptor
 * @author "dev.daehyoung"
 *
 */

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.capstone.deptmanager.member.bean.MemberBean;


public class SessionInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception 
	{
		
		MemberBean mBean = (MemberBean) request.getSession().getAttribute(Constants.MEMBER_LOGIN_BEAN);
		if( mBean != null ) return true;
		
		response.sendRedirect("/member/loginMemberForm.do");
		return false;
		
	} // end of preHandle
	
} // end of class
