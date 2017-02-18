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
					
					<form action="accountreceiptable/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="accountreceiptable_ID" id="accountreceiptable_ID" value="${pd.accountreceiptable_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">AR Number:</td>
								<td><input type="text" name="ar_number" id="ar_number" value="${pd.ar_number}" maxlength="100" placeholder="这里输入AR Number" title="AR Number" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Customr ID:</td>
								<td><input type="text" name="customer_id" id="customer_id" value="${pd.customer_id}" maxlength="100" placeholder="这里输入Customr ID" title="Customr ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Customer Name:</td>
								<td><input type="text" name="customer_name" id="customer_name" value="${pd.customer_name}" maxlength="255" placeholder="这里输入Customer Name" title="Customer Name" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Date:</td>
								<td><input class="span10 date-picker" name="date" id="date" value="${pd.date}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="Date" title="Date" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Terms:</td>
								<td><input type="text" name="terms" id="terms" value="${pd.terms}" maxlength="10" placeholder="这里输入Terms" title="Terms" style="width:98%;"/></td>
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

<c:if test="${'edit' == msg }">
	<div>
		<iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>/accountreceiptablemx/list.do?accountreceiptable_ID=${pd.accountreceiptable_ID}" style="margin:0 auto;width:805px;height:368px;;"></iframe>
	</div>
</c:if>

<footer>
<div style="width: 100%;padding-bottom: 2px;" class="center">
	<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
	<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
</div>
</footer>

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
			if($("#ar_number").val()==""){
				$("#ar_number").tips({
					side:3,
		            msg:'请输入AR Number',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ar_number").focus();
			return false;
			}
			if($("#customer_id").val()==""){
				$("#customer_id").tips({
					side:3,
		            msg:'请输入Customr ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#customer_id").focus();
			return false;
			}
			if($("#customer_name").val()==""){
				$("#customer_name").tips({
					side:3,
		            msg:'请输入Customer Name',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#customer_name").focus();
			return false;
			}
			if($("#date").val()==""){
				$("#date").tips({
					side:3,
		            msg:'请输入Date',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#date").focus();
			return false;
			}
			if($("#terms").val()==""){
				$("#terms").tips({
					side:3,
		            msg:'请输入Terms',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#terms").focus();
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