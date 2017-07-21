package com.ld.common.dao;

import java.util.List;

import com.ld.common.model.CommunityModel;

public interface CommunityModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(CommunityModel record);

    int insertSelective(CommunityModel record);

    CommunityModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(CommunityModel record);

    int updateByPrimaryKey(CommunityModel record);
    
    List<CommunityModel> selectByRelatedUserId(Long userId);

    CommunityModel selectCommunityIdByCode(String communityCode);
}