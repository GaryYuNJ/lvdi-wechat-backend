package com.ld.community.service;

import java.util.List;
import java.util.Map;

import com.ld.common.model.CityModel;
import com.ld.common.model.PublicInformationModel;
import com.ld.common.model.DistrictModel;
import com.ld.common.model.PropertyCompanyModel;
import com.ld.common.model.ProvinceModel;
import com.ld.core.mybatis.page.Pagination;

public interface PublicInfoService {


	Pagination<PublicInformationModel> findPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);

	int deleteByPrimaryKey(Long id);

	int insert(PublicInformationModel record);

	int insertSelective(PublicInformationModel record);

	PublicInformationModel selectByPrimaryKey(Long id);

	int updateByPrimaryKey(PublicInformationModel record);

	int updateByPrimaryKeySelective(PublicInformationModel record);

	Map<String, Object> deletePublicInfoById(Long id);

}
