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
					
					<form action="generalledger/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="GENERALLEDGER_ID" id="GENERALLEDGER_ID" value="${pd.GENERALLEDGER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">General Ledger Type:</td>
								<td>
									
									<select class="chosen-select form-control" name="GL_TYPE" id="GL_TYPE" 
									<c:if test="${null != pd.GENERALLEDGER_ID}">readonly="readonly"</c:if>
									data-placeholder="General Ledger Type" style="vertical-align:top;width: 98%;">
									<option value="${pd.GL_TYPE}" selected="selected">${pd.GL_TYPE}</option>
									<option value="ASSETS">ASSETS</option>
									<option value="LIABILITY">LIABILITY</option>
									<option value="EQUITY">EQUITY</option>
									<option value="SALES">SALES</option>
									<option value="EXPENSES">EXPENSES</option>
									<option value="COG">COST OF GOODS SOLD</option>
									<option value="GROSSPROFIT">GROSS PROFIT</option>
								  	</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">General Ledger Name:</td>
								<td><input type="text" name="GL_NAME" id="GL_NAME" value="${pd.GL_NAME}" maxlength="255" placeholder="这里输入General Ledger Name" title="General Ledger Name" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">General Ledger Name EN:</td>
								<td><input type="text" name="GL_NAME_EN" id="GL_NAME_EN" value="${pd.GL_NAME_EN}" maxlength="255" placeholder="这里输入General Ledger Name EN" title="General Ledger Name EN" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Sequence:</td>
								<td><input type="text" name="SEQUENCE" id="SEQUENCE" value="${pd.SEQUENCE}" maxlength="10" placeholder="这里输入Sequence" title="Sequence" style="width:98%;"/></td>
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
			/* console.log($("#GL_TYPE").val());
			return false; */
			if($("#GL_TYPE").val()==""){
				$("#GL_TYPE").tips({
					side:3,
		            msg:'请输入General Ledger Type',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GL_TYPE").focus();
			return false;
			}
			if($("#GL_NAME").val()==""){
				$("#GL_NAME").tips({
					side:3,
		            msg:'请输入General Ledger Name',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GL_NAME").focus();
			return false;
			}
			if($("#GL_NAME_EN").val()==""){
				$("#GL_NAME_EN").tips({
					side:3,
		            msg:'请输入General Ledger Name EN',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GL_NAME_EN").focus();
			return false;
			}
			if($("#SEQUENCE").val()==""){
				$("#SEQUENCE").tips({
					side:3,
		            msg:'请输入Sequence',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SEQUENCE").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			var isEditPage = true;
			
			
		});
		</script>
</body>
</html>