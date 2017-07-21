package com.ld.community.service;

import java.util.Map;

import com.ld.common.model.OwnerBasicModel;
import com.ld.common.model.OwnerCallfixFormModel;
import com.ld.core.mybatis.page.Pagination;

public interface OwnerCallFixService {


	Pagination<OwnerCallfixFormModel> findPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);

	int deleteByPrimaryKey(Long id);

	int insert(OwnerCallfixFormModel record);

	int insertSelective(OwnerCallfixFormModel record);

	OwnerCallfixFormModel selectByPrimaryKey(Long id);

	int updateByPrimaryKey(OwnerCallfixFormModel record);

	int updateByPrimaryKeySelective(OwnerCallfixFormModel record);

	Map<String, Object> deleteOwnerCallfixById(Long id);

	OwnerBasicModel selectByCRMCusId(String cmcustid);

	int insertUserBasicInfo(OwnerBasicModel ownerBasicModel);

}
