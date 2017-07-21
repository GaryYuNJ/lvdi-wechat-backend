package com.ld.community.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ld.common.dao.LostInfoFormModelMapper;
import com.ld.common.model.LostInfoFormModel;
import com.ld.common.utils.LoggerUtils;
import com.ld.community.service.LostInfoService;
import com.ld.core.mybatis.BaseMybatisDao;
import com.ld.core.mybatis.page.Pagination;

@Service
@SuppressWarnings("unchecked")
public class LostInfoServiceImpl extends BaseMybatisDao<LostInfoFormModelMapper> implements LostInfoService {

	@Autowired
	LostInfoFormModelMapper lostInfoFormModelMapper;
	
	@Override
	public int deleteByPrimaryKey(Long id) {
		return lostInfoFormModelMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(LostInfoFormModel record) {
		return lostInfoFormModelMapper.insert(record);
	}

	@Override
	public int insertSelective(LostInfoFormModel record) {
		return lostInfoFormModelMapper.insertSelective(record);
	}

	@Override
	public LostInfoFormModel selectByPrimaryKey(Long id) {
		return lostInfoFormModelMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(LostInfoFormModel record) {
		return lostInfoFormModelMapper.updateByPrimaryKey(record);
	}

	@Override
	public int updateByPrimaryKeySelective(LostInfoFormModel record) {
		return lostInfoFormModelMapper.updateByPrimaryKeySelective(record);
	}

	
	@Override
	public Pagination<LostInfoFormModel> findPage(Map<String, Object> resultMap,
			Integer pageNo, Integer pageSize) {
		return super.findPage(resultMap, pageNo, pageSize);
	}
	@Override
	public Map<String, Object> deleteLostInfoById(Long id) {
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

	
}
