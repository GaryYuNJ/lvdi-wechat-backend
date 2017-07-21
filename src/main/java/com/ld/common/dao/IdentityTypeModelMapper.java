package com.ld.common.dao;

import com.ld.common.model.IdentityTypeModel;

public interface IdentityTypeModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(IdentityTypeModel record);

    int insertSelective(IdentityTypeModel record);

    IdentityTypeModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(IdentityTypeModel record);

    int updateByPrimaryKey(IdentityTypeModel record);
}