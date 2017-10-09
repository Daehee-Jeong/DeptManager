package com.capstone.deptmanager.member.controller;

/**
 * DeptManager MemberController
 * @author "dev.daehyoung"
 *
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.capstone.deptmanager.common.AuthUtil;
import com.capstone.deptmanager.common.Constants;
import com.capstone.deptmanager.common.bean.AuthBean;
import com.capstone.deptmanager.member.bean.MemberBean;
import com.capstone.deptmanager.member.service.MemberService;

@Controller
public class MemberController {
	
	// 파일 업로드 저장경로
	@Value("#{config['file.upload.path']}")
	private String FILE_UPLOAD_PATH;
	
	// 서비스 선언
	@Autowired
	private MemberService memberService;
	
	// 회원가입 화면
	@RequestMapping("/member/insertMemberForm")
	public String insertMemberForm() {
		return "/member/insertMember";
	} // end of insertMemberForm
	
	// 회원가입 처리
	@RequestMapping("/member/insertMemberProc")
	@ResponseBody
	public Map<String, Object> insertMemberProc(MemberBean bean){
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "회원가입에 실패 하였습니다.");
		
		try {
			System.out.println(bean.getMemberId());
			int res = memberService.insertMember(bean);
			System.out.println("res 값:" + res);
			if(res > 0){
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "회원가입에 성공 하였습니다.");
			}
		}catch (Exception e) {
			
		}
		return resMap;
	}
	
	// 로그인 화면
	@RequestMapping("/member/loginMemberForm")
	public String loginMemberForm(){
		return "/member/loginMember";
	}
	
	// 로그인 처리
	@RequestMapping("/member/loginMemberProc")
	@ResponseBody
	public Map<String, Object> loginMemberProc(MemberBean bean, HttpServletRequest request){
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "로그인에 실패 하였습니다.");
		
		try{
			MemberBean memberBean = memberService.selectMember(bean);
			if( memberBean != null 
					&& memberBean.getMemberId().equals(bean.getMemberId()) ) {
				//로그인 성공 - 세션에 저장
				System.out.println("Login Success!");
				request.getSession().setAttribute(Constants.MEMBER_LOGIN_BEAN, memberBean);
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
			}
		}catch (Exception e) {
			
		}
		return resMap;
	}
	
	// 로그아웃 처리
	@RequestMapping("/member/logoutMemberProc")
	@ResponseBody
	public Map<String, Object> logoutMemberProc(HttpServletRequest request){
		request.getSession().invalidate();
		return null;
	}
	
	// 회원정보 수정화면
	@RequestMapping("/member/updateMemberForm")
	public String updateMemberForm(){
		return "/member/updateMember";
	}
	
	// 회원정보 수정처리
	@RequestMapping("/member/updateMemberProc")
	@ResponseBody
	public Map<String, Object> updateMemberProc(MemberBean memberBean, HttpServletRequest request){
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "회원정보 수정에 실패 하였습니다.");
		
		try {
			int res = memberService.updateMember(memberBean);
			
			if(res > 0) {
				memberBean = memberService.selectMember(memberBean);
				request.getSession().setAttribute(Constants.MEMBER_LOGIN_BEAN, memberBean);
				
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "회원정보 수정에 성공 하였습니다.");
			}
		} catch (Exception e) {
			
		}
		
		return resMap;
	}
	
	// 회원정보 탈퇴화면
	@RequestMapping("/member/deleteMemberForm")
	public String deleteMemberForm(){
		return "/member/deleteMember";
	}
		
	// 회원정보 탈퇴처리
	@RequestMapping("/member/deleteMemberProc")
	@ResponseBody
	public Map<String, Object> deleteMemberProc(MemberBean memberBean, HttpServletRequest request){
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "회원정보 탈퇴에 실패 하였습니다.");
		
		try {
			int res = memberService.deleteMember(memberBean);
			
			if(res > 0) {
				memberBean = memberService.selectMember(memberBean);
				request.getSession().invalidate();
				
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "회원정보 탈퇴에 성공 하였습니다.");
			}
		} catch (Exception e) {
			
		}
		
		return resMap;
	}
	
	// 비밀번호 찾기 화면
	@RequestMapping("/member/findMemberForm")
	public String findMemberForm(){
		return "/member/findMember";
	}
	
	// 비밀번호 찾기 처리
	@RequestMapping("/member/findMemberProc")
	@ResponseBody
	public Map<String, Object> findMemberProc(MemberBean memberBean){
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "비밀번호 찾기에 실패 하였습니다.");
		
		try {
			
			/* TODO
			 * 비밀번호 찾기 로직 구현
			 * 포털 학번 인증을 통해 인증 되면 새 비밀번호 설정
			 */
			
			if(true) {
				
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "비밀번호 찾기에 성공 하였습니다.");
				
			}
		} catch (Exception e) {
			
		}
		
		return resMap;
	}
	
	// 새 비밀번호 화면
	@RequestMapping("/member/newPasswordMemberForm")
	public String newPasswordMemberForm(MemberBean memberBean, Model model){
		model.addAttribute("memberId", memberBean.getMemberId());
		return "/member/newPasswordMember";
	}
	
	// 회원정보 조회
	@RequestMapping("/member/selectMemberProc")
	@ResponseBody
	public Map<String, Object> selectMember(MemberBean memberBean) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "회원정보 조회에 실패 하였습니다.");
		
		try {
			MemberBean mBean = memberService.selectMember(memberBean);
			
			if(mBean != null) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "회원정보 조회에 성공 하였습니다.");
				resMap.put("mBean", mBean);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	}
	
	// 회원정보 리스트 조회
	@RequestMapping("/member/selectMembeListProc")
	@ResponseBody
	public Map<String, Object> selectMemberList(MemberBean memberBean) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "회원정보 리스트 조회에 실패 하였습니다.");
		
		try {
			List<MemberBean> memberList = memberService.selectMemberList();
			
			if(memberList != null && memberList.size() > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "회원정보 리스트 조회에 성공 하였습니다.");
				resMap.put("mList", memberList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	}
	
	
	
	// 학생 인증
	@RequestMapping("/member/authMemberProc")
	@ResponseBody
	public Map<String, Object> authMemberProc(String memberId, String memberPw) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "계정 인증에 실패하였습니다.");
		
		AuthBean aBean = AuthUtil.authKnuLibrary(memberId, memberPw);
		
		if (aBean != null) {
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
			resMap.put(Constants.RESULT_MSG, "계정 인증에 성공하였습니다.");
			resMap.put("aBean", aBean);
		}
		
		return resMap;
	} // end of authMemberProc
	
} // end of class
