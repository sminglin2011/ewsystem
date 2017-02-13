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
					
					<form action="defaultsupplier/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="DEFAULTSUPPLIER_ID" id="DEFAULTSUPPLIER_ID" value="${pd.DEFAULTSUPPLIER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">StockItem ID:</td>
								<td><input type="text" name="STOCKITEM_ID" id="STOCKITEM_ID" value="${pd.STOCKITEM_ID}" maxlength="20" placeholder="这里输入StockItem ID" title="StockItem ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Supplier ID:</td>
								<td><input type="text" name="SUPPLIER_ID" id="SUPPLIER_ID" value="${pd.SUPPLIER_ID}" maxlength="20" placeholder="这里输入Supplier ID" title="Supplier ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Default Price:</td>
								<td><input type="number" name="DEFAULT_PRICE" id="DEFAULT_PRICE" value="${pd.DEFAULT_PRICE}" maxlength="32" placeholder="这里输入Default Price" title="Default Price" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Default UOM:</td>
								<td><input type="text" name="DEFAULT_UOM" id="DEFAULT_UOM" value="${pd.DEFAULT_UOM}" maxlength="10" placeholder="这里输入Default UOM" title="Default UOM" style="width:98%;"/></td>
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
			if($("#STOCKITEM_ID").val()==""){
				$("#STOCKITEM_ID").tips({
					side:3,
		            msg:'请输入StockItem ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STOCKITEM_ID").focus();
			return false;
			}
			if($("#SUPPLIER_ID").val()==""){
				$("#SUPPLIER_ID").tips({
					side:3,
		            msg:'请输入Supplier ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUPPLIER_ID").focus();
			return false;
			}
			if($("#DEFAULT_PRICE").val()==""){
				$("#DEFAULT_PRICE").tips({
					side:3,
		            msg:'请输入Default Price',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DEFAULT_PRICE").focus();
			return false;
			}
			if($("#DEFAULT_UOM").val()==""){
				$("#DEFAULT_UOM").tips({
					side:3,
		            msg:'请输入Default UOM',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DEFAULT_UOM").focus();
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