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
	
	<!-- select2 -->
    <link rel="stylesheet" href="static/ng-select2/common/plugins/select2/select2.css" />
    <link rel="stylesheet" href="static/ng-select2/common/plugins/select2/select2-bootstrap.css" />
    <style type="text/css">
	#mx-table tbody tr td {
		padding: 0;
	}
	#mx-table tbody tr td input
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
					
					<form action="accountreceiptable/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="accountreceiptable_ID" id="accountreceiptable_ID" ng-model="vm.ar.accountreceiptable_ID" />
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">AR Number:</td>
								<td><input type="text" name="ar_number" id="ar_number" ng-model="vm.ar.ar_number" 
								readonly="readonly"
								maxlength="100" placeholder="AR Number auto general" title="AR Number" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">Date:</td>
								<td><input class="span10 date-picker" name="date" id="date" ng-model="vm.ar.date" 
								type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="Click To Select Date" 
								title="Date" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">Terms:</td>
								<td><input type="text" name="terms" id="terms" ng-model="vm.ar.terms" maxlength="10" 
								placeholder="Terms" title="Terms" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Customer Name:</td>
								<td>
									<select select2 class="form-control" data-placeholder="Select Customer" id="customer_id"
										ng-model="vm.ar.customer_id" ng-change="vm.selectCustomer()" style="vertical-align:top;width:98%;">
										<option value="{{s.CUSTOMER_ID}}" ng-repeat="s in vm.customers">{{s.NAME}}</option>
								  	</select>
								  	<input type="hidden" ng-model="vm.ar.customer_name">
								</td>
								<td colspan="99"></td>
								
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				<div class="row"> <!-- DETAILS TABLE  -->
					<div class="col-xs-12">
					<div style="overflow-x: scroll; scrolling: auto;width: 100%;">
						<table id="mx-table" class="table table-striped table-bordered table-hover" >	
							<thead>
								<tr>
									<th class="center" width="1%">
									<a style="cursor:pointer;" class="tooltip-success" title="Add Item" ng-click="vm.addMx()">
									<span class="">
										<i class="ace-icon fa fa-plus bigger-120"></i>
									</span>
									</a>
									</th>
									<th class="center" width="5%">CN</th>
									<th width="10%">Sales Type</th>
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
								<tr ng-repeat="var in vm.ar.mx track by var.accountreceiptablemx_ID">
									<td class="center">
									<a style="cursor:pointer;" class="tooltip-error" title="Delete" ng-click="vm.romoveMx(var)">
									<span class="red">
										<i class="ace-icon fa fa-times bigger-120"></i>
									</span>
									</a>
									</td>
									<td class='center'>{{$index+1}}</td>
									<td class=''>
										<select select2 class="select form-control" ng-model="var.sales_type" ng-change="vm.changeCOA(var)" 
										id="sales_type{{$index}}"
											data-placeholder="Select Chart of account" style="width:100%;">
										<option value="{{coa.LEDGER_CODE}}" ng-repeat="coa in vm.coas">{{coa.DESCRIPTION}}</option>
								  	</select>
									</td>
									<td class=''><input class="center form-control" type="text" ng-model="var.description"></td>
									<td class=''><input class="center form-control" type="text" ng-model="var.remarks"></td>
									<td class=''><input class="center form-control" type="text" ng-model="var.quantity" style="width:100%"></td>
									<td class=''><input class="center form-control" type="text" ng-model="var.unit_price" style="width:100%"></td>
									<td class=''><input class="center form-control" type="text" ng-model="var.gst_type" style="width:100%"></td>
									<td class=''><input class="center form-control" type="text" ng-model="var.gst_rate" style="width:100%"></td>
									<td class=''><input class="center form-control" type="text" ng-model="var.discount" style="width:100%"></td>
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
	<a class="btn btn-mini btn-primary" ng-click="vm.save();">保存</a>
	<a class="btn btn-mini btn-danger" ng-click="vm.close();">取消</a>
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
	<!-- select2 -->
	<script src="static/ng-select2/common/plugins/select2/select2.min.js" type="text/javascript"></script>
	<!-- SND SMING -->
	<script src="lib/layer/2.1/layer.js"></script>
	<script src="static/js/SND-utils.js"></script>
	<script type="text/javascript" src="static/js/snd/app.js"></script>
	
		<script type="text/javascript">
		'use strict';
		//------- angular end
		app.controller('myCtrl', function($scope, $http, serviceFactory) {
			var accountreceiptable_ID = getParamFromUrl("accountreceiptable_ID");
			var vm = this;
			vm.ar = {};
			vm.ar.debitor = 10000;
			vm.ar.mx = [];
			vm.customers = [];
			vm.coas = [];
			
			if (accountreceiptable_ID != null && accountreceiptable_ID !='') {
				serviceFactory.fetchAllObjects('accountreceiptable/listSvc/'+accountreceiptable_ID+'/')
	            .then(function(d) { console.log('ar=pd=', d.model.pd); vm.ar = d.model.pd;vm.ar.mx = d.model.mx; },
	            function(errResponse){
	                console.error('Error while fetching Objects on controller');
	            });
			}
			function pushMx(i) {
				vm.ar.mx.push({accountreceiptablemx_ID: i, sales_type:'', description:'', remarks:'', quantity:'', unit_price:'', gst_type:'', gst_rate:'',discount:''});
			}
			
			for(var i=0; i<3; i++) {
				pushMx(i);
			}
			fetchAllCustomers();
			//fetch all customers
			function fetchAllCustomers() {
				serviceFactory.fetchAllObjects('customer/listSvc/')
	            .then(function(d) { vm.customers = d.model.varList;},
	            function(errResponse){
	                console.error('Error while fetching Objects on controller');
	            });
			}
			vm.selectCustomer = function() {
				var customer_ID = vm.ar.customer_id;
				angular.forEach(vm.customers, function(obj, i) {
					if (obj.CUSTOMER_ID == customer_ID) {
						vm.ar.terms = obj.AR_TERMS;
						vm.ar.customer_name = obj.NAME;
						return false;
					}
				});
			};
			
			fetchAllCOAs();
			//fetch all chart of accounts
			function fetchAllCOAs() {
				serviceFactory.fetchAllObjects('chartofaccount/listSvc/')
	            .then(function(d) { vm.coas = d.model.varList;},
	            function(errResponse){
	                console.error('Error while fetching Objects on controller');
	            });
			}
			vm.changeCOA = function(mx) {
				angular.forEach(vm.coas, function(obj, i) {
					if (obj.LEDGER_CODE == mx.sales_type) {
						mx.gst_type = obj.GST_TYPE;
						mx.gst_rate = obj.GST_RATE;
						mx.description = obj.DESCRIPTION;
						mx.quantity = 1;
						mx.unit_price = 0;
						mx.discount = 0;
						return false;
					}
				});
				console.log('mx=', mx);
			};
			vm.close = function(){
				console.log("close");
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭 
			};
			vm.save = function(){
				if(vm.checked()) {
					$http({
			            url: 'accountreceiptable/saveAr',
			            method: "POST",
			            data: JSON.stringify(vm.ar)
			          }
			        ).then(function(d) { 
			        	console.log("success");
			        	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
			        	parent.location.reload();
						parent.layer.close(index); //再执行关闭
					},function(errResponse){
		                console.error('Error while fetching Objects on controller');
		            });
				}
			};
			vm.checked = function() {
				if (typeof vm.ar.date === "undefined" || vm.ar.date == '') {
					angular.element("#date").tips({
						side:3,
			            msg:'Date',
			            bg:'#AE81FF',
			            time:2
			        });
					return false;
				};
				if (typeof vm.ar.customer_id === "undefined" || vm.ar.customer_id == '') {
					angular.element("#s2id_customer_id").tips({
						side:3,
			            msg:'Customer Name',
			            bg:'#AE81FF',
			            time:2
			        });
					return false;
				};
				if (typeof vm.ar.terms === "undefined" || vm.ar.terms == '') {
					angular.element("#terms").tips({
						side:3,
			            msg:'Terms',
			            bg:'#AE81FF',
			            time:2
			        });
					return false;
				};
				var mxresult = true;
				for(var i=0; i< vm.ar.mx.length; i++) {
					var mx = vm.ar.mx[i];
					//console.log("for out ", mx.cost_type, mx.description, mx.remarks, mx.quantity);
					if((mx.sales_type == '' || mx.sales_type == null)  &&  (mx.description != '' || mx.remarks != ''
						|| mx.quantity != '' || mx.unit_price != '' || mx.gst_type != ''
						|| mx.gst_rate != '' || mx.discount != '')) {
						mxresult = false;
						angular.element("#select2-chosen-"+(i+2)).tips({ // cost_type, select2 auto general ID
							side:3,
				            msg:'Cost Type',
				            bg:'#AE81FF',
				            time:2
				        });
						//console.log("for", mx.cost_type);
						break;
					}
				};
				return mxresult;
			};
			vm.addMx = function() {
				pushMx(Math.random());
				$(".select").select2();
			};
			vm.romoveMx = function(o) {
				serviceFactory.postData("accountreceiptablemx/delete", 
						$.param({accountreceiptablemx_ID: o.accountreceiptablemx_ID}))
				.then(function(d) { 
		        	console.log("success");
		        	angular.forEach(vm.ar.mx, function(mx, i) {
						if(mx.accountreceiptablemx_ID == o.accountreceiptablemx_ID) {
							vm.ar.mx.splice(i, 1);
							return false;
						}
					});
				},function(errResponse){
	                console.error('Error while fetching Objects on controller');
	            });
			}
		});

		$(top.hangge());
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
			//下拉框
			//$(".select").select2();
		});
		</script>
</body>
</html>