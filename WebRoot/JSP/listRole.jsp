<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="debugFile.inc" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!-- PAGE TITLE & BREADCRUMB-->
<div class="row-fluid">
	<h3 class="page-title">用户管理</h3>
	<ul class="breadcrumb">
		<li><i class="icon-home"></i> <a class="ajaxify" href="index.jsp">主页</a> <i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">模块管理</a> <i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">角色管理</a><i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">用户管理</a></li>
	</ul>
</div>

<div class="row-fluid">
	<form id="form" action="UserAction!distributeRoleToUser">
		<table>
			<div class="row-fluid">
				给用户分配角色
			</div>
			<div class="row-fluid">
				<div class="row-fluid" style="text-align: center;font-size:20px;background-color:#EEEEEE">
						请选择分配给用户的角色
				</div>
				<table class="table table-striped">
					<thead>
						<tr></tr>
					</thead>
					<tbody>
						<td>角色名称</td>
						<input type="hidden" name="user.id" value="${userid}"/>
						<td><select name="role.name">
								<s:iterator value="#request.roles" var="role">
									<option>${role.name}</option>
								</s:iterator>
							</select>
						</td>
						<td>
							<input class="btn" type="button" id="submit"  value="提交" />
						</td>
					</tbody>
				</table>
			</div>
		</table>
	</form>
</div>
<script>
$("#submit").click(function(e) {
	$.ajax({
		url: $('#form').attr('action'),
		data: $('#form').serialize(),
		success: function(data) {
 			e.preventDefault();
			pageContent = $('.page-content .page-content-body');
			$.ajax({
			url: data, 
			success: function(res) {
	        	pageContent.html(res);
			}
		});
		}
	});
});
</script>