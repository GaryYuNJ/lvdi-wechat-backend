package com.ld.common.dao;

import com.ld.common.model.LostInfoFormModel;

public interface LostInfoFormModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(LostInfoFormModel record);

    int insertSelective(LostInfoFormModel record);

    LostInfoFormModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(LostInfoFormModel record);

    int updateByPrimaryKey(LostInfoFormModel record);
}