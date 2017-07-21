package com.ld.community.service;

import java.util.List;
import java.util.Map;

import com.ld.common.model.CityModel;
import com.ld.common.model.CommunityModel;
import com.ld.common.model.DistrictModel;
import com.ld.common.model.PropertyCompanyModel;
import com.ld.common.model.ProvinceModel;
import com.ld.core.mybatis.page.Pagination;

public interface CommunityService {


	Pagination<CommunityModel> findPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);

	int deleteByPrimaryKey(Long id);

	int insert(CommunityModel record);

	int insertSelective(CommunityModel record);

	CommunityModel selectByPrimaryKey(Long id);

	int updateByPrimaryKey(CommunityModel record);

	int updateByPrimaryKeySelective(CommunityModel record);

	List<ProvinceModel> queryAllProvinceInfo();

	List<CityModel> queryCityInfoByProvince(String provinceCode);

	List<DistrictModel> queryDistrictInfoBycity(String cityCode);

	List<PropertyCompanyModel> queryAllPropertyCompany();

	List<CommunityModel> queryCommunitiesByUserId(Long userId);

	Map<String, Object> deleteCommunityById(Long id);

	CommunityModel queryCommunityByCode(String communityCode);

}
