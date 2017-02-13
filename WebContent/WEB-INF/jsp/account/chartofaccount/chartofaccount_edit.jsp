<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
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
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="chartofaccount/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CHARTOFACCOUNT_ID" id="CHARTOFACCOUNT_ID" value="${pd.CHARTOFACCOUNT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Ledger Code:</td>
								<td><input type="text" name="LEDGER_CODE" id="LEDGER_CODE" value="${pd.LEDGER_CODE}" maxlength="6" placeholder="这里输入Ledger Code" title="Ledger Code" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Description:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入Description" title="Description" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Account Type:</td>
								<td><input type="text" name="ACCOUNT_TYPE" id="ACCOUNT_TYPE" value="${pd.ACCOUNT_TYPE}" maxlength="20" placeholder="这里输入Account Type" title="Account Type" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Control Account:</td>
								<td><input type="number" name="CONTROL_ACCOUNT" id="CONTROL_ACCOUNT" value="${pd.CONTROL_ACCOUNT}" maxlength="32" placeholder="这里输入Control Account" title="Control Account" style="width:98%;"/></td>
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
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#LEDGER_CODE").val()==""){
				$("#LEDGER_CODE").tips({
					side:3,
		            msg:'请输入Ledger Code',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LEDGER_CODE").focus();
			return false;
			}
			if($("#DESCRIPTION").val()==""){
				$("#DESCRIPTION").tips({
					side:3,
		            msg:'请输入Description',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DESCRIPTION").focus();
			return false;
			}
			if($("#ACCOUNT_TYPE").val()==""){
				$("#ACCOUNT_TYPE").tips({
					side:3,
		            msg:'请输入Account Type',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ACCOUNT_TYPE").focus();
			return false;
			}
			if($("#CONTROL_ACCOUNT").val()==""){
				$("#CONTROL_ACCOUNT").tips({
					side:3,
		            msg:'请输入Control Account',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTROL_ACCOUNT").focus();
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