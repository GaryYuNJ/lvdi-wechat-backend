package com.ld.community.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.ld.common.controller.BaseController;
import com.ld.common.model.CityModel;
import com.ld.common.model.CommunityModel;
import com.ld.common.model.DistrictModel;
import com.ld.common.model.LostInfoFormModel;
import com.ld.common.model.OwnerCallfixFormModel;
import com.ld.common.model.PropertyCompanyModel;
import com.ld.common.model.ProvinceModel;
import com.ld.common.model.PublicInformationModel;
import com.ld.common.model.URole;
import com.ld.common.utils.LoggerUtils;
import com.ld.community.service.CommunityService;
import com.ld.community.service.LostInfoService;
import com.ld.community.service.OwnerCallFixService;
import com.ld.community.service.PublicInfoService;
import com.ld.core.mybatis.page.Pagination;
import com.ld.core.shiro.token.manager.TokenManager;
import com.ld.permission.service.RoleService;
import com.ld.user.manager.UserManager;
/**
 * 
 * 
 * @version 1.0 <br/>
 * 
 */
@Controller
@Scope(value="prototype")
@RequestMapping("community")
public class CommunityController extends BaseController {
	@Autowired
	CommunityService communityService;
	
	@Autowired
	PublicInfoService publicInfoService;
	
	@Autowired
	LostInfoService lostInfoService;
	
	@Autowired
	OwnerCallFixService ownerCallfixService;
	/**
	 * 小区列表
	 * @return
	 */
	@RequestMapping(value="communityList")
	public ModelAndView getCommunityList(String findContent,ModelMap modelMap){
		modelMap.put("findContent", findContent);
		Pagination<CommunityModel> community = communityService.findPage(modelMap,pageNo,pageSize);
		modelMap.put("pageIndex", 0);
		return new ModelAndView("community/communityList","page",community);
	}
	
	/**
	 * 角色添加
	 * @param role
	 * @return
	 */
	@RequestMapping(value="getCommunityDetailById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getCommunityDetailById(Long communityId){
		try {
			CommunityModel communityModel = communityService.selectByPrimaryKey(communityId);
			resultMap.put("status", 200);
			resultMap.put("model", communityModel);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "getCommunityDetailById 报错。source[%s]",communityId);
		}
		return resultMap;
	}
	
	/**
	 * 添加
	 * @param CommunityModel
	 * @return
	 */
	@RequestMapping(value="addCommunity",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addCommunity(CommunityModel communityModel){
		try {
			
			if(null == communityService.selectByPrimaryKey(communityModel.getId()))
			{
				int count = communityService.insertSelective(communityModel);
				communityModel.setCreateTime(new Date());
				communityModel.setUpdateTime(new Date());
				communityModel.setUpdateUser(TokenManager.getUserId());
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			}else{
				int count = communityService.updateByPrimaryKeySelective(communityModel);
				communityModel.setUpdateTime(new Date());
				communityModel.setUpdateUser(TokenManager.getUserId());
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			}
			
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "添加失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "添加小区报错。source[%s]",communityModel.toString());
		}
		return resultMap;
	}
	
	/**
	 * 更新
	 * @param CommunityModel
	 * @return
	 */
	@RequestMapping(value="updateCommunity",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateCommunity(CommunityModel communityModel){
		try {
			int count = communityService.updateByPrimaryKeySelective(communityModel);
			resultMap.put("status", 200);
			resultMap.put("successCount", count);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "更新失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "更新小区报错。source[%s]",communityModel.toString());
		}
		return resultMap;
	}
	
	/**
	 * 删除，根据ID，
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteCommunityById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteCommunityById(Long id){
		return communityService.deleteCommunityById(id);
	}
	
	/**
	 * 更新
	 * @param CommunityModel
	 * @return
	 */
	@RequestMapping(value="queryAllProvinceInfo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> queryAllProvinceInfo(){
		try {
			List<ProvinceModel> provinceModels = communityService.queryAllProvinceInfo();
			resultMap.put("data", provinceModels);
			resultMap.put("status", 0);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "更新失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "获取省数据报错");
		}
		return resultMap;
	}
	
	/**
	 * 更新
	 * @param CommunityModel
	 * @return
	 */
	@RequestMapping(value="queryCityInfoByProvince",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> queryCityInfoByProvince(String provinceCode){
		try {
			List<CityModel> cityModels = communityService.queryCityInfoByProvince(provinceCode);
			resultMap.put("data", cityModels);
			resultMap.put("status", 0);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "更新失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "获取省数据报错");
		}
		return resultMap;
	}
	
	/**
	 * 查询
	 * @param District
	 * @return
	 */
	@RequestMapping(value="queryDistrictInfoByCity",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> queryDistrictInfoByCity(String cityCode){
		try {
			List<DistrictModel> districtModels = communityService.queryDistrictInfoBycity(cityCode);
			resultMap.put("data", districtModels);
			resultMap.put("status", 0);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "更新失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "获取省数据报错");
		}
		return resultMap;
	}
	
	@RequestMapping(value="queryAllPropertyCompany",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> queryAllPropertyCompany(){
		try {
			List<PropertyCompanyModel> propertyCompanies = communityService.queryAllPropertyCompany();
			resultMap.put("data", propertyCompanies);
			resultMap.put("status", 0);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "更新失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "获取省数据报错");
		}
		return resultMap;
	}
	
	@RequestMapping(value="publicInfoList")
	public ModelAndView getPublicInfoList(Long communityId, Integer pageNo, ModelMap modelMap){
		//获取用户有关系的小区
		Long userId = TokenManager.getUserId();
		List<CommunityModel> communities = communityService.queryCommunitiesByUserId(userId); 
		
		modelMap.put("communityModels", JSON.toJSONString(communities));
		
		if(null == communities || communities.size() ==0){
			communityId = 0L;
		}else if(null == communityId){
			communityId = communities.get(0).getId();
		}
		
		//如果入参 communityId为空，取有关系小区第一个值；
		modelMap.put("findContent", communityId);
		if(null == pageNo || pageNo == 0){
			pageNo = 1;
		}
		
		Pagination<PublicInformationModel> publicInformation = publicInfoService.findPage(modelMap,pageNo,pageSize);
		
		modelMap.put("pageIndex", 2);
		return new ModelAndView("community/publicInfoList","page",publicInformation);
	}
	
	
	/**
	 * 添加
	 * @param CommunityModel
	 * @return
	 */
	@RequestMapping(value="addPublicInfo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addPublicInfo(PublicInformationModel publicInformationModel){
		try {
			
			if(null == publicInfoService.selectByPrimaryKey(publicInformationModel.getId()))
			{
				publicInformationModel.setCreateTime(new Date());
				publicInformationModel.setUpdateTime(new Date());
				publicInformationModel.setProcessUser(TokenManager.getUserId());
				int count = publicInfoService.insertSelective(publicInformationModel);
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			}else{
				
				publicInformationModel.setUpdateTime(new Date());
				publicInformationModel.setProcessUser(TokenManager.getUserId());
				int count = publicInfoService.updateByPrimaryKeySelective(publicInformationModel);
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			}
			
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "添加失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "添加小区报错。source[%s]",publicInformationModel.toString());
		}
		return resultMap;
	}
	

	/**
	 * 角色添加
	 * @param role
	 * @return
	 */
	@RequestMapping(value="getPublicInfoDetailById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getPublicInfoDetailById(Long publicInfoId){
		try {
			PublicInformationModel publicInfoModel = publicInfoService.selectByPrimaryKey(publicInfoId);
			resultMap.put("status", 200);
			resultMap.put("model", publicInfoModel);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "getCommunityDetailById 报错。source[%s]",publicInfoId);
		}
		return resultMap;
	}

	/**
	 * 删除，根据ID，
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deletePublicInfoById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deletePublicInfoById(Long id){
		return publicInfoService.deletePublicInfoById(id);
	}
	

	@RequestMapping(value="lostInfoList")
	public ModelAndView getLostInfoList(Long communityId, Integer pageNo, ModelMap modelMap){
		//获取用户有关系的小区
		Long userId = TokenManager.getUserId();
		List<CommunityModel> communities = communityService.queryCommunitiesByUserId(userId); 
		
		modelMap.put("communityModels", JSON.toJSONString(communities));
		
		if(null == communities || communities.size() ==0){
			communityId = 0L;
		}else if(null == communityId){
			communityId = communities.get(0).getId();
		}
		
		//如果入参 communityId为空，取有关系小区第一个值；
		modelMap.put("findContent", communityId);
		if(null == pageNo || pageNo == 0){
			pageNo = 1;
		}
		
		//如果入参 communityId为空，取有关系小区第一个值；
		modelMap.put("findContent", communityId);
		Pagination<LostInfoFormModel> lostInformation = lostInfoService.findPage(modelMap,pageNo,pageSize);
		
		modelMap.put("pageIndex", 4);
		return new ModelAndView("community/lostInfoList","page",lostInformation);
	}
	
	
	/**
	 * 添加
	 * @param CommunityModel
	 * @return
	 */
	@RequestMapping(value="addLostInfo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addLostInfo(LostInfoFormModel lostInformationModel){
		try {
			
			if(StringUtils.isNotEmpty(lostInformationModel.getPickupTimeStr())){
				 SimpleDateFormat myFmt=new SimpleDateFormat("yy-MM-dd");        
				 lostInformationModel.setTime(myFmt.parse(lostInformationModel.getPickupTimeStr()));
			}
			
			if(null == lostInfoService.selectByPrimaryKey(lostInformationModel.getId()))
			{
				
				lostInformationModel.setCreateTime(new Date());
				lostInformationModel.setUpdateTime(new Date());
				lostInformationModel.setProcessUser(TokenManager.getUserId());
				int count = lostInfoService.insertSelective(lostInformationModel);
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			}else{
				
				lostInformationModel.setUpdateTime(new Date());
				lostInformationModel.setProcessUser(TokenManager.getUserId());
				int count = lostInfoService.updateByPrimaryKeySelective(lostInformationModel);
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			}
			
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "添加失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "添加小区报错。source[%s]",lostInformationModel.toString());
		}
		return resultMap;
	}
	

	/**
	 * 角色添加
	 * @param role
	 * @return
	 */
	@RequestMapping(value="getLostInfoDetailById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getLostInfoDetailById(Long lostInfoId){
		try {
			LostInfoFormModel lostInfoModel = lostInfoService.selectByPrimaryKey(lostInfoId);
			resultMap.put("status", 200);
			resultMap.put("model", lostInfoModel);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "getCommunityDetailById 报错。source[%s]",lostInfoId);
		}
		return resultMap;
	}

	/**
	 * 删除，根据ID，
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteLostInfoById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteLostInfoById(Long id){
		return lostInfoService.deleteLostInfoById(id);
	}
	
	
	@RequestMapping(value="ownerCallfixList")
	public ModelAndView getOwnerCallfixList(Long communityId, Integer pageNo, ModelMap modelMap){
		//获取用户有关系的小区
		Long userId = TokenManager.getUserId();
		List<CommunityModel> communities = communityService.queryCommunitiesByUserId(userId); 
		
		modelMap.put("communityModels", JSON.toJSONString(communities));
		
		if(null == communities || communities.size() ==0){
			communityId = 0L;
		}else if(null == communityId){
			communityId = communities.get(0).getId();
		}
		
		
		//如果入参 communityId为空，取有关系小区第一个值；
		modelMap.put("findContent", communityId);
		if(null == pageNo || pageNo == 0){
			pageNo = 1;
		}
		//如果入参 communityId为空，取有关系小区第一个值；
		modelMap.put("findContent", communityId);
		Pagination<OwnerCallfixFormModel> ownerCallfixrmation = ownerCallfixService.findPage(modelMap,pageNo,pageSize);
		
		modelMap.put("pageIndex", 3);
		return new ModelAndView("community/ownerCallfixList","page",ownerCallfixrmation);
	}
	
	
	/**
	 * 添加
	 * @param CommunityModel
	 * @return
	 */
	@RequestMapping(value="addOwnerCallfix",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addOwnerCallfix(OwnerCallfixFormModel ownerCallfixFormModel){
		try {
			
			if(null == ownerCallfixService.selectByPrimaryKey(ownerCallfixFormModel.getId()))
			{
				ownerCallfixFormModel.setCreateTime(new Date());
				ownerCallfixFormModel.setUpdateTime(new Date());
				ownerCallfixFormModel.setProcessUser(TokenManager.getUserId());
				int count = ownerCallfixService.insertSelective(ownerCallfixFormModel);
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			}else{
				ownerCallfixFormModel.setUpdateTime(new Date());
				ownerCallfixFormModel.setProcessUser(TokenManager.getUserId());
				int count = ownerCallfixService.updateByPrimaryKeySelective(ownerCallfixFormModel);
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			}
			
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "添加失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "添加小区报错。source[%s]",ownerCallfixFormModel.toString());
		}
		return resultMap;
	}
	

	/**
	 * 角色添加
	 * @param role
	 * @return
	 */
	@RequestMapping(value="getOwnerCallfixDetailById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getOwnerCallfixDetailById(Long ownerCallfixId){
		try {
			OwnerCallfixFormModel ownerCallfixModel = ownerCallfixService.selectByPrimaryKey(ownerCallfixId);
			resultMap.put("status", 200);
			resultMap.put("model", ownerCallfixModel);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "getCommunityDetailById 报错。source[%s]",ownerCallfixId);
		}
		return resultMap;
	}

	/**
	 * 删除，根据ID，
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteOwnerCallfixById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteOwnerCallfixById(Long id){
		return ownerCallfixService.deleteOwnerCallfixById(id);
	}
	
}
