package com.ld.common.model;

import java.util.Date;

public class LostInfoFormModel {
    private Long id;

    private Long communityId;

    private String objectName;

    private String mobile;

    private String pickupLocation;

    private Long pickupUser;

    private String pickupUserName;

    private String objectDesc;

    private Date time;
    
    private String pickupTimeStr;

    private String claimLocation;

    private Long status;

    private String lostUserName;

    private String lostUserMobile;

    private String lostUserId;

    private Long processUser;

    private String remark;

    private Date createTime;

    private Date updateTime;


	public String getPickupTimeStr() {
		return pickupTimeStr;
	}

	public void setPickupTimeStr(String pickupTimeStr) {
		this.pickupTimeStr = pickupTimeStr;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCommunityId() {
        return communityId;
    }

    public void setCommunityId(Long communityId) {
        this.communityId = communityId;
    }

    public String getObjectName() {
        return objectName;
    }

    public void setObjectName(String objectName) {
        this.objectName = objectName == null ? null : objectName.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation == null ? null : pickupLocation.trim();
    }

    public Long getPickupUser() {
        return pickupUser;
    }

    public void setPickupUser(Long pickupUser) {
        this.pickupUser = pickupUser;
    }

    public String getPickupUserName() {
        return pickupUserName;
    }

    public void setPickupUserName(String pickupUserName) {
        this.pickupUserName = pickupUserName == null ? null : pickupUserName.trim();
    }

    public String getObjectDesc() {
        return objectDesc;
    }

    public void setObjectDesc(String objectDesc) {
        this.objectDesc = objectDesc == null ? null : objectDesc.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getClaimLocation() {
        return claimLocation;
    }

    public void setClaimLocation(String claimLocation) {
        this.claimLocation = claimLocation == null ? null : claimLocation.trim();
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public String getLostUserName() {
        return lostUserName;
    }

    public void setLostUserName(String lostUserName) {
        this.lostUserName = lostUserName == null ? null : lostUserName.trim();
    }

    public String getLostUserMobile() {
        return lostUserMobile;
    }

    public void setLostUserMobile(String lostUserMobile) {
        this.lostUserMobile = lostUserMobile == null ? null : lostUserMobile.trim();
    }

    public String getLostUserId() {
        return lostUserId;
    }

    public void setLostUserId(String lostUserId) {
        this.lostUserId = lostUserId == null ? null : lostUserId.trim();
    }

    public Long getProcessUser() {
        return processUser;
    }

    public void setProcessUser(Long processUser) {
        this.processUser = processUser;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}