package com.ld.common.dao;

import java.util.List;

import com.ld.common.model.PropertyCompanyModel;

public interface PropertyCompanyModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(PropertyCompanyModel record);

    int insertSelective(PropertyCompanyModel record);

    PropertyCompanyModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(PropertyCompanyModel record);

    int updateByPrimaryKey(PropertyCompanyModel record);

	List<PropertyCompanyModel> queryAllPropertyCompany();
}