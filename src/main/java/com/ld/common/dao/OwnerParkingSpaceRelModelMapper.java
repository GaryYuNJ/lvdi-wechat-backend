package com.ld.common.dao;

import com.ld.common.model.OwnerParkingSpaceRelModel;

public interface OwnerParkingSpaceRelModelMapper {
    int insert(OwnerParkingSpaceRelModel record);

    int insertSelective(OwnerParkingSpaceRelModel record);
}