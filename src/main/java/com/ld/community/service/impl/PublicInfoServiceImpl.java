package com.ld.community.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ld.common.dao.PublicInformationModelMapper;
import com.ld.common.model.PublicInformationModel;
import com.ld.common.utils.LoggerUtils;
import com.ld.community.service.PublicInfoService;
import com.ld.core.mybatis.BaseMybatisDao;
import com.ld.core.mybatis.page.Pagination;

@Service
@SuppressWarnings("unchecked")
public class PublicInfoServiceImpl extends BaseMybatisDao<PublicInformationModelMapper> implements PublicInfoService {

	@Autowired
	PublicInformationModelMapper publicInformationModelMapper;
	
	@Override
	public int deleteByPrimaryKey(Long id) {
		return publicInformationModelMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(PublicInformationModel record) {
		return publicInformationModelMapper.insert(record);
	}

	@Override
	public int insertSelective(PublicInformationModel record) {
		return publicInformationModelMapper.insertSelective(record);
	}

	@Override
	public PublicInformationModel selectByPrimaryKey(Long id) {
		return publicInformationModelMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(PublicInformationModel record) {
		return publicInformationModelMapper.updateByPrimaryKey(record);
	}

	@Override
	public int updateByPrimaryKeySelective(PublicInformationModel record) {
		return publicInformationModelMapper.updateByPrimaryKeySelective(record);
	}

	
	@Override
	public Pagination<PublicInformationModel> findPage(Map<String, Object> resultMap,
			Integer pageNo, Integer pageSize) {
		return super.findPage(resultMap, pageNo, pageSize);
	}
	@Override
	public Map<String, Object> deletePublicInfoById(Long id) {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try {
			String resultMsg = "删除成功。";
			this.deleteByPrimaryKey(id);
			
			resultMap.put("status", 200);
			resultMap.put("resultMsg", resultMsg);
		} catch (Exception e) {
			LoggerUtils.fmtError(getClass(), e, "根据IDS删除用户出现错误，id[%s]", id);
			resultMap.put("status", 500);
			resultMap.put("message", "删除出现错误，请刷新后再试！");
		}
		return resultMap;
	}

//	@Override
//	public Set<String> findCommunityByUserId(Long userId) {
//		return communityModelMapper.findCommunityByUserId(userId);
//	}

	
}
