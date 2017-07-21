package com.ld.common.utils;

import java.security.MessageDigest;
import java.util.Date;

import com.ld.common.bean.SSORequestBean;
import com.ld.core.config.IConfig;

public class SSOSignVerification {
	
	public static void generateSign(SSORequestBean param){
		
		param.setTimestamp((new Date()).getTime()+"");
		param.setSource(IConfig.get("ssoSource"));
		String sign = SSOSignVerification.getSha1(param.getTimestamp() + IConfig.get("ssoSignKey"));
		param.setSign(sign);
	}

    public static String getSha1(String str){
        if(str==null||str.length()==0){
            return null;
        }
        char hexDigits[] = {'0','1','2','3','4','5','6','7','8','9',
                'a','b','c','d','e','f'};
        try {
            MessageDigest mdTemp = MessageDigest.getInstance("SHA1");
            mdTemp.update(str.getBytes("UTF-8"));

            byte[] md = mdTemp.digest();
            int j = md.length;
            char buf[] = new char[j*2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                buf[k++] = hexDigits[byte0 >>> 4 & 0xf];
                buf[k++] = hexDigits[byte0 & 0xf];      
            }
            return new String(buf);
        } catch (Exception e) {
            // TODO: handle exception
            return null;
        }
    }
}
