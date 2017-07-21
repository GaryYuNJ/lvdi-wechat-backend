package com.ld.common.model;

import java.math.BigDecimal;
import java.util.Date;

public class houseModel {
    private Long id;

    private Long code;

    private String name;

    private Long buildingId;

    private Long floor;

    private Long businessTypeId;

    private Long businessSubTypeId;

    private BigDecimal totalSize;

    private String remark;

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

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Long getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(Long buildingId) {
        this.buildingId = buildingId;
    }

    public Long getFloor() {
        return floor;
    }

    public void setFloor(Long floor) {
        this.floor = floor;
    }

    public Long getBusinessTypeId() {
        return businessTypeId;
    }

    public void setBusinessTypeId(Long businessTypeId) {
        this.businessTypeId = businessTypeId;
    }

    public Long getBusinessSubTypeId() {
        return businessSubTypeId;
    }

    public void setBusinessSubTypeId(Long businessSubTypeId) {
        this.businessSubTypeId = businessSubTypeId;
    }

    public BigDecimal getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(BigDecimal totalSize) {
        this.totalSize = totalSize;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
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