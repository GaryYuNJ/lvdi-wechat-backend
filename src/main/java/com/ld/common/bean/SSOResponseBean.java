package com.ld.common.bean;

public class SSOResponseBean {
	
	private String code;
	
	private String msg;
	
	private String ticket;
	
	private SSOUserInfo data;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public SSOUserInfo getData() {
		return data;
	}

	public void setData(SSOUserInfo data) {
		this.data = data;
	}
	
	
	
	
}
