package com.ld.common.model;

public class OwnerBasicModel {
    private Long id;

    private String crmCusId;

    private String realName;

    private String gender;

    private String mobile;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCrmCusId() {
        return crmCusId;
    }

    public void setCrmCusId(String crmCusId) {
        this.crmCusId = crmCusId == null ? null : crmCusId.trim();
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }
}