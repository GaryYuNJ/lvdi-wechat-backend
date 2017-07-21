package com.ld.community.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ld.common.dao.CityModelMapper;
import com.ld.common.dao.CommunityModelMapper;
import com.ld.common.dao.DistrictModelMapper;
import com.ld.common.dao.PropertyCompanyModelMapper;
import com.ld.common.dao.ProvinceModelMapper;
import com.ld.common.dao.URolePermissionMapper;
import com.ld.common.dao.UUserMapper;
import com.ld.common.model.CityModel;
import com.ld.common.model.CommunityModel;
import com.ld.common.model.DistrictModel;
import com.ld.common.model.PropertyCompanyModel;
import com.ld.common.model.ProvinceModel;
import com.ld.common.utils.LoggerUtils;
import com.ld.community.service.CommunityService;
import com.ld.core.mybatis.BaseMybatisDao;
import com.ld.core.mybatis.page.Pagination;

@Service
@SuppressWarnings("unchecked")
public class CommunityServiceImpl extends BaseMybatisDao<CommunityModelMapper> implements CommunityService {

	@Autowired
	CommunityModelMapper communityModelMapper;
	@Autowired
	UUserMapper userMapper;
	@Autowired
	URolePermissionMapper rolePermissionMapper;
	
	@Autowired
	ProvinceModelMapper provinceModelMapper;
	@Autowired
	CityModelMapper cityModelMapper;
	@Autowired
	DistrictModelMapper districtModelMapper;
	@Autowired
	PropertyCompanyModelMapper propertyCompanyModelMapper;

	@Override
	public int deleteByPrimaryKey(Long id) {
		return communityModelMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(CommunityModel record) {
		return communityModelMapper.insert(record);
	}

	@Override
	public int insertSelective(CommunityModel record) {
		return communityModelMapper.insertSelective(record);
	}

	@Override
	public CommunityModel selectByPrimaryKey(Long id) {
		return communityModelMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(CommunityModel record) {
		return communityModelMapper.updateByPrimaryKey(record);
	}

	@Override
	public int updateByPrimaryKeySelective(CommunityModel record) {
		return communityModelMapper.updateByPrimaryKeySelective(record);
	}

	
	@Override
	public Pagination<CommunityModel> findPage(Map<String, Object> resultMap,
			Integer pageNo, Integer pageSize) {
		return super.findPage(resultMap, pageNo, pageSize);
	}
	@Override
	public Map<String, Object> deleteCommunityById(Long id) {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try {
			String resultMsg = "删除成功。";

			this.deleteByPrimaryKey(id);
			
			resultMap.put("status", 200);
			resultMap.put("resultMsg", resultMsg);
		} catch (Exception e) {
			LoggerUtils.fmtError(getClass(), e, "根据IDS删除用户出现错误，id [%s]", id);
			resultMap.put("status", 500);
			resultMap.put("message", "删除出现错误，请刷新后再试！");
		}
		return resultMap;
	}

	@Override
	public List<ProvinceModel> queryAllProvinceInfo() {
		// TODO Auto-generated method stub
		return provinceModelMapper.queryAllProvince();
	}

	@Override
	public List<CityModel> queryCityInfoByProvince(String provinceCode) {
		// TODO Auto-generated method stub
		return cityModelMapper.queryCityInfoByProvince(provinceCode);
	}

	@Override
	public List<DistrictModel> queryDistrictInfoBycity(String cityCode) {
		// TODO Auto-generated method stub
		return districtModelMapper.queryDistrictInfoBycity(cityCode);
	}

	@Override
	public List<PropertyCompanyModel> queryAllPropertyCompany() {
		// TODO Auto-generated method stub
		return propertyCompanyModelMapper.queryAllPropertyCompany();
	}

	@Override
	public List<CommunityModel> queryCommunitiesByUserId(Long userId) {
		// TODO Auto-generated method stub
		return communityModelMapper.selectByRelatedUserId(userId);
	}

	@Override
	public CommunityModel queryCommunityByCode(String communityCode) {
		// TODO Auto-generated method stub
		return communityModelMapper.selectCommunityIdByCode(communityCode);
	}

//	@Override
//	public Set<String> findCommunityByUserId(Long userId) {
//		return communityModelMapper.findCommunityByUserId(userId);
//	}

	
}
