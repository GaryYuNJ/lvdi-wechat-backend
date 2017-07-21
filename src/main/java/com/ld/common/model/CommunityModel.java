package com.ld.common.model;

import java.util.Date;

public class CommunityModel {
    private Long id;

    private String code;

    private String name;

    private String provinceCode;

    private String cityCode;

    private String districtCode;

    private String address;

    private Long propertyCompanyId;

    private Long bigint1;

    private Long bigint2;

    private String varchar1;

    private String varchar2;

    private Date createTime;

    private Date updateTime;

    private Long updateUser;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode == null ? null : provinceCode.trim();
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode == null ? null : cityCode.trim();
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode == null ? null : districtCode.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Long getPropertyCompanyId() {
        return propertyCompanyId;
    }

    public void setPropertyCompanyId(Long propertyCompanyId) {
        this.propertyCompanyId = propertyCompanyId;
    }

    public Long getBigint1() {
        return bigint1;
    }

    public void setBigint1(Long bigint1) {
        this.bigint1 = bigint1;
    }

    public Long getBigint2() {
        return bigint2;
    }

    public void setBigint2(Long bigint2) {
        this.bigint2 = bigint2;
    }

    public String getVarchar1() {
        return varchar1;
    }

    public void setVarchar1(String varchar1) {
        this.varchar1 = varchar1 == null ? null : varchar1.trim();
    }

    public String getVarchar2() {
        return varchar2;
    }

    public void setVarchar2(String varchar2) {
        this.varchar2 = varchar2 == null ? null : varchar2.trim();
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