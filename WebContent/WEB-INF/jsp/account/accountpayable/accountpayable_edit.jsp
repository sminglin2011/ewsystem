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
	<!-- 下拉框
	<link rel="stylesheet" href="static/ace/css/chosen.css" /> -->
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	
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
					<div class="col-xs-4">
					<label>AP Number:</label>
						<input type="text" name="ap_number" id="ap_number" maxlength="100" 
								 	ng-model="vm.ap.ap_number"
									placeholder="AP Number Auto General" title="AP Number" style="width:98%;" readonly="readonly"/>
					</div>
					<div class="col-xs-4">
					<label>Vender Invoice:</label>
						<input type="text" name="vender_invoice" id="vender_invoice" maxlength="100" 
									ng-model="vm.ap.vender_invoice"
									placeholder="Vender Invoice" title="Vender Invoice" style="width:98%;"/>
					</div>
					<div class="col-xs-4">
					<label>Date:</label>
						<input class="span10 date-picker" name="date" id="date" type="text" 
							ng-model="vm.ap.date"
							data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="Date" title="Date" style="width:98%;"/>
					</div>
					<div class="col-xs-4">
					<label>Supplier Name:</label>
						<select select2 class="form-control" data-placeholder="Select Supplier" 
								ng-model="vm.ap.supplier_id" ng-change="vm.selectSupplier()" style="vertical-align:top;width:98%;">
								<option value="{{s.SUPPLIER_ID}}" ng-repeat="s in vm.suppliers">{{s.NAME}}</option>
						  	</select>
						  	<input type="hidden" ng-model="vm.ap.supplier_name">
					</div>
					<div class="col-xs-4">
					<label>Terms:</label>
						<input type="text" name="terms" id="terms" maxlength="10" 
							ng-model="vm.ap.terms" placeholder="Terms" title="Terms" style="width:98%;"/>
					</div>
				</div>
				<!-- /.row -->
				<div class="space-12"></div>
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
								<tr ng-repeat="var in vm.ap.mx track by var.accountpayablemx_ID">
									<td class="center">
									<a style="cursor:pointer;" class="tooltip-error" title="Delete" ng-click="vm.romoveMx(var)">
									<span class="red">
										<i class="ace-icon fa fa-times bigger-120"></i>
									</span>
									</a>
									</td>
									<td class='center'>{{$index+1}}</td>
									<td class=''>
										<select select2 class="select form-control" ng-model="var.cost_type" ng-change="vm.changeCOA(var)" 
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
<div class="space-5"></div>
<footer>
<div style="width: 100%;padding-bottom: 2px;" class="center">
	<a class="btn btn-mini btn-primary" ng-click="vm.save();">Save</a>
	<a class="btn btn-mini btn-danger" ng-click="vm.close();">Cancel</a>
</div>
</footer>

	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框
	<script src="static/ace/js/chosen.jquery.js"></script> -->
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
	app.controller('myCtrl', function($scope, $http, serviceFactory) {
		var accountpayable_ID = getParamFromUrl("accountpayable_ID");
		var vm = this;
		console.log(accountpayable_ID, 'accountpayable_ID');
		if (typeof (vm.ap) === 'undefined') {
			vm.ap = {};
			vm.ap.creditor = 20000;
			vm.ap.mx = [];
		}
		
		vm.suppliers = [];
		vm.coas = [];
		
		/* if edit page load object first base on id */
		if (accountpayable_ID != null) {
			serviceFactory.fetchAllObjects('accountpayable/listSvc/'+accountpayable_ID+'/')
            .then(function(d) { console.log('ap=pd=', d.model); vm.ap = d.model.pd; vm.ap.mx = d.model.mx},
            function(errResponse){
                console.error('Error while fetching Objects on controller');
            });
		} else {/* new AP, init 8 items*/
			for(var i=0; i<2; i++) {
				pushMx(i);
			}
		}
		
		/* add in mx item */
		function pushMx(i) {
			vm.ap.mx.push({accountpayablemx_ID:i, cost_type:'', description:'', remarks:'', quantity:'', unit_price:'', gst_type:'', gst_rate:'',discount:''});
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
		/* select supplier */
		vm.selectSupplier = function() {
			angular.forEach(vm.suppliers, function(obj, i) {
				if (obj.SUPPLIER_ID == vm.ap.supplier_id) {
					vm.ap.supplier_name = obj.NAME;
					vm.ap.terms = obj.AP_TERMS;
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
		/* select cost type */
		vm.changeCOA = function(mx) {
			angular.forEach(vm.coas, function(obj, i) {
				if (obj.LEDGER_CODE == mx.cost_type) {
					mx.ledger_code = obj.LEDGER_CODE;
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
		
		/* close window */
		vm.close = function(){
			console.log("close");
			var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
			parent.layer.close(index); //再执行关闭 
		};
		/**
		* save 
		**/
		vm.save = function(){
			console.log("1vm.ap",JSON.stringify(vm.ap));
			if (vm.checked()) {
				console.log(" checked success");
				$http({
		            url: 'accountpayable/saveAp',
		            method: "POST",
		            data: JSON.stringify(vm.ap)
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
		
		/* before save checking */
		vm.checked = function() {
			console.log("aaa", vm.ap.vender_invoice);
			if (typeof vm.ap.vender_invoice === "undefined" || vm.ap.vend_invoice == '') {
				angular.element("#vender_invoice").tips({
					side:3,
		            msg:'Vender Invoice',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			};
			if (typeof vm.ap.date === 'undefined'|| vm.ap.date == "") {
				angular.element("#date").tips({
					side:3,
		            msg:'Date',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			};
			if (typeof vm.ap.supplier_id === 'undefined' || vm.ap.supplier_id == "") {
				angular.element("#s2id_supplier_id").tips({
					side:3,
		            msg:'Supplier Name',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			};
			if (typeof vm.ap.terms === 'undefined' || vm.ap.terms == "") {
				angular.element("#terms").tips({
					side:3,
		            msg:'Terms',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			};
			var mxresult = true;
			for(var i=0; i< vm.ap.mx.length; i++) {
				var mx = vm.ap.mx[i];
				//console.log("for out ", mx.cost_type, mx.description, mx.remarks, mx.quantity);
				if((mx.cost_type == '' || mx.cost_type == null)  &&  (mx.description != '' || mx.remarks != ''
					|| mx.quantity != '' || mx.unit_price != '' || mx.gst_type != ''
					|| mx.gst_rate != '' || mx.discount != '')) {
					mxresult = false;
					angular.element("#s2id_cost_type"+i).tips({
						side:3,
			            msg:'Cost Type',
			            bg:'#AE81FF',
			            time:2
			        });
					//console.log("for", mx.cost_type);
					break;
				}
			};
			return mxresult
		}; /* vm.checked end */
		
		vm.addMx = function() {
			console.log(Math.random());
			pushMx(Math.random());
		};
		vm.romoveMx = function(o) {
			serviceFactory.postData("accountpayablemx/delete", 
					$.param({accountpayablemx_ID: o.accountpayablemx_ID}))
			.then(function(d) { 
	        	console.log("success");
	        	angular.forEach(vm.ap.mx, function(mx, i) {
					if(mx.accountpayablemx_ID == o.accountpayablemx_ID) {
						vm.ap.mx.splice(i, 1);
						return false;
					}
				});
			},function(errResponse){
                console.error('Error while fetching Objects on controller');
            });
			
			
		};
	}); /* end angular */
	$(top.hangge()); /* 关闭加载层 */
	$(function() {
		//日期框
		$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		
		//下拉框
		$(".select").select2();
	});
	</script>
</body>
</html>