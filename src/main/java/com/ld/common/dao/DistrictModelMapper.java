package com.ld.common.dao;

import java.util.List;

import com.ld.common.model.DistrictModel;

public interface DistrictModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DistrictModel record);

    int insertSelective(DistrictModel record);

    DistrictModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(DistrictModel record);

    int updateByPrimaryKey(DistrictModel record);

	List<DistrictModel> queryDistrictInfoBycity(String cityCode);
}