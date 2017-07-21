package com.ld.community.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.ld.common.bean.SSORequestBean;
import com.ld.common.bean.SSOResponseBean;
import com.ld.common.controller.BaseController;
import com.ld.common.model.CityModel;
import com.ld.common.model.CommunityModel;
import com.ld.common.model.DistrictModel;
import com.ld.common.model.LostInfoFormModel;
import com.ld.common.model.OwnerBasicModel;
import com.ld.common.model.OwnerCallfixFormModel;
import com.ld.common.model.PropertyCompanyModel;
import com.ld.common.model.ProvinceModel;
import com.ld.common.model.PublicInformationModel;
import com.ld.common.model.URole;
import com.ld.common.utils.LoggerUtils;
import com.ld.common.utils.SSOServiceUtil;
import com.ld.community.bean.CommonRequestParam;
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
@RequestMapping("open")
public class CommunityOpenController extends BaseController {
	
	@Autowired
	CommunityService communityService;
	
	@Autowired
	PublicInfoService publicInfoService;
	
	@Autowired
	LostInfoService lostInfoService;
	
	@Autowired
	OwnerCallFixService ownerCallfixService;
	
	@RequestMapping(value="validPubInfoListByCommunityCode",method=RequestMethod.POST)
	@ResponseBody
	public Object getValidPubInfoListByCommunityCode(CommonRequestParam commonRequestParam){
		
		String communityCode = commonRequestParam.getCommunityCode();
		
		//get communityId by code
		CommunityModel communityModel = communityService.queryCommunityByCode(communityCode);
		if(null == communityModel){
			return null;
		}
		
		Integer pageNo = commonRequestParam.getPageNo() == null ? super.pageNo : commonRequestParam.getPageNo();
		Map<String,Object> modelMap = new HashMap<String,Object>();

		modelMap.put("findContent", communityModel.getId());
		modelMap.put("status", 1);//只查有效状态的公告
		
		Pagination<PublicInformationModel> informationList = publicInfoService.findPage(modelMap,pageNo,pageSize);
		
		return null != informationList ? informationList.getList():null;
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

	@RequestMapping(value="lostInfoListByCommunityCode",method=RequestMethod.POST)
	@ResponseBody
	public Object getLostInfoListByCommunityCode(CommonRequestParam commonRequestParam){
		
		
		String communityCode = commonRequestParam.getCommunityCode();
		
		//get communityId by code
		CommunityModel communityModel = communityService.queryCommunityByCode(communityCode);
		if(null == communityModel){
			return null;
		}
		
		Integer pageNo = commonRequestParam.getPageNo() == null ? super.pageNo : commonRequestParam.getPageNo();
		Map<String,Object> modelMap = new HashMap<String,Object>();

		modelMap.put("findContent", communityModel.getId());
		
		Pagination<LostInfoFormModel> lostInformation = lostInfoService.findPage(modelMap,pageNo,pageSize);
		
		return null != lostInformation ? lostInformation.getList():null;
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
	 * 添加
	 * @param CommunityModel
	 * @return
	 */
	@RequestMapping(value="addOwnerCallfix",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addOwnerCallfix(OwnerCallfixFormModel ownerCallfixFormModel){
		try {
			
			//get communityId by code
			CommunityModel communityModel = communityService.queryCommunityByCode(ownerCallfixFormModel.getCommunityCode());
			if(null == communityModel){
				resultMap.put("status", 400);
				LoggerUtils.fmtError(getClass(), "addOwnerCallfix()  无法获取小区信息, CommunityCode:[%s]", ownerCallfixFormModel.getCommunityCode());
				return resultMap;
			}
			ownerCallfixFormModel.setCommunityId(communityModel.getId());
			
			//根据ssoTicket获取用户id
			//调用SSo接口
			//查询用户表
			try{
				String ssoTicket = ownerCallfixFormModel.getSsoTicket();
				SSORequestBean ssoRequest = new SSORequestBean();
				Map<String,Object> params = new HashMap<String,Object>();
				params.put("ticket", ssoTicket);
				ssoRequest.setParams(params);
				SSOResponseBean ssoResponse = SSOServiceUtil.getUserBasicInfo(ssoRequest);
				if(null != ssoResponse && null != ssoResponse.getData() && null != ssoResponse.getData().getCmcustid()){
					OwnerBasicModel ownerBasic = ownerCallfixService.selectByCRMCusId(ssoResponse.getData().getCmcustid());
					//ownerCallfixFormModel.setOwnerId(null == ownerBasic ? null : ownerBasic.getId());
					if(null != ownerBasic){
						ownerCallfixFormModel.setOwnerId(ownerBasic.getId());
						logger.info("成功获取本地用户ID: "+ownerBasic.getId());
					}else{
						LoggerUtils.fmtError(getClass(), "无法根据cmcustid获取本地用户信息。Cmcustid：[%s]", ssoResponse.getData().getCmcustid());
						//自动添加用户信息到本地
						ownerBasic = new OwnerBasicModel();
						ownerBasic.setCrmCusId(ssoResponse.getData().getCmcustid());
						ownerBasic.setMobile(ssoResponse.getData().getCmmobile());
						ownerBasic.setRealName(ownerCallfixFormModel.getName());
						ownerCallfixService.insertUserBasicInfo(ownerBasic);
						logger.info("添加本地用户信息成功");
						
						//重新获取本地用户主键
						ownerBasic = ownerCallfixService.selectByCRMCusId(ssoResponse.getData().getCmcustid());
						ownerCallfixFormModel.setOwnerId(ownerBasic.getId());
						logger.info("重新获取本地用户ID: "+ownerBasic.getId());
					}
				}else{
					LoggerUtils.fmtError(getClass(), "无法根据ssoticket获取用户信息。ssoTicket:[%s]", ssoTicket);
				}
			}catch(Exception e){
				logger.error("根据ssoticket获取用户信息失败", e);
			}
			
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
			LoggerUtils.fmtError(getClass(), e, "添加报修信息报错。source[%s]",ownerCallfixFormModel.toString());
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
