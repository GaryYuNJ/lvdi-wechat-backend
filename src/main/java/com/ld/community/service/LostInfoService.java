package com.ld.community.service;

import java.util.List;
import java.util.Map;

import com.ld.common.model.CityModel;
import com.ld.common.model.LostInfoFormModel;
import com.ld.common.model.DistrictModel;
import com.ld.common.model.PropertyCompanyModel;
import com.ld.common.model.ProvinceModel;
import com.ld.core.mybatis.page.Pagination;

public interface LostInfoService {


	Pagination<LostInfoFormModel> findPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);

	int deleteByPrimaryKey(Long id);

	int insert(LostInfoFormModel record);

	int insertSelective(LostInfoFormModel record);

	LostInfoFormModel selectByPrimaryKey(Long id);

	int updateByPrimaryKey(LostInfoFormModel record);

	int updateByPrimaryKeySelective(LostInfoFormModel record);

	Map<String, Object> deleteLostInfoById(Long id);

}
