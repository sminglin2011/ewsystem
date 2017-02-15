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
					
					<form action="accountnumberctrl/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ACCOUNTNUMBERCTRL_ID" id="ACCOUNTNUMBERCTRL_ID" value="${pd.ACCOUNTNUMBERCTRL_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Current Year:</td>
								<td><input type="number" name="YEAR" id="YEAR" value="${pd.YEAR}" maxlength="32" placeholder="Current Year" title="Current Year" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Next Number:</td>
								<td><input type="number" name="NEXT_NO" id="NEXT_NO" value="${pd.NEXT_NO}" maxlength="32" placeholder="Next Number" title="Next Number" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Prefix String:</td>
								<td><input type="text" name="PREFIX" id="PREFIX" value="${pd.PREFIX}" maxlength="10" placeholder="Prefix String" title="Prefix String" style="width:98%;"/></td>
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
			if($("#YEAR").val()==""){
				$("#YEAR").tips({
					side:3,
		            msg:'请输入Current Year',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#YEAR").focus();
			return false;
			}
			if($("#NEXT_NO").val()==""){
				$("#NEXT_NO").tips({
					side:3,
		            msg:'请输入Next Number',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NEXT_NO").focus();
			return false;
			}
			if($("#PREFIX").val()==""){
				$("#PREFIX").tips({
					side:3,
		            msg:'请输入Prefix String',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PREFIX").focus();
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