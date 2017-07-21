package com.ld.common.model;

import java.util.Date;

import com.ld.community.bean.CommonRequestParam;

public class OwnerCallfixFormModel extends CommonRequestParam{
    private Long id;

    private Long ownerId;

    private Long communityId;

    private String organization;

    private String object;

    private String name;

    private String mobile;

    private String callfixDesc;

    private Long status;

    private String responsiblePerson;

    private String responsiblePersonMobile;

    private Long processUser;

    private String remark;

    private Date createTime;

    private Date updateTime;
    
	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Long ownerId) {
        this.ownerId = ownerId;
    }

    public Long getCommunityId() {
        return communityId;
    }

    public void setCommunityId(Long communityId) {
        this.communityId = communityId;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization == null ? null : organization.trim();
    }

    public String getObject() {
        return object;
    }

    public void setObject(String object) {
        this.object = object == null ? null : object.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getCallfixDesc() {
        return callfixDesc;
    }

    public void setCallfixDesc(String callfixDesc) {
        this.callfixDesc = callfixDesc == null ? null : callfixDesc.trim();
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public String getResponsiblePerson() {
        return responsiblePerson;
    }

    public void setResponsiblePerson(String responsiblePerson) {
        this.responsiblePerson = responsiblePerson == null ? null : responsiblePerson.trim();
    }

    public String getResponsiblePersonMobile() {
        return responsiblePersonMobile;
    }

    public void setResponsiblePersonMobile(String responsiblePersonMobile) {
        this.responsiblePersonMobile = responsiblePersonMobile == null ? null : responsiblePersonMobile.trim();
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