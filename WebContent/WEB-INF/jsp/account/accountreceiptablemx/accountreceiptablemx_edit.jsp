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
					
					<form action="accountreceiptablemx/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="accountreceiptablemx_ID" id="accountreceiptablemx_ID" value="${pd.accountreceiptablemx_ID}"/>
						<input type="hidden" name="accountreceiptable_ID" id="accountreceiptable_ID" value="${pd.accountreceiptable_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Description:</td>
								<td><input type="text" name="description" id="description" value="${pd.description}" maxlength="255" placeholder="这里输入Description" title="Description" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Remarks:</td>
								<td><input type="text" name="remarks" id="remarks" value="${pd.remarks}" maxlength="255" placeholder="这里输入Remarks" title="Remarks" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Quantity:</td>
								<td><input type="number" name="quantity" id="quantity" value="${pd.quantity}" maxlength="32" placeholder="这里输入Quantity" title="Quantity" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Unit Price:</td>
								<td><input type="number" name="unit_price" id="unit_price" value="${pd.unit_price}" maxlength="32" placeholder="这里输入Unit Price" title="Unit Price" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">GST Type:</td>
								<td><input type="text" name="Gst_type" id="Gst_type" value="${pd.Gst_type}" maxlength="10" placeholder="这里输入GST Type" title="GST Type" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">GST Rate:</td>
								<td><input type="number" name="gst_rate" id="gst_rate" value="${pd.gst_rate}" maxlength="32" placeholder="这里输入GST Rate" title="GST Rate" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Discount:</td>
								<td><input type="number" name="discount" id="discount" value="${pd.discount}" maxlength="32" placeholder="这里输入Discount" title="Discount" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Ledger Code:</td>
								<td><input type="text" name="ledger_code" id="ledger_code" value="${pd.ledger_code}" maxlength="10" placeholder="这里输入Ledger Code" title="Ledger Code" style="width:98%;"/></td>
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
			if($("#description").val()==""){
				$("#description").tips({
					side:3,
		            msg:'请输入Description',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#description").focus();
			return false;
			}
			if($("#remarks").val()==""){
				$("#remarks").tips({
					side:3,
		            msg:'请输入Remarks',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#remarks").focus();
			return false;
			}
			if($("#quantity").val()==""){
				$("#quantity").tips({
					side:3,
		            msg:'请输入Quantity',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#quantity").focus();
			return false;
			}
			if($("#unit_price").val()==""){
				$("#unit_price").tips({
					side:3,
		            msg:'请输入Unit Price',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#unit_price").focus();
			return false;
			}
			if($("#Gst_type").val()==""){
				$("#Gst_type").tips({
					side:3,
		            msg:'请输入GST Type',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#Gst_type").focus();
			return false;
			}
			if($("#gst_rate").val()==""){
				$("#gst_rate").tips({
					side:3,
		            msg:'请输入GST Rate',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#gst_rate").focus();
			return false;
			}
			if($("#discount").val()==""){
				$("#discount").tips({
					side:3,
		            msg:'请输入Discount',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#discount").focus();
			return false;
			}
			if($("#ledger_code").val()==""){
				$("#ledger_code").tips({
					side:3,
		            msg:'请输入Ledger Code',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ledger_code").focus();
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