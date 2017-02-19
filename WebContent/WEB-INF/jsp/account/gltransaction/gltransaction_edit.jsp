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
					
					<form action="gltransaction/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="gltransaction_ID" id="gltransaction_ID" value="${pd.gltransaction_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Document Date:</td>
								<td><input class="span10 date-picker" name="doc_date" id="doc_date" value="${pd.doc_date}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="Document Date" title="Document Date" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Document Number:</td>
								<td><input type="text" name="doc_number" id="doc_number" value="${pd.doc_number}" maxlength="100" placeholder="Document Number" title="Document Number" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Debit:</td>
								<td><input type="number" name="debit" id="debit" value="${pd.debit}" maxlength="32" placeholder="Debit" title="Debit" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Debit Ledger:</td>
								<td><input type="text" name="debit_ledger" id="debit_ledger" value="${pd.debit_ledger}" maxlength="255" placeholder="Debit Ledger" title="Debit Ledger" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Credit:</td>
								<td><input type="number" name="credit" id="credit" value="${pd.credit}" maxlength="32" placeholder="Credit" title="Credit" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Credit Ledger:</td>
								<td><input type="text" name="credit_ledger" id="credit_ledger" value="${pd.credit_ledger}" maxlength="255" placeholder="Credit Ledger" title="Credit Ledger" style="width:98%;"/></td>
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
			if($("#doc_date").val()==""){
				$("#doc_date").tips({
					side:3,
		            msg:'请输入Document Date',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#doc_date").focus();
			return false;
			}
			if($("#doc_number").val()==""){
				$("#doc_number").tips({
					side:3,
		            msg:'请输入Document Number',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#doc_number").focus();
			return false;
			}
			if($("#debit").val()==""){
				$("#debit").tips({
					side:3,
		            msg:'请输入Debit',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#debit").focus();
			return false;
			}
			if($("#debit_ledger").val()==""){
				$("#debit_ledger").tips({
					side:3,
		            msg:'请输入Debit Ledger',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#debit_ledger").focus();
			return false;
			}
			if($("#credit").val()==""){
				$("#credit").tips({
					side:3,
		            msg:'请输入Credit',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#credit").focus();
			return false;
			}
			if($("#credit_ledger").val()==""){
				$("#credit_ledger").tips({
					side:3,
		            msg:'请输入Credit Ledger',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#credit_ledger").focus();
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