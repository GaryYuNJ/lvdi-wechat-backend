package com.ld.common.dao;

import com.ld.common.model.PublicInformationModel;

public interface PublicInformationModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(PublicInformationModel record);

    int insertSelective(PublicInformationModel record);

    PublicInformationModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(PublicInformationModel record);

    int updateByPrimaryKey(PublicInformationModel record);
}