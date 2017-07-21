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
			<i class="icon-home"></i> 公告信息管理
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
				         	
				         	<shiro:hasPermission  name="/community/addPublicInfo.shtml">
				         		<a class="btn btn-success" onclick="javascript:popEmptyPublicInfoDetail();">创建公告信息</a>
				         	</shiro:hasPermission>
				         	
				         </span>    
				        </div>
					
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<th>公告标题</th>
							<th>发布组织</th>
							<th>状态</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
						<c:if test="${page != null}">
							<c:forEach items="${page.list}" var="it">  
									<tr>
										<td>${it.title}</td>
										<td>${it.organization}</td>
										<c:choose>
										    <c:when test="${it.status eq '0'}">
										     <td>无效</td>
										    </c:when>
										    <c:when test="${it.status eq '1'}">
										        <td>有效</td>
										    </c:when>
										</c:choose>
											
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:ss" value="${it.createTime}" /></td>
										<td>
											<i class="glyphicon glyphicon-plus"></i>
											<a href="javascript:popPublicInfoDetailById(${it.id});">详情</a>
											&nbsp&nbsp&nbsp&nbsp&nbsp
											
											<shiro:hasPermission  name="/community/deletePublicInfoById.shtml">
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

<shiro:hasPermission name="/community/addPublicInfo.shtml">
<div class="modal fade" id="addPublicInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-dialognew">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					创建公告信息
				</h4>
			</div>
			<input type="hidden" name="publicInfo_id" id="publicInfo_id">
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
			            <label class="col-lg-5 control-label pt7 ">发布组织</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="organization" id="organization" placeholder="输入发布组织">
			            </div>
			        </div>	
			    </div> 
			     <div class="form-group groupheight clearfix"> 
			    	
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">公告标题</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="title" id="title" placeholder="输入公告标题">
			            </div>
			        </div>	
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7">公告状态</label>
			            <div class="col-lg-7">
			                <select  name="selectStatus" id="selectStatus"  class="form-control selectfont">
			                	<option value="1">有效</option>
			                	<option value="0">无效</option>
			                </select>						        			
			            </div>
			        </div>  
			    </div> 
			    <div class="form-group groupheight clearfix"> 
			    	
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7 ">公告标签</label>
			            <div class="col-lg-7">
			                <input type="text" class="form-control form-controlbg" 
			                name="label" id="label" placeholder="输入公告标签">
			            </div>
			        </div>	
			        <div class="col-lg-4 col-lg-4new">
			            <label class="col-lg-5 control-label pt7">标签颜色</label>
			            <div class="col-lg-7">
			                <select  name="label_color" id="label_color"  class="form-control selectfont">
			                	<option value="1">红</option>
			                	<option value="2">绿</option>
			                	<option value="3">黄</option>
			                	<option value="4">青</option>
			                </select>						        			
			            </div>
			        </div>  
			    </div> 
			    <div class="form-group groupheight clearfix">
			        <div class="col-lg-12 col-lg-4new">
			            <label class="col-lg-2 control-label pt7 col-lg-2modal">公告内容</label>
			            <div class="col-lg-10">
			                <textarea  id="content" name="content" class="form-control form-controlbg" rows="5" placeholder="多行输入"></textarea>
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
		        <button type="button" onclick="addPublicInfo();" class="btn btn-primary">保存</button>
			</div>
			 
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div> 	

</shiro:hasPermission>
		

<%@ include file="/common/script.jsp"%>
<%@ include file="/common/footer.html"%>
<script src="<c:url value="/js/publicInfoList.js" />"></script>
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
	
	initPublicInfoModalDetail();
}

	<shiro:hasPermission name="/community/deletePublicInfoById.shtml">
		//--根据ID数组删除角色--
		function deleteById(id){
			var index = layer.confirm("确定删除？",function(){
				var load = layer.load();
				$.post('<c:url value="/community/deletePublicInfoById.shtml" />',{id:id},function(result){
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
	
	<shiro:hasPermission name="/community/addPublicInfo.shtml">
		//--添加小区--
		function addPublicInfo(){
			var id = $('#publicInfo_id').val(),
				communityId = $('#selectCommunityModal').val(),
				title = $('#title').val(),
				organization = $('#organization').val(),
				content = $('#content').val(),
				status = $('#selectStatus').val();
				label = $('#label').val();
				labelColor = $('#label_color').val();
			
			if($.trim(title) == ''){
				return layer.msg('标题不能为空。',so.default),!1;
			}
			if($.trim(content) == ''){
				return layer.msg('内容不能为空。',so.default),!1;
			}
			if($.trim(organization) == ''){
				return layer.msg('组织不能为空。',so.default),!1;
			}
			
			if($("#communityId").val() == '0'){
				return layer.msg('请先选择小区。',so.default),!1;
			}
			
			//if(!/^[a-z0-9A-Z]{6}$/.test(code)){
			//	return layer.msg('角色类型为6数字字母。',so.default),!1;
			//}

			var load = layer.load();
			$.post('<c:url value="/community/addPublicInfo.shtml "/>',
				{
				id:id,
				communityId:communityId,
				title:title,
				organization:organization,
				content:content,
				status:status,
				label:label,
				labelColor:labelColor
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