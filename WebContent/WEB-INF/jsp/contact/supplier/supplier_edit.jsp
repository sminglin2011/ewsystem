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
					
					<form action="supplier/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SUPPLIER_ID" id="SUPPLIER_ID" value="${pd.SUPPLIER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Name:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入Name" title="Name" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Contact Person:</td>
								<td><input type="text" name="CONTACT_PERSON" id="CONTACT_PERSON" value="${pd.CONTACT_PERSON}" maxlength="255" placeholder="这里输入Contact Person" title="Contact Person" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Contact Telephone:</td>
								<td><input type="text" name="CONTACT_TEL" id="CONTACT_TEL" value="${pd.CONTACT_TEL}" maxlength="20" placeholder="这里输入Contact Telephone" title="Contact Telephone" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Contact Mobile:</td>
								<td><input type="text" name="CONTACT_MOBILE" id="CONTACT_MOBILE" value="${pd.CONTACT_MOBILE}" maxlength="20" placeholder="这里输入Contact Mobile" title="Contact Mobile" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Fax:</td>
								<td><input type="text" name="FAX" id="FAX" value="${pd.FAX}" maxlength="20" placeholder="这里输入Fax" title="Fax" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Postal Code:</td>
								<td><input type="text" name="POSTAL_CODE" id="POSTAL_CODE" value="${pd.POSTAL_CODE}" maxlength="6" placeholder="这里输入Postal Code" title="Postal Code" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Full Address:</td>
								<td><input type="text" name="FULL_ADDRESS" id="FULL_ADDRESS" value="${pd.FULL_ADDRESS}" maxlength="255" placeholder="这里输入Full Address" title="Full Address" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">AP Ledger:</td>
								<td><input type="text" name="AP_LEDGER" id="AP_LEDGER" value="${pd.AP_LEDGER}" maxlength="6" placeholder="这里输入AP Ledger" title="AP Ledger" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">AP Terms:</td>
								<td><input type="text" name="AP_TERMS" id="AP_TERMS" value="${pd.AP_TERMS}" maxlength="10" placeholder="这里输入AP Terms" title="AP Terms" style="width:98%;"/></td>
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
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入Name',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#CONTACT_PERSON").val()==""){
				$("#CONTACT_PERSON").tips({
					side:3,
		            msg:'请输入Contact Person',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTACT_PERSON").focus();
			return false;
			}
			if($("#CONTACT_TEL").val()==""){
				$("#CONTACT_TEL").tips({
					side:3,
		            msg:'请输入Contact Telephone',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTACT_TEL").focus();
			return false;
			}
			if($("#CONTACT_MOBILE").val()==""){
				$("#CONTACT_MOBILE").tips({
					side:3,
		            msg:'请输入Contact Mobile',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTACT_MOBILE").focus();
			return false;
			}
			if($("#FAX").val()==""){
				$("#FAX").tips({
					side:3,
		            msg:'请输入Fax',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FAX").focus();
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
			if($("#FULL_ADDRESS").val()==""){
				$("#FULL_ADDRESS").tips({
					side:3,
		            msg:'请输入Full Address',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FULL_ADDRESS").focus();
			return false;
			}
			if($("#ADDRESS_ID").val()==""){
				$("#ADDRESS_ID").tips({
					side:3,
		            msg:'请输入Address ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS_ID").focus();
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
			if($("#AP_TERMS").val()==""){
				$("#AP_TERMS").tips({
					side:3,
		            msg:'请输入AP Terms',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AP_TERMS").focus();
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