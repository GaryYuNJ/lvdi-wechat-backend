package com.ld.common.bean;

import java.util.Map;

public class SSORequestBean {
	/*
	{
		"params": {
		"ticket": "00000255595357_APP"
		},
		"sign": "ac9e29882aecdf941bc9221312544ef2d0b5aa21",
		"timestamp": "1489390123711",
		"source":"APP"
		}*/
	private String sign ;
	
	private String timestamp ;
	
	private String source ;
	
	private Map<String, Object> params ;

	public String getSign() {
		return sign;
	}


	public void setSign(String sign) {
		this.sign = sign;
	}


	public String getTimestamp() {
		return timestamp;
	}


	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}


	public String getSource() {
		return source;
	}


	public void setSource(String source) {
		this.source = source;
	}


	public Map<String, Object> getParams() {
		return params;
	}


	public void setParams(Map<String, Object> params) {
		this.params = params;
	}
	
	
}
