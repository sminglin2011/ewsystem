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
					
					<form action="accountpayablemx/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ACCOUNTPAYABLEMX_ID" id="ACCOUNTPAYABLEMX_ID" value="${pd.ACCOUNTPAYABLEMX_ID}"/>
						<input type="hidden" name="ACCOUNTPAYABLE_ID" id="ACCOUNTPAYABLE_ID" value="${pd.ACCOUNTPAYABLE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">AP Number:</td>
								<td><input type="text" name="AP_NUMBER" id="AP_NUMBER" value="${pd.AP_NUMBER}" maxlength="20" placeholder="这里输入AP Number" title="AP Number" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Cost Type:</td>
								<td><input type="text" name="COST_TYPE" id="COST_TYPE" value="${pd.COST_TYPE}" maxlength="20" placeholder="这里输入Cost Type" title="Cost Type" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Discription:</td>
								<td><input type="text" name="DISCRIPTION" id="DISCRIPTION" value="${pd.DISCRIPTION}" maxlength="255" placeholder="这里输入Discription" title="Discription" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Remarks:</td>
								<td><input type="text" name="REMARKS" id="REMARKS" value="${pd.REMARKS}" maxlength="255" placeholder="这里输入Remarks" title="Remarks" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Quantity:</td>
								<td><input type="number" name="QUANTITY" id="QUANTITY" value="${pd.QUANTITY}" maxlength="32" placeholder="这里输入Quantity" title="Quantity" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Unit Price:</td>
								<td><input type="number" name="UNIT_PRICE" id="UNIT_PRICE" value="${pd.UNIT_PRICE}" maxlength="32" placeholder="这里输入Unit Price" title="Unit Price" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">GST Type:</td>
								<td><input type="text" name="GST_TYPE" id="GST_TYPE" value="${pd.GST_TYPE}" maxlength="10" placeholder="这里输入GST Type" title="GST Type" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">GST Rate:</td>
								<td><input type="number" name="GST_RATE" id="GST_RATE" value="${pd.GST_RATE}" maxlength="32" placeholder="这里输入GST Rate" title="GST Rate" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Discount:</td>
								<td><input type="number" name="DISCOUNT" id="DISCOUNT" value="${pd.DISCOUNT}" maxlength="32" placeholder="这里输入Discount" title="Discount" style="width:98%;"/></td>
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
			if($("#AP_NUMBER").val()==""){
				$("#AP_NUMBER").tips({
					side:3,
		            msg:'请输入AP Number',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AP_NUMBER").focus();
			return false;
			}
			if($("#COST_TYPE").val()==""){
				$("#COST_TYPE").tips({
					side:3,
		            msg:'请输入Cost Type',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COST_TYPE").focus();
			return false;
			}
			if($("#DISCRIPTION").val()==""){
				$("#DISCRIPTION").tips({
					side:3,
		            msg:'请输入Discription',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DISCRIPTION").focus();
			return false;
			}
			if($("#REMARKS").val()==""){
				$("#REMARKS").tips({
					side:3,
		            msg:'请输入Remarks',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARKS").focus();
			return false;
			}
			if($("#QUANTITY").val()==""){
				$("#QUANTITY").tips({
					side:3,
		            msg:'请输入Quantity',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QUANTITY").focus();
			return false;
			}
			if($("#UNIT_PRICE").val()==""){
				$("#UNIT_PRICE").tips({
					side:3,
		            msg:'请输入Unit Price',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UNIT_PRICE").focus();
			return false;
			}
			if($("#GST_TYPE").val()==""){
				$("#GST_TYPE").tips({
					side:3,
		            msg:'请输入GST Type',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GST_TYPE").focus();
			return false;
			}
			if($("#GST_RATE").val()==""){
				$("#GST_RATE").tips({
					side:3,
		            msg:'请输入GST Rate',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GST_RATE").focus();
			return false;
			}
			if($("#DISCOUNT").val()==""){
				$("#DISCOUNT").tips({
					side:3,
		            msg:'请输入Discount',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DISCOUNT").focus();
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