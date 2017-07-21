<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/common/header.jsp"%>
<%@ include file="/common/community_nav.jsp"%>
<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<h2 class="pull-left">
			<i class="icon-home"></i> 小区列表
		</h2>
		<div class="clearfix"></div>
	</div>
	<!-- Page heading ends -->

	<!-- Matter -->
	<div class="matter">
		<div class="container">
			<div class="row">
				<div class="col-md-10">
					<div class="widget">
						<form method="post" action="" id="formId" class="form-inline">
						<div class="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="输入小区名称" >
					      </div>
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
				         	
				         	<shiro:hasPermission  name="/community/addCommunity.shtml">
				         		<!-- <a class="btn btn-success" onclick="$('#addCommunity').modal();">增加小区</a> -->
				         		<a class="btn btn-success" onclick="javascript:popEmptyCommunityDetail();">增加小区</a>
				         	</shiro:hasPermission>
				         	
				         </span>    
				        </div>
					
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<th>小区名称</th>
							<th>小区编号</th>
							<th>城市</th>
							<th>操作</th>
						</tr>
						<c:if test="${page != null}">
							<c:forEach items="${page.list}" var="it">  
									<tr>
										<td>${it.name}</td>
										<td>${it.code}</td>
										<td>${it.cityCode}</td>
										<td>
											<i class="glyphicon glyphicon-plus"></i>
											<a href="javascript:popCommunityDetailById(${it.id});">详情</a>
											&nbsp&nbsp&nbsp&nbsp&nbsp
											
											<shiro:hasPermission  name="/community/deleteCommunityById.shtml">
												<i class="glyphicon glyphicon-remove"></i>
												<a href="javascript:deleteById(${it.id});">删除</a>
								         	</shiro:hasPermission>
										</td>
									</tr>
							</c:forEach>
						</c:if>
						<c:if test="${page eq null}">
							<tr>
								<td class="text-center danger" colspan="4">没有数据</td>
							</tr>
						</c:if>
					</table>
					<c:if test="${page != null}">
						<div class="pagination pull-right">
							${page.pageHtml}
						</div>
					</c:if>
					</form>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>

<shiro:hasPermission name="/community/addCommunity.shtml">
<div class="modal fade" id="addCommunity" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-dialognew">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					创建小区
				</h4>
			</div>
			 <input type="hidden" name="community_id" id="community_id">
			                
			<div class="modal-body"> 
			    <div class="form-group groupheight clearfix"> 
			    	<div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">小区名称</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="community_name" id="community_name" placeholder="输入小区名称">
			            </div>
			        </div>	
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">小区编号</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="community_code" id="community_code" placeholder="输入小区编号">
			            </div>
			        </div>	
			    </div> 
			    <div class="form-group groupheight clearfix"> 
			    	<div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7">省</label>
			            <div class="col-lg-7">
			                <select  name="province" id="province" onchange="provinceChange();" class="form-control selectfont">
			                	<option value="0">-选择省-</option>
			                </select>						        			
			            </div>
			        </div>    
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7">市</label>
			            <div class="col-lg-7">
			                <select  name="city" id="city"  onchange="cityChange();" class="form-control selectfont">
			                	<option value="0">-选择市-</option>
			                </select>						        			
			            </div>
			        </div>    
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7">区</label>
			            <div class="col-lg-7">
			                <select  name="district" id="district" class="form-control selectfont">
			                	<option value="0">-选择区/县-</option>
			                </select>						        			
			            </div>
			        </div>    
			    </div> 
			    
			    <div class="form-group groupheight clearfix">
			        <div class="col-lg-12 col-lg-4new">
			            <label class="col-lg-2 control-label pt7 col-lg-2modal">详细地址</label>
			            <div class="col-lg-10">
			                <input type="text" class="form-control form-controlbg" 
			                name="community_addr" id="community_addr"  placeholder="输入小区详细地址">
			            </div>
			        </div>	
			    </div>
			    
			    <div class="form-group groupheight clearfix">
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7">物业公司</label>
			            <div class="col-lg-7">
			                <select  name="property_company" id="property_company" class="form-control selectfont">
			                	<option value="0">-选择物业公司-</option>
			                </select>						        			
			            </div>
			        </div>
			    </div>
			    <div class="linehrmodal"></div>
			    <div class="form-group groupheight clearfix">
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7">最后更新人</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="update_user"  id="update_user"  disabled >
			            </div>
			        </div>
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7">更新时间</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="update_time"  id="update_time"   disabled>
			            </div>
			        </div>	 
			    </div>
			</div>
			<div class="modal-footer" style="text-align: center;">
				 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" onclick="addCommunity();" class="btn btn-primary">保存</button>
			</div>
			 
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div> 	

</shiro:hasPermission>
		

<%@ include file="/common/script.jsp"%>
<%@ include file="/common/footer.html"%>
<script src="<c:url value="/js/communityList.js" />"></script>
<script >
	
	 $(function(){
		   initCommunityDetailPop();
		   queryProvinceInfo();
		   queryAllPropertyCompany();
	   });
	 
	<shiro:hasPermission name="/community/deleteCommunityById.shtml">
		//--根据ID数组删除角色--
		function deleteById(id){
			var index = layer.confirm("确定删除？",function(){
				var load = layer.load();
				$.post('<c:url value="/community/deleteCommunityById.shtml" />',{id:id},function(result){
					layer.close(load);
					if(result && result.status != 200){
						return layer.msg(result.message,so.default),!0;
					}else{
						layer.msg(result.resultMsg);
						setTimeout(function(){
							$('#formId').submit();
						},1000);
					}
				},'json');
				layer.close(index);
			});
		}
	</shiro:hasPermission>
	
	<shiro:hasPermission name="/community/addCommunity.shtml">
		//--添加小区--
		function addCommunity(){
			var id = $('#community_id').val(),
				name = $('#community_name').val(),
				code = $('#community_code').val(),
				provinceCode = $('#province').val(),
				cityCode = $('#city').val(),
				districtCode = $('#district').val(),
				address = $('#community_addr').val(),
				propertyCompanyId = $('#property_company').val();
			
			if($.trim(name) == ''){
				return layer.msg('小区名称不能为空。',so.default),!1;
			}
			
			if($("#province").val() == '0'){
				return layer.msg('省不能为空。',so.default),!1;
			}
			if($("#city").val() == '0'){
				return layer.msg('城市不能为空。',so.default),!1;
			}
			if($("#district").val() == '0'){
				return layer.msg('区域不能为空。',so.default),!1;
			}
			
			//if(!/^[a-z0-9A-Z]{6}$/.test(code)){
			//	return layer.msg('角色类型为6数字字母。',so.default),!1;
			//}

			var load = layer.load();
			$.post('<c:url value="/community/addCommunity.shtml "/>',
				{
				id:id,
				name:name,
				code:code,
				provinceCode:provinceCode,
				cityCode:cityCode,
				districtCode:districtCode,
				address:address,
				propertyCompanyId:propertyCompanyId
				},
				function(result){
					layer.close(load);
					if(result && result.status != 200){
						return layer.msg(result.message,so.default),!1;
					}
					layer.msg('保存成功。');
					setTimeout(function(){
						$('#formId').submit();
					},1000);
				},'json');
		}
	</shiro:hasPermission>
		
</script>