package com.ld.common.dao;

import com.ld.common.model.OwnerCallfixFormModel;

public interface OwnerCallfixFormModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(OwnerCallfixFormModel record);

    int insertSelective(OwnerCallfixFormModel record);

    OwnerCallfixFormModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OwnerCallfixFormModel record);

    int updateByPrimaryKey(OwnerCallfixFormModel record);
}