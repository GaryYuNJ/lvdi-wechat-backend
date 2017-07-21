package com.ld.common.dao;

import java.util.List;

import com.ld.common.model.CityModel;

public interface CityModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(CityModel record);

    int insertSelective(CityModel record);

    CityModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(CityModel record);

    int updateByPrimaryKey(CityModel record);

	List<CityModel> queryCityInfoByProvince(String provinceCode);
}