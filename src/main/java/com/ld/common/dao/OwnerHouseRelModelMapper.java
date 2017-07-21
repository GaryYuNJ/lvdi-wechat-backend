package com.ld.common.dao;

import com.ld.common.model.OwnerHouseRelModel;

public interface OwnerHouseRelModelMapper {
    int insert(OwnerHouseRelModel record);

    int insertSelective(OwnerHouseRelModel record);
}