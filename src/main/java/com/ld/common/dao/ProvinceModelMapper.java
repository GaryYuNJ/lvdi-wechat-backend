package com.ld.common.dao;

import java.util.List;

import com.ld.common.model.ProvinceModel;

public interface ProvinceModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ProvinceModel record);

    int insertSelective(ProvinceModel record);

    ProvinceModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ProvinceModel record);

    int updateByPrimaryKey(ProvinceModel record);

	List<ProvinceModel> queryAllProvince();
}