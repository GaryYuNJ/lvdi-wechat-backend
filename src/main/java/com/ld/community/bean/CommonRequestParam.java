package com.ld.community.bean;

public class CommonRequestParam {

	private String communityCode;
	
    private Integer pageNo;
    
    private String ssoTicket;
    
	public String getSsoTicket() {
		return ssoTicket;
	}

	public void setSsoTicket(String ssoTicket) {
		this.ssoTicket = ssoTicket;
	}


	public String getCommunityCode() {
		return communityCode;
	}

	public void setCommunityCode(String communityCode) {
		this.communityCode = communityCode;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}


    
    
    
}