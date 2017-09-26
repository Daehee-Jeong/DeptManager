package com.capstone.deptmanager.common;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * 공주대학교 포털, 도서관 홈페이지 로그인 기능을 수행하는 유틸 클래스
 * @author daehee
 *
 */
public class AuthUtil {

	public static String authKnuPortal(String memberId, String memberPw) {
		
		HttpsURLConnection conn = null;
		
		String URL_APPENDED = "https://m.kongju.ac.kr:444/mobile/ssl/login2.jsp";
		String param = "sg_type=&gourl=/index.asp&sg_error_url=&sg_pkid=10&sg_return=http://iile.kongu.ac.kr/login/ssl_login_ok.asp&sg_uid=201202023&sg_pwd=wjdeogml1!";
		
		try {
			URL url = new URL(URL_APPENDED);
			
			// 연결을 준비한다.
			conn = (HttpsURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			
			DataOutputStream wr = new DataOutputStream (conn.getOutputStream ());
			wr.writeBytes (param);
	      	wr.flush ();
	      	wr.close ();

			// Json String 을 받아낸다.
			BufferedReader br = null;
			if (conn.getResponseCode() >= 400) {
	            br = new BufferedReader(new InputStreamReader((conn.getErrorStream())));
			} else {
				br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			}
			
			StringBuffer respStr = new StringBuffer();
			String line;
			while ((line = br.readLine()) != null) {
				respStr.append(line);
	        }
			
			/* 결과 스트링 출력 */
			System.out.println("[결과값]:\n" + respStr + "\n");
			
			/* 연결 해제 */
			if(conn != null) {
				conn.disconnect();	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) {
				conn.disconnect();	
			}
		} // end of try~catch~finally
		
		return "";
	} // end of authKnuPortal
	
	public static AuthBean authKnuLibrary(String memberId, String memberPw) {
		
		// isAuth 의 결과 값에 따라 개인정보 조회 여부를 결정한다.
		boolean isAuth = false;
		String accessToken = "";
		
		AuthBean aBean = new AuthBean();
		
		/**
		 * 1. 로그인
		 */
		HttpsURLConnection conn = null;
		
		String URL_APPENDED = "https://library.kongju.ac.kr/pyxis-api/api/login";
		String param = "{\"loginId\":\"" + memberId + "\",\"password\":\"" + memberPw + "\",\"_psm\":false}";
		System.out.println(param);
		
		try {
			URL url = new URL(URL_APPENDED);
			
			// 연결을 준비한다.
			conn = (HttpsURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			
			DataOutputStream wr = new DataOutputStream (conn.getOutputStream ());
			wr.writeBytes (param);
	      	wr.flush ();
	      	wr.close ();

			// Json String 을 받아낸다.
			BufferedReader br = null;
			if (conn.getResponseCode() >= 400) {
	            br = new BufferedReader(new InputStreamReader((conn.getErrorStream())));
			} else {
				br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			}
			
			StringBuffer respStr = new StringBuffer();
			String line;
			while ((line = br.readLine()) != null) {
				respStr.append(line);
	        }
			
			/* 결과 스트링 출력 */
			System.out.println("[결과값]:\n" + respStr + "\n");
			
			if (respStr != null && !respStr.equals("")) {
				JsonParser parser = new JsonParser();
				JsonObject rootObj = (JsonObject) parser.parse(respStr.toString()); // 루트노드 획득
				
				String success = rootObj.get("success").getAsString();
				
				if ("true".equals(success)) {
					isAuth = true;
					accessToken = rootObj.get("data").getAsJsonObject().get("accessToken").getAsString();
					System.out.println("accessToken : " + accessToken);
				}
			}
			
			/* 연결 해제 */
			if(conn != null) {
				conn.disconnect();	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) {
				conn.disconnect();	
			}
		} // end of try~catch~finally
		// 로그인 프로세스 끝
		
		if (!isAuth) {
			return null;
		}
		
		/**
		 * 2. 개인정보 조회
		 */
		conn = null;
		URL_APPENDED = "https://library.kongju.ac.kr/pyxis-api/1/api/my-info";
		
		try {
			URL url = new URL(URL_APPENDED);
			
			// 연결을 준비한다.
			conn = (HttpsURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			conn.setRequestProperty("pyxis-auth-token", accessToken);

			// Json String 을 받아낸다.
			BufferedReader br = null;
			if (conn.getResponseCode() >= 400) {
	            br = new BufferedReader(new InputStreamReader((conn.getErrorStream())));
			} else {
				br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			}
			
			StringBuffer respStr = new StringBuffer();
			String line;
			while ((line = br.readLine()) != null) {
				respStr.append(line);
	        }
			
			/* 결과 스트링 출력 */
			System.out.println("[결과값]:\n" + respStr + "\n");
			
			if (respStr != null && !respStr.equals("")) {
				JsonParser parser = new JsonParser();
				JsonObject rootObj = (JsonObject) parser.parse(respStr.toString()); // 루트노드 획득
				
				String success = rootObj.get("success").getAsString();
				
				if ("true".equals(success)) {
					JsonObject data = rootObj.get("data").getAsJsonObject();
					String name = data.get("name").getAsString();
					String memberNo = data.get("memberNo").getAsString();
					String email = data.get("email").getAsString();
					String mobilePhoneNo = data.get("mobilePhoneNo").getAsString();
					String deptName = data.get("dept").getAsJsonObject().get("name").getAsString();
					String state = data.get("patronState").getAsJsonObject().get("name").getAsString();
					String addr = data.get("addressBase").getAsString();
					
					aBean.setName(name);
					aBean.setMemberNo(memberNo);
					aBean.setEmail(email);
					aBean.setMobilePhoneNo(mobilePhoneNo);
					aBean.setDeptName(deptName);
					aBean.setState(state);
					aBean.setAddr(addr);
					
					System.out.println("name : " + name);
					System.out.println("memberNo : " + memberNo);
					System.out.println("email : " + email);
					System.out.println("mobilePhoneNo : " + mobilePhoneNo);
					System.out.println("deptName : " + deptName);
					System.out.println("state : " + state);
					System.out.println("addr : " + addr);
				}
			}
			
			/* 연결 해제 */
			if(conn != null) {
				conn.disconnect();	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) {
				conn.disconnect();	
			}
		} // end of try~catch~finally
		
		return aBean;
		
	} // end of authKnuLibrary
	
} // end of class
