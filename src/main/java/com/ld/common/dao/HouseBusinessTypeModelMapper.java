package com.ld.common.dao;

import com.ld.common.model.HouseBusinessTypeModel;

public interface HouseBusinessTypeModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(HouseBusinessTypeModel record);

    int insertSelective(HouseBusinessTypeModel record);

    HouseBusinessTypeModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(HouseBusinessTypeModel record);

    int updateByPrimaryKey(HouseBusinessTypeModel record);
}