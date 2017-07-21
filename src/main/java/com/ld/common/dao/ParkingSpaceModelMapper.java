package com.ld.common.dao;

import com.ld.common.model.ParkingSpaceModel;

public interface ParkingSpaceModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ParkingSpaceModel record);

    int insertSelective(ParkingSpaceModel record);

    ParkingSpaceModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ParkingSpaceModel record);

    int updateByPrimaryKey(ParkingSpaceModel record);
}