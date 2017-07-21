package com.ld.common.dao;

import com.ld.common.model.OwnerBasicModel;

public interface OwnerBasicModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(OwnerBasicModel record);

    int insertSelective(OwnerBasicModel record);

    OwnerBasicModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OwnerBasicModel record);

    int updateByPrimaryKey(OwnerBasicModel record);

    OwnerBasicModel selectByCRMCusId(String cmcustid);
}