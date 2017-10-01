package com.capstone.deptmanager.common;

/**
 * FCM Sender 클래스를 이용해 푸시메시지를 전달할때 사용할 객체
 * @author daehee
 *
 */
public class PushMsgBean {
	
	private String to; //=> pushToken
	private Data data;
	
	
	//Data Class
	public static class Data {
		private String title;
		private String message;
		private String time;
		
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public String getTime() {
			return time;
		}
		public void setTime(String time) {
			this.time = time;
		}
	}
	
	
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public Data getData() {
		return data;
	}
	public void setData(Data data) {
		this.data = data;
	}
	
}
