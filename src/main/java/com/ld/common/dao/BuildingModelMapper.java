package com.ld.common.dao;

import com.ld.common.model.BuildingModel;

public interface BuildingModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(BuildingModel record);

    int insertSelective(BuildingModel record);

    BuildingModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BuildingModel record);

    int updateByPrimaryKey(BuildingModel record);
}