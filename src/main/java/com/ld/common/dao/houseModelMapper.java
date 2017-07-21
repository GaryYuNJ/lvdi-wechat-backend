package com.ld.common.dao;

import com.ld.common.model.houseModel;

public interface houseModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(houseModel record);

    int insertSelective(houseModel record);

    houseModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(houseModel record);

    int updateByPrimaryKey(houseModel record);
}