package com.ld.common.utils;

import org.springframework.web.client.RestTemplate;

import com.ld.common.bean.SSORequestBean;
import com.ld.common.bean.SSOResponseBean;
import com.ld.core.config.IConfig;

public class SSOServiceUtil {
	
	public static SSOResponseBean getUserBasicInfo(SSORequestBean requestParams){
		
		SSOSignVerification.generateSign(requestParams);
		
		RestTemplate restTemplate = new RestTemplate();
		
		String requestUrl = IConfig.get("ssoUrl");
		
		return restTemplate.postForObject(requestUrl, requestParams, SSOResponseBean.class); 
	}
	
	
}
