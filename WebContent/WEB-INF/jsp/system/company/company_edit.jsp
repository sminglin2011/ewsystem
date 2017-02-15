<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" ng-app="app">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container" ng-controller="myCtrl">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="company/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="COMPANY_ID" id="COMPANY_ID" value="${pd.COMPANY_ID}" ng-model="model.COMPANY_ID"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Company Name:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255"  ng-model="model.NAME"
								<c:if test="${null != pd.COMPANY_ID}">readonly="readonly"</c:if>
								placeholder="这里输入Company Name" title="Company Name" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Company Code:</td>
								<td><input type="text" name="COMPANY_CODE" id="COMPANY_CODE" value="${pd.COMPANY_CODE}" ng-model="model.COMPANY_CODE"
								<c:if test="${null != pd.COMPANY_ID}">readonly="readonly"</c:if>
								maxlength="10" placeholder="这里输入Company Code" title="Company Code" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Company Address:</td>
								<td><input type="text" name="COMPANY_ADDRESS" id="COMPANY_ADDRESS" value="${pd.COMPANY_ADDRESS}" 
								 ng-model="model.COMPANY_ADDRESS"
								maxlength="255" placeholder="这里输入Company Address" title="Company Address" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;"></td>
								<td>
									 <label style="float:left;padding-left: 8px;padding-top:7px;">
								        <input name="ISMAIN" class="ace" id="ISMAIN" type="checkbox"  ng-model="model.ISMAIN" ng-true-value="1" ng-false-value="0">	
								        <span class="lbl">Main Company${pd.ISMAIN}</span>
								    </label>
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script type="text/javascript" src="lib/app/company/app.js"></script>
	<script type="text/javascript" src="lib/app/company/service.js"></script>
	<script type="text/javascript" src="lib/app/company/controller.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入Company Name',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#COMPANY_CODE").val()==""){
				$("#COMPANY_CODE").tips({
					side:3,
		            msg:'请输入Company Code',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPANY_CODE").focus();
			return false;
			}
			if($("#COMPANY_ADDRESS").val()==""){
				$("#COMPANY_ADDRESS").tips({
					side:3,
		            msg:'请输入Company Address',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPANY_ADDRESS").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		
		</script>
</body>
</html>