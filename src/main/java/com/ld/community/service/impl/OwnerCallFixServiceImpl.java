package com.ld.community.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ld.common.dao.OwnerBasicModelMapper;
import com.ld.common.dao.OwnerCallfixFormModelMapper;
import com.ld.common.model.OwnerBasicModel;
import com.ld.common.model.OwnerCallfixFormModel;
import com.ld.common.utils.LoggerUtils;
import com.ld.community.service.OwnerCallFixService;
import com.ld.core.mybatis.BaseMybatisDao;
import com.ld.core.mybatis.page.Pagination;

@Service
@SuppressWarnings("unchecked")
public class OwnerCallFixServiceImpl extends BaseMybatisDao<OwnerCallfixFormModelMapper> implements OwnerCallFixService {

	@Autowired
	OwnerCallfixFormModelMapper ownerCallfixFormModelMapper;
	
	@Autowired
	OwnerBasicModelMapper ownerBasicModelMapper;
	
	@Override
	public int deleteByPrimaryKey(Long id) {
		return ownerCallfixFormModelMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(OwnerCallfixFormModel record) {
		return ownerCallfixFormModelMapper.insert(record);
	}

	@Override
	public int insertSelective(OwnerCallfixFormModel record) {
		return ownerCallfixFormModelMapper.insertSelective(record);
	}

	@Override
	public OwnerCallfixFormModel selectByPrimaryKey(Long id) {
		return ownerCallfixFormModelMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(OwnerCallfixFormModel record) {
		return ownerCallfixFormModelMapper.updateByPrimaryKey(record);
	}

	@Override
	public int updateByPrimaryKeySelective(OwnerCallfixFormModel record) {
		return ownerCallfixFormModelMapper.updateByPrimaryKeySelective(record);
	}

	
	@Override
	public Pagination<OwnerCallfixFormModel> findPage(Map<String, Object> resultMap,
			Integer pageNo, Integer pageSize) {
		return super.findPage(resultMap, pageNo, pageSize);
	}
	@Override
	public Map<String, Object> deleteOwnerCallfixById(Long id) {
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

	@Override
	public OwnerBasicModel selectByCRMCusId(String cmcustid) {
		// TODO Auto-generated method stub
		return ownerBasicModelMapper.selectByCRMCusId(cmcustid);
	}

	@Override
	public int insertUserBasicInfo(OwnerBasicModel ownerBasicModel) {
		// TODO Auto-generated method stub
		return ownerBasicModelMapper.insertSelective(ownerBasicModel);
	}
	
}
