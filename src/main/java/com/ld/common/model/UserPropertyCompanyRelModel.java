package com.ld.common.model;

import java.util.Date;

public class UserPropertyCompanyRelModel {
    private Long userId;

    private Long propertyCompanyId;

    private Long status;

    private Date createTime;

    private Date updateTime;

    private Long updateUser;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getPropertyCompanyId() {
        return propertyCompanyId;
    }

    public void setPropertyCompanyId(Long propertyCompanyId) {
        this.propertyCompanyId = propertyCompanyId;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
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

    public Long getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(Long updateUser) {
        this.updateUser = updateUser;
    }
}