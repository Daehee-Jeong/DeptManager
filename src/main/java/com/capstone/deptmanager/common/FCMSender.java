package com.capstone.deptmanager.common;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.capstone.deptmanager.alarm.bean.AlarmBean;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Firebase Massaging 서비스를 이용해 푸시알림을 보내는 클래스
 * @author daehee
 *
 */
public class FCMSender {

	public static final String FCM_SEND_URL = "https://fcm.googleapis.com/fcm/send";
	public static final String SERVER_API_KEY = "AAAAQNUKA0U:APA91bHvExzbGn_vtWxQcVyLWv3DxQiq9EUgVHl3FEuSMbo0m5cDSVEZ2QY4Xmgbg4E7mumsOIQfFGwNC2g07W1KSMvSmCrwAz1hPuLz6moJt6Jg85oebrKhjKo4nVcORP--WxJu_TU3";
	
	/**
	 * 여러
	 * @param msgBeanList
	 * @return
	 */
	public static int sendPushMsgBeanList(List<PushMsgBean> msgBeanList) {
		int successCount = 0;
		if ( msgBeanList != null && msgBeanList.size()>0 ) {
			for (int i = 0; i < msgBeanList.size(); i++) {
				if (sendPushMsgBean(msgBeanList.get(i))) {
					successCount++;
				}
			} // end of for
		} // end of if
		return successCount;
	} // end of sendPushMsgBeanList()
	
	public static boolean sendPushMsgBean(PushMsgBean msgBean) {

		System.out.println("start push scheduler... " + new Date());
		
		HttpURLConnection conn = null;
		boolean resBool = false;
		
		try {
			URL url = new URL(FCM_SEND_URL);
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());//현재시간
			
			//ready Connection
			conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
			conn.setRequestProperty("Authorization", "key=" + SERVER_API_KEY);
			
			// 주석친 것들은 이제 컨트롤러에서 데이터를 주입해서 올것이므로 생략시킨 것이다.
//			//make send Data Object
//			PushMsgBean pushBean = new PushMsgBean();
//			//TODO 전송받을 기기의 TOKEN을 넣는다. 
////			pushBean.setTo( "" );
//			pushBean.setTo(toToken);
//			
//			PushMsgBean.Data data = new PushMsgBean.Data();
//			data.setTitle("Push Title");
//			data.setMessage("Push Message");
			msgBean.getData().setTime(timestamp.toString());
			
			//make json
			Gson gson = new Gson();
			String input = gson.toJson(msgBean);

			System.out.println("만들어진 pushBean json : " + input);

//TODO 아래와 같이 전송할 JSON 형식이 만들어져야함.			
//			{ 
//				  "collapse_key": "score_update",
//				  "time_to_live": 108,
//				  "delay_while_idle": true,
//				  "data": {
//				    "score": "4x8",
//				    "time": "15:16.2342"
//				  },
//				  "to" : "bk3RNwTe3H0:CI2k_HHwgIpoDKCIZvvDMExUdFQ3P1..."
//			}

			//Send JSON
			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes("utf-8"));
			os.flush();

			//response json
			BufferedReader br = null;
			if (conn.getResponseCode() >= 400) {
	            br = new BufferedReader(new InputStreamReader((conn.getErrorStream())));
			} else {
				br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
				resBool = true;
			}
			
			StringBuffer respStr = new StringBuffer();
			String line;
			while ((line = br.readLine()) != null) {
				respStr.append(line);
	        }
			
			System.out.println("respStr : " + respStr);
			
			/*
			 * 푸시알림 성공 여부를 확인하기위한 소스 추가
			 */
			JsonParser parser = new JsonParser();
			JsonObject rootObj = (JsonObject) parser.parse(new String(respStr));
			JsonElement errorObj = rootObj.get("error");
			
			AlarmBean aBean = new AlarmBean();
			aBean.setAlarm_check( (errorObj == null) ? "false" : "true");
			
			// TODO 푸시 전송을 수행 후 성공여부에 따른 푸시알림 기록 저장에 대해서, Util 클래스가 AlarmController 의 메소드를 어떻게 호출할 것인지에 대한 고민이 필요.
			
			System.out.println(respStr + "\n");
			
			if(conn != null) {
				conn.disconnect();	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) {
				conn.disconnect();	
			}
		}
		
		return resBool;
	}
}
