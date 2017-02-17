<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" ng-app="app" ng-controller="myCtrl as vm">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	<style type="text/css">
	#simple-table tbody tr td {
		padding: 0;
	}
	#simple-table tbody tr td input
	{
		border: 0
	}
	</style>
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
						<input type="hidden" name="ACCOUNTPAYABLE_ID" id="ACCOUNTPAYABLE_ID" value="${pd.ACCOUNTPAYABLE_ID}" ng-model="vm.ACCOUNTPAYABLE_ID"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">AP Number:</td>
								<td><input type="text" name="AP_NUMBER" id="AP_NUMBER" value="${pd.AP_NUMBER}" maxlength="20" 
								 	ng-model="vm.ap.AP_NUMBER"
									placeholder="AP Number Auto General" title="AP Number" style="width:98%;" readonly="readonly"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">Vender Invoice:</td>
								<td><input type="text" name="VENDER_INVOICE" id="VENDER_INVOICE" value="${pd.VENDER_INVOICE}" maxlength="50" 
									ng-model="vm.VENDER_INVOICE"
									placeholder="Vender Invoice" title="Vender Invoice" style="width:98%;"/>
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">Date:</td>
								<td><input class="span10 date-picker" name="DATE" id="DATE" value="${pd.DATE}" type="text" 
									ng-model="vm.DATE"
									data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="Date" title="Date" style="width:98%;"/>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Supplier:</td>
								<td>
									<select class="select chosen-select form-control" data-placeholder="Select Supplier" style="vertical-align:top;width:98%;">
										<option value="">Select Supplier</option>
										<option value="{{s.SUPPLIER_ID}}" ng-repeat="s in vm.suppliers">{{s.NAME}}</option>
								  	</select>
									
								</td>
								<td colspan="2"></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">Terms:</td>
								<td><input type="text" name="TERMS" id="TERMS" value="${pd.TERMS}" maxlength="10" 
								placeholder="Terms" title="Terms" style="width:98%;"/></td>
							</tr>
						</table>
						</div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				<div class="row"> <!-- DETAILS TABLE  -->
					<div class="col-xs-12">
					<div style="overflow-x: scroll; scrolling: auto;width: 100%;">
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th width="5%">CN</th>
									<th width="10%">Cost Type</th>
									<th width="30%">Description</th>
									<th width="20%">Remarks</th>
									<th width="5%">Quantity</th>
									<th width="5%">Unit Price</th>
									<th width="5%">GST Type</th>
									<th width="5%">GST Rate</th>
									<th width="5%">Discount</th>
								</tr>
							</thead>
											
							<tbody>
								<tr ng-repeat="var in vm.ap.mx track by var.ACCOUNTPAYABLEMX_ID">
									<td class='center'>{{$index+1}}</td>
									<td class=''>
										<select class="select chosen-select form-control" ng-model="var.COST_TYPE" ng-changed="vm.changeCOD(var)"
											data-placeholder="Select Chart of account" style="width:100%;">
										<option value=""></option>
										<option value="{{coa.LEDGER_CODE}}" ng-repeat="coa in vm.coas">{{coa.DESCRIPTION}}</option>
								  	</select>
									</td>
									<td class=''><input class="form-control" type="text" ng-model="var.DESCRIPTION"></td>
									<td class=''><input class="form-control" type="text" ng-model="var.REMARKS"></td>
									<td class=''><input class="form-control" type="text" ng-model="var.QUANTITY" style="width:100%"></td>
									<td class=''><input class="form-control" type="text" ng-model="var.UNIT_PRICE" style="width:100%"></td>
									<td class=''><input class="form-control" type="text" ng-model="var.GST_TYPE" style="width:100%"></td>
									<td class=''><input class="form-control" type="text" ng-model="var.GST_RATE" style="width:100%"></td>
									<td class=''><input class="form-control" type="text" ng-model="var.DISCOUNT" style="width:100%"></td>
								</tr>
							</tbody>
						</table>
					</div>
					</div>
				</div> <!-- DETAILS TABLE row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->

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
	
	<!-- SND SMING -->
	<script src="lib/layer/2.1/layer.js"></script>
	<script src="static/js/SND-utils.js"></script>
	<script type="text/javascript" src="lib/app/app.js"></script>
	<script type="text/javascript" src="lib/app/service.js"></script>
	<script type="text/javascript" src="lib/select2-4.0.3/dist/js/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="lib/select2-4.0.3/dist/css/select2.css" />
	<script type="text/javascript">
	'use strict';
	angular.module("app").controller('myCtrl', function($scope, $http, serviceFactory) {
		var vm = this;
		vm.ap = {};
		vm.ap.mx = [];
		vm.apItem = {ACCOUNTPAYABLEMX_ID:'', COST_TYPE:'', DISCRIPTION:'', REMARKS:'', QUANTITY:'', UNIT_PRICE:'', GST_TYPE:'', GST_RATE:'',DISCOUNT:''};
		vm.suppliers = [];
		vm.coas = [];
		
		for(var i=0; i<8; i++) {
			vm.ap.mx.push({ACCOUNTPAYABLEMX_ID:i, COST_TYPE:'', DISCRIPTION:'', REMARKS:'', QUANTITY:'', UNIT_PRICE:'', GST_TYPE:'', GST_RATE:'',DISCOUNT:''});
		}
		fetchAllSuppliers();
		//fetch all Supplier
		function fetchAllSuppliers() {
			serviceFactory.fetchAllObjects('supplier/listSvc/')
            .then(function(d) { vm.suppliers = d.model.varList;},
            function(errResponse){
                console.error('Error while fetching Objects on controller');
            });
		}
		
		fetchAllCOAs();
		//fetch all chart of accounts
		function fetchAllCOAs() {
			serviceFactory.fetchAllObjects('chartofaccount/listSvc/')
            .then(function(d) { vm.coas = d.model.varList;},
            function(errResponse){
                console.error('Error while fetching Objects on controller');
            });
		}
		
		vm.changeCOD = function(mx) {
			
		}
		
	})
		$(top.hangge());
		//保存
		function save(){
			
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
			
			//下拉框
			$(".select").select2();
		});
		</script>
</body>
</html>