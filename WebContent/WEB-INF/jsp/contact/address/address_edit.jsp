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
					
					<form action="address/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ADDRESS_ID" id="ADDRESS_ID" value="${pd.ADDRESS_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Block:</td>
								<td><input type="text" name="BLOCK" id="BLOCK" value="${pd.BLOCK}" maxlength="10" placeholder="这里输入Block" title="Block" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Floor:</td>
								<td><input type="text" name="FLOOR" id="FLOOR" value="${pd.FLOOR}" maxlength="10" placeholder="这里输入Floor" title="Floor" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Unit NO.:</td>
								<td><input type="text" name="UNIT_NO" id="UNIT_NO" value="${pd.UNIT_NO}" maxlength="10" placeholder="这里输入Unit NO." title="Unit NO." style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Street:</td>
								<td><input type="text" name="STREET" id="STREET" value="${pd.STREET}" maxlength="255" placeholder="这里输入Street" title="Street" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Building:</td>
								<td><input type="text" name="BUILDING" id="BUILDING" value="${pd.BUILDING}" maxlength="255" placeholder="这里输入Building" title="Building" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Postal Code:</td>
								<td><input type="text" name="POSTAL_CODE" id="POSTAL_CODE" value="${pd.POSTAL_CODE}" maxlength="6" placeholder="这里输入Postal Code" title="Postal Code" style="width:98%;"/></td>
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
			if($("#BLOCK").val()==""){
				$("#BLOCK").tips({
					side:3,
		            msg:'请输入Block',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BLOCK").focus();
			return false;
			}
			if($("#FLOOR").val()==""){
				$("#FLOOR").tips({
					side:3,
		            msg:'请输入Floor',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FLOOR").focus();
			return false;
			}
			if($("#UNIT_NO").val()==""){
				$("#UNIT_NO").tips({
					side:3,
		            msg:'请输入Unit NO.',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UNIT_NO").focus();
			return false;
			}
			if($("#STREET").val()==""){
				$("#STREET").tips({
					side:3,
		            msg:'请输入Street',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STREET").focus();
			return false;
			}
			if($("#BUILDING").val()==""){
				$("#BUILDING").tips({
					side:3,
		            msg:'请输入Building',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BUILDING").focus();
			return false;
			}
			if($("#POSTAL_CODE").val()==""){
				$("#POSTAL_CODE").tips({
					side:3,
		            msg:'请输入Postal Code',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#POSTAL_CODE").focus();
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