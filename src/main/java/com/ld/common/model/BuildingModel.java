package com.ld.common.model;

public class BuildingModel {
    private Long id;

    private String code;

    private String name;

    private Long communityId;

    private Long maxFloor;

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

    public Long getCommunityId() {
        return communityId;
    }

    public void setCommunityId(Long communityId) {
        this.communityId = communityId;
    }

    public Long getMaxFloor() {
        return maxFloor;
    }

    public void setMaxFloor(Long maxFloor) {
        this.maxFloor = maxFloor;
    }
}