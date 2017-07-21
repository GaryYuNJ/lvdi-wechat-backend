package com.ld.common.dao;

import com.ld.common.model.HouseBusinessSubTypeModel;

public interface HouseBusinessSubTypeModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(HouseBusinessSubTypeModel record);

    int insertSelective(HouseBusinessSubTypeModel record);

    HouseBusinessSubTypeModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(HouseBusinessSubTypeModel record);

    int updateByPrimaryKey(HouseBusinessSubTypeModel record);
}