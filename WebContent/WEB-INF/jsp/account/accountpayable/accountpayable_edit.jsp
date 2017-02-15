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
					
					<form action="accountpayable/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ACCOUNTPAYABLE_ID" id="ACCOUNTPAYABLE_ID" value="${pd.ACCOUNTPAYABLE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">AP Number:</td>
								<td><input type="text" name="AP_NUNBER" id="AP_NUNBER" value="${pd.AP_NUNBER}" maxlength="20" placeholder="这里输入AP Number" title="AP Number" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Supplier Name:</td>
								<td><input type="text" name="SUPPLIER_ID" id="SUPPLIER_ID" value="${pd.SUPPLIER_ID}" maxlength="20" placeholder="这里输入Supplier Name" title="Supplier Name" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Supplier Name:</td>
								<td><input type="text" name="SUPPLIER_NAME" id="SUPPLIER_NAME" value="${pd.SUPPLIER_NAME}" maxlength="255" placeholder="这里输入Supplier Name" title="Supplier Name" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Date:</td>
								<td><input class="span10 date-picker" name="DATE" id="DATE" value="${pd.DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="Date" title="Date" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Terms:</td>
								<td><input type="text" name="TERMS" id="TERMS" value="${pd.TERMS}" maxlength="10" placeholder="这里输入Terms" title="Terms" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Vender Invoice:</td>
								<td><input type="text" name="VENDER_INVOICE" id="VENDER_INVOICE" value="${pd.VENDER_INVOICE}" maxlength="50" placeholder="这里输入Vender Invoice" title="Vender Invoice" style="width:98%;"/></td>
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
		<iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>/accountpayablemx/list.do?ACCOUNTPAYABLE_ID=${pd.ACCOUNTPAYABLE_ID}" style="margin:0 auto;width:805px;height:368px;;"></iframe>
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
			if($("#AP_NUNBER").val()==""){
				$("#AP_NUNBER").tips({
					side:3,
		            msg:'请输入AP Number',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AP_NUNBER").focus();
			return false;
			}
			if($("#SUPPLIER_ID").val()==""){
				$("#SUPPLIER_ID").tips({
					side:3,
		            msg:'请输入Supplier Name',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUPPLIER_ID").focus();
			return false;
			}
			if($("#SUPPLIER_NAME").val()==""){
				$("#SUPPLIER_NAME").tips({
					side:3,
		            msg:'请输入Supplier Name',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUPPLIER_NAME").focus();
			return false;
			}
			if($("#DATE").val()==""){
				$("#DATE").tips({
					side:3,
		            msg:'请输入Date',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DATE").focus();
			return false;
			}
			if($("#TERMS").val()==""){
				$("#TERMS").tips({
					side:3,
		            msg:'请输入Terms',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TERMS").focus();
			return false;
			}
			if($("#VENDER_INVOICE").val()==""){
				$("#VENDER_INVOICE").tips({
					side:3,
		            msg:'请输入Vender Invoice',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VENDER_INVOICE").focus();
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