<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	<!-- Main content starts -->
		<div class="content">
			<!-- Sidebar -->
			<div class="sidebar">
				<!--- Sidebar navigation -->
				<!-- If the main navigation has sub navigation, then add the class "has_sub" to "li" of main navigation. -->
				<ul id="nav">
					<li class="has_sub">
						<a href="<c:url value="/community/communityList.shtml" />"><i class="icon-list-alt"></i> 小区列表 </a>
					</li>
					<li hidden class="has_sub">
						<a href="<c:url value="/" />"><i class="icon-list-alt"></i> 业主管理 </a>
					</li>
					<li class="has_sub">
						<a href="<c:url value="/community/publicInfoList.shtml" />"><i class="icon-list-alt"></i> 公告管理 </a>
					</li>
					<li class="has_sub">
						<a href="<c:url value="/community/ownerCallfixList.shtml" />"><i class="icon-list-alt"></i> 报修管理 </a>
					</li>
					<li class="has_sub">
						<a href="<c:url value="/community/lostInfoList.shtml" />"><i class="icon-list-alt"></i> 失物管理 </a>
					</li>
			</div>
