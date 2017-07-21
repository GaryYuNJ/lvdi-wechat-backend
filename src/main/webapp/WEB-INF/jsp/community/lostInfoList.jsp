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
			<i class="icon-home"></i> 失物信息管理
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
					      	<select  name="communityId" id="communityId" onchange="communityChange();" class="form-control selectfont">
			                	<option value="0">-选择小区-</option>
			                </select>	
					      </div>
					     <span class=""> 
				         	
				         	<shiro:hasPermission  name="/community/addLostInfo.shtml">
				         		<a class="btn btn-success" onclick="javascript:popEmptyLostInfoDetail();">创建失物信息</a>
				         	</shiro:hasPermission>
				         	
				         </span>    
				        </div>
					
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<th>失物名称</th>
							<th>拾获地点</th>
							<th>状态</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
						<c:if test="${page != null}">
							<c:forEach items="${page.list}" var="it">  
									<tr>
										<td>${it.objectName}</td>
										<td>${it.pickupLocation}</td>
										
										<c:choose>
										    <c:when test="${it.status eq '0'}">
										     <td>未认领</td>
										    </c:when>
										    <c:when test="${it.status eq '1'}">
										        <td>已认领</td>
										    </c:when>
										</c:choose>
										
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:ss" value="${it.createTime}" /></td>
										<td>
											
											<i class="glyphicon glyphicon-plus"></i>
											<a href="javascript:popLostInfoDetailById(${it.id});">详情</a>
											&nbsp&nbsp&nbsp&nbsp&nbsp
											
											<shiro:hasPermission  name="/community/deleteLostInfoById.shtml">
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

<shiro:hasPermission name="/community/addLostInfo.shtml">
<div class="modal fade" id="addLostInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-dialognew">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					创建失物信息
				</h4>
			</div>
			<input type="hidden" name="lostInfo_id" id="lostInfo_id">
			<div class="modal-body"> 
			    <div class="form-group groupheight clearfix"> 
			    	<div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">小区名称</label>
			            <div class="col-lg-7">
			               <select  name="selectCommunityModal" id="selectCommunityModal" class="form-control selectfont">
			                	<option value="0">-选择小区-</option>
			                </select>	
			            </div>
			        </div>	
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">失物名称</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="object_name" id="object_name" placeholder="输入失物标题">
			            </div>
			        </div>	
			        
			    </div> 
			     <div class="form-group groupheight clearfix"> 
			    	
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">拾获人名字</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="pickup_user_name" id="pickup_user_name" placeholder="输入拾获人名字">
			            </div>
			        </div>	
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">拾获时间</label>
			            <div class="col-lg-7">
							 <input type="text"  class="form-control form-controlbg" 
							 id="datepicker" name="datepicker" data-date-format="yyyy-mm-dd hh:ii">
			            </div>
			        </div>	 
			    </div> 
			    
			    <div class="form-group groupheight clearfix">
			        <div class="col-lg-12 col-lg-4new">
			            <label class="col-lg-2 control-label pt7 col-lg-2modal">拾获地点</label>
			            <div class="col-lg-10">
			                <input type="text" class="form-control form-controlbg" 
			                name="pickup_location" id="pickup_location" placeholder="输入拾获地点">
			            </div>
			        </div>  
			    </div>	
			    
			    <div class="form-group groupheight clearfix">
			        <div class="col-lg-12 col-lg-4new">
			            <label class="col-lg-2 control-label pt7 col-lg-2modal">失物描述</label>
			            <div class="col-lg-10">
			                <textarea  id="desc" name="desc" class="form-control form-controlbg" rows="2" placeholder="多行输入"></textarea>
			            </div>
			        </div>  
			    </div>	
			    
			    <div class="linehrmodal"></div>
			    
			    <div class="form-group groupheight clearfix"> 
			    	
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">联系电话</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="mobile" id="mobile" placeholder="输入联系电话">
			            </div>
			        </div>	
			    </div> 
			    <div class="form-group groupheight clearfix">
			        <div class="col-lg-12 col-lg-4new">
			            <label class="col-lg-2 control-label pt7 col-lg-2modal">索取地点</label>
			            <div class="col-lg-10">
			                <input type="text" class="form-control form-controlbg" 
			                name="claim_location" id="claim_location" placeholder="输入拾获地点">
			            </div>
			        </div>  
			    </div>	
			     <div class="form-group groupheight clearfix"> 
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7">认领状态</label>
			            <div class="col-lg-7">
			                <select  name="selectStatus" id="selectStatus"  class="form-control selectfont">
			                	<option value="0">未认领</option>
			                	<option value="1">已认领</option>
			                </select>						        			
			            </div>
			        </div>  
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">认领人</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="lost_user_name" id="lost_user_name" placeholder="输入认领人名">
			            </div>
			        </div>	
			    </div> 
			    
			    <div class="form-group groupheight clearfix"> 
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">认领人手机号</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="lost_user_mobile" id="lost_user_mobile" placeholder="输入认领人手机号">
			            </div>
			        </div>	
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">认领人身份证号</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="lost_user_id" id="lost_user_id" placeholder="认领人身份证号">
			            </div>
			        </div>	
			    </div> 
				
			    <div class="linehrmodal"></div>
			    <div class="form-group groupheight clearfix">
			        <div class="col-lg-12 col-lg-4new">
			            <label class="col-lg-2 control-label pt7 col-lg-2modal">处理记录</label>
			            <div class="col-lg-10">
			                <textarea  id="remark" name="remark" class="form-control form-controlbg" rows="2" placeholder="多行输入"></textarea>
			            </div>
			        </div>  
			    </div>	
			    <div class="form-group groupheight clearfix">
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7">处理人</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="process_user"  id="process_user"  disabled >
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
		        <button type="button" onclick="addLostInfo();" class="btn btn-primary">保存</button>
			</div>
			 
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div> 	

</shiro:hasPermission>
		

<%@ include file="/common/script.jsp"%>
<%@ include file="/common/footer.html"%>
<script src="<c:url value="/js/lostInfoList.js" />"></script>
<script >
	
function initCommunitySelectList() {
	
   var communityModels = $.parseJSON( '${communityModels}' );
   var html =[];
	$.each(communityModels, function(){
		html.push('<option value="'+this.id+'">'+this.name+'</option>');
	});
	
	$("#communityId").html('<option value="0">-选择小区-</option>' + html.join(""));
	$("#communityId").val('${findContent}');
	
	$("#selectCommunityModal").html(html.join(""));
	$("#selectCommunityModal").val('${findContent}');
	
	initLostInfoModalDetail();
}

	<shiro:hasPermission name="/community/deleteLostInfoById.shtml">
		//--根据ID数组删除角色--
		function deleteById(id){
			var index = layer.confirm("确定删除？",function(){
				var load = layer.load();
				$.post('<c:url value="/community/deleteLostInfoById.shtml" />',{id:id},function(result){
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
	
	<shiro:hasPermission name="/community/addLostInfo.shtml">
		//--添加小区--
		function addLostInfo(){
			var id = $('#lostInfo_id').val(),
				communityId = $('#selectCommunityModal').val(),
				objectName = $('#object_name').val(),
				pickupUserName = $('#pickup_user_name').val(),
				//pickupTime = $('#datepicker').datepicker("getDate"),
				pickupTime = $('#datepicker').val(),
				pickupLocation = $('#pickup_location').val(),
				desc = $('#desc').val(),
				mobile = $('#mobile').val(),
				claimLocation = $('#claim_location').val(),
				status = $('#selectStatus').val(),
				lostUserName = $('#lost_user_name').val(),
				lostUserMobile = $('#lost_user_mobile').val(),
				lostUserId = $('#lost_user_id').val(),
				remark = $('#remark').val();
			
			if($.trim(objectName) == ''){
				return layer.msg('失物名称不能为空。',so.default),!1;
			}
			if($.trim(mobile) == ''){
				return layer.msg('联系电话不能为空。',so.default),!1;
			}
			if($.trim(claimLocation) == ''){
				return layer.msg('索取地址不能为空。',so.default),!1;
			}
			
			if($("#communityId").val() == '0'){
				return layer.msg('请先选择小区。',so.default),!1;
			}
			
			var load = layer.load();
			$.post('<c:url value="/community/addLostInfo.shtml "/>',
				{
				id:id,
				communityId:communityId,
				objectName:objectName,
				pickupUserName:pickupUserName,
				pickupTimeStr:pickupTime,
				pickupLocation:pickupLocation,
				desc:desc,
				mobile:mobile,
				claimLocation:claimLocation,
				status:status,
				lostUserName:lostUserName,
				lostUserMobile:lostUserMobile,
				lostUserId:lostUserId,
				remark:remark
				},
				function(result){
					if(result.status == '200'){
						layer.close(load);
						if(result && result.status != 200){
							return layer.msg(result.message,so.default),!1;
						}
						layer.msg('保存成功。');
						setTimeout(function(){
							$('#formId').submit();
						},1000);
					}else{
						layer.msg('保存失败，服务器异常。');
					}
					
				},'json');
		}
	</shiro:hasPermission>
		
</script>