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
			<i class="icon-home"></i> 报修信息管理
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
				         	
				         	<shiro:hasPermission  name="/community/addOwnerCallfix.shtml">
				         		<a class="btn btn-success" onclick="javascript:popEmptyOwnerCallfixDetail();">创建报修信息</a>
				         	</shiro:hasPermission>
				         	
				         </span>    
				        </div>
					
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<th>报修物品</th>
							<th>报修人</th>
							<th>状态</th>
							<th>报修时间</th>
							<th>操作</th>
						</tr>
						<c:if test="${page != null}">
							<c:forEach items="${page.list}" var="it">  
									<tr>
										<td>${it.object}</td>
										<td>${it.name}</td>
										
										<c:choose>
										    <c:when test="${it.status eq '0'}">
										     <td>未处理</td>
										    </c:when>
										    <c:when test="${it.status eq '1'}">
										        <td>正在处理</td>
										    </c:when>
										    <c:when test="${it.status eq '2'}">
										        <td>处理完成</td>
										    </c:when>
										</c:choose>
										
										<td> <fmt:formatDate pattern="yyyy-MM-dd HH:ss" value="${it.createTime}" /></td>
										<td>
											<i class="glyphicon glyphicon-plus"></i>
											<a href="javascript:popOwnerCallfixDetailById(${it.id});">详情</a>
											&nbsp&nbsp&nbsp&nbsp&nbsp
											
											<shiro:hasPermission  name="/community/deleteOwnerCallfixById.shtml">
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

<shiro:hasPermission name="/community/addOwnerCallfix.shtml">
<div class="modal fade" id="addOwnerCallfix" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-dialognew">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					创建报修信息
				</h4>
			</div>
			<input type="hidden" name="ownerCallfix_id" id="ownerCallfix_id">
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
			            <label class="col-lg-5 control-label pt7 ">报修物品</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="object" id="object" placeholder="输入报修物品名">
			            </div>
			        </div>	
			        
			    </div> 
			     <div class="form-group groupheight clearfix"> 
			    	
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">报修人名</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="name" id="name" placeholder="报修人信息" disabled>
			            </div>
			        </div>	
			        
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">联系电话</label>
			            <div class="col-lg-7">
							 <input type="text"  class="form-control form-controlbg" 
							 id="mobile" name="mobile" >
			            </div>
			        </div>	 
			    </div> 
			    
			    <div class="form-group groupheight clearfix">
			        <div class="col-lg-12 col-lg-4new">
			            <label class="col-lg-2 control-label pt7 col-lg-2modal">报修描述</label>
			            <div class="col-lg-10">
			                <textarea  id="callfix_desc" name="callfix_desc" class="form-control form-controlbg" rows="2" placeholder="多行输入"></textarea>
			            </div>
			        </div>  
			    </div>	
			    
			     <div class="form-group groupheight clearfix"> 
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7">报修状态</label>
			            <div class="col-lg-7">
			                <select  name="status" id="status"  class="form-control selectfont">
			                	<option value="0">未处理</option>
			                	<option value="1">正在处理</option>
			                	<option value="2">处理完成</option>
			                </select>						        			
			            </div>
			        </div>  
			    </div> 
			    
			    <div class="form-group groupheight clearfix"> 
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">负责人人姓名</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="responsible_person" id="responsible_person" placeholder="输入处理人姓名">
			            </div>
			        </div>	
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">负责人联系号码</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="responsible_person_mobile" id="responsible_person_mobile" placeholder="处理人联系号码">
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
		        <button type="button" onclick="addOwnerCallfix();" class="btn btn-primary">保存</button>
			</div>
			 
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div> 	

</shiro:hasPermission>
		

<%@ include file="/common/script.jsp"%>
<%@ include file="/common/footer.html"%>
<script src="<c:url value="/js/ownerCallfixList.js" />"></script>
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
	
	initOwnerCallfixModalDetail();
}

	<shiro:hasPermission name="/community/deleteOwnerCallfixById.shtml">
		//--根据ID数组删除角色--
		function deleteById(id){
			var index = layer.confirm("确定删除？",function(){
				var load = layer.load();
				$.post('<c:url value="/community/deleteOwnerCallfixById.shtml" />',{id:id},function(result){
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
	
	<shiro:hasPermission name="/community/addOwnerCallfix.shtml">
		//--添加小区--
		function addOwnerCallfix(){
			var id = $('#ownerCallfix_id').val(),
				communityId = $('#selectCommunityModal').val(),
				name = $('#name').val(),
				organization = $('#organization').val(),
				object = $('#object').val(),
				mobile = $('#mobile').val(),
				callfixDesc = $('#callfix_desc').val(),
				status = $('#status').val(),
				responsiblePerson = $('#responsible_person').val(),
				responsiblePersonMobile = $('#responsible_person_mobile').val(),
				remark = $('#remark').val();
			
			if($.trim(ownerId) == ''){
				return layer.msg('报修人ID不能为空。',so.default),!1;
			}
			if($.trim(mobile) == ''){
				return layer.msg('联系电话不能为空。',so.default),!1;
			}
			if($.trim(object) == ''){
				return layer.msg('报修物品不能为空。',so.default),!1;
			}
			
			if($("#communityId").val() == '0'){
				return layer.msg('请先选择小区。',so.default),!1;
			}
			
			var load = layer.load();
			$.post('<c:url value="/community/addOwnerCallfix.shtml "/>',
				{
				id:id,
				communityId:communityId,
				objectName:objectName,
				pickupUserName:pickupUserName,
				pickupTime:pickupTime,
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