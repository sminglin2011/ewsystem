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
					
					<form action="stockitem/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="STOCKITEM_ID" id="STOCKITEM_ID" value="${pd.STOCKITEM_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Description:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入Description" title="Description" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Description EN:</td>
								<td><input type="text" name="DESCRIPTION_EN" id="DESCRIPTION_EN" value="${pd.DESCRIPTION_EN}" maxlength="255" placeholder="这里输入Description EN" title="Description EN" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">AR Ledger:</td>
								<td><input type="text" name="AR_LEDGER" id="AR_LEDGER" value="${pd.AR_LEDGER}" maxlength="6" placeholder="这里输入AR Ledger" title="AR Ledger" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">AP Ledger:</td>
								<td><input type="text" name="AP_LEDGER" id="AP_LEDGER" value="${pd.AP_LEDGER}" maxlength="6" placeholder="这里输入AP Ledger" title="AP Ledger" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Category:</td>
								<td><input type="text" name="CATEGORY" id="CATEGORY" value="${pd.CATEGORY}" maxlength="20" placeholder="这里输入Category" title="Category" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Category Group:</td>
								<td><input type="text" name="CATEGORY_GROUP" id="CATEGORY_GROUP" value="${pd.CATEGORY_GROUP}" maxlength="20" placeholder="这里输入Category Group" title="Category Group" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Brand:</td>
								<td><input type="text" name="BRAND" id="BRAND" value="${pd.BRAND}" maxlength="20" placeholder="这里输入Brand" title="Brand" style="width:98%;"/></td>
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
			if($("#DESCRIPTION_EN").val()==""){
				$("#DESCRIPTION_EN").tips({
					side:3,
		            msg:'请输入Description EN',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DESCRIPTION_EN").focus();
			return false;
			}
			if($("#AR_LEDGER").val()==""){
				$("#AR_LEDGER").tips({
					side:3,
		            msg:'请输入AR Ledger',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AR_LEDGER").focus();
			return false;
			}
			if($("#AP_LEDGER").val()==""){
				$("#AP_LEDGER").tips({
					side:3,
		            msg:'请输入AP Ledger',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AP_LEDGER").focus();
			return false;
			}
			if($("#DEFAULTSUPPLIER_ID").val()==""){
				$("#DEFAULTSUPPLIER_ID").tips({
					side:3,
		            msg:'请输入DefaultSupplier_id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DEFAULTSUPPLIER_ID").focus();
			return false;
			}
			if($("#CATEGORY").val()==""){
				$("#CATEGORY").tips({
					side:3,
		            msg:'请输入Category',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CATEGORY").focus();
			return false;
			}
			if($("#CATEGORY_GROUP").val()==""){
				$("#CATEGORY_GROUP").tips({
					side:3,
		            msg:'请输入Category Group',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CATEGORY_GROUP").focus();
			return false;
			}
			if($("#BRAND").val()==""){
				$("#BRAND").tips({
					side:3,
		            msg:'请输入Brand',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BRAND").focus();
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