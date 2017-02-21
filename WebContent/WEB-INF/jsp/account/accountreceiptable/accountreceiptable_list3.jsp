<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
						<div class="space-2"></div>
						<div class="clearfix">
							<div class="pull-left tableTools-container">
								<div class="btn-group">
					        <label class="btn btn-xs btn-danger" ng-model="radioModel" ng-click="vm.add()">
					        <i class="ace-icon fa fa-plus bigger-120" title="New"></i>New</label>
					        <!-- <label class="btn btn-xs btn-primary" ng-model="radioModel" >Middle</label>
					        <label class="btn btn-xs btn-primary" ng-model="radioModel" >Right</label> -->
					    </div>
							</div>
						</div>
						<div class="table-header">
							Billing
						</div>
						<table id="dynamic-table" class="table table-striped table-bordered table-hover"	
							my-table="overrideOptions"
				        	aa-data="sampleData"
				        	ao-columns="columns"
				        	ao-column-defs="columnDefs"
				        	fn-row-callback="myCallback">
						</table>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- datatable -->
	<script type="text/javascript" src="static/datatable/jquery.dataTables.js"></script>
	<!-- page specific plugin scripts -->
	<script src="static/html_UI/assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="static/html_UI/assets/js/dataTables/jquery.dataTables.bootstrap.js"></script>
	<script src="static/html_UI/assets/js/dataTables/extensions/TableTools/js/dataTables.tableTools.js"></script>
	<script src="static/html_UI/assets/js/dataTables/extensions/ColVis/js/dataTables.colVis.js"></script>
	<script type="text/javascript" src="static/ui-bootstrap-tpls-2.5.0.js"></script>
	<!-- SND SMING -->
	<script src="lib/layer/2.1/layer.js"></script>
	<script src="static/js/SND-utils.js"></script>
	<script type="text/javascript" src="static/js/snd/app.js"></script>
	<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='static/html_UI/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>accountreceiptable/excel.do';
		}
		app.controller("myCtrl", function($scope, $http, serviceFactory) {
			var vm = this;
			$scope.options = {};
			$scope.overrideOptions = {
				 ordering:  false,
				 info: false,
				 "pageLength": 10
			};
			$scope.sampleData = '';
			fetchAllObjects();
			//fetch all chart of accounts
			function fetchAllObjects() {
				serviceFactory.fetchAllObjects('accountreceiptable/listSvc/')
	            .then(function(d) { $scope.sampleData = d.model.varList; vm.QX = {add: d.model.QX.add, cha: d.model.QX.cha, del: d.model.QX.del, edit: d.model.QX.edit};},
	            function(errResponse){
	                console.error('Error while fetching Objects on controller');
	            });
			}
			$scope.columns = [ 
	            {"title":"", width:"1%", "visible":true, "mDataProp": "accountpayable_ID"
	            	, render: function(data, type, row, mate) {
	            		return "<label class='pos-rel'><input type='checkbox' name='ids' value='' class='ace' /><span class='lbl'></span></label>"
	            	}
	            }
	            ,{"title":"AR Number", width:"15%", "visible":true, "mDataProp": "ar_number"}
	            ,{"title":"Customer Name", width:"15%", "visible":true, "mDataProp": "customer_name"}
	            ,{"title":"Contact Person", width:"10%", "visible":true, "mDataProp": "date"}
	            ,{"title":"Telephone", width:"10%", "visible":true, mDataProp:'terms', orderable:false}
	            ,{"title":"Action", width:"10%","visible":true, orderable:false, searchable: false
	             , render: function(data, type, row) {
		            	 html = '<div class="hidden-sm hidden-xs btn-group">';
	              		if (vm.QX.edit == 1) {
	              			html = html + '<a class="btn btn-xs btn-success edit" title="编辑">'
								+ '<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>'
								+ '</a>';
	              		}
	              		if (vm.QX.del == 1) {
	              			html = html + '<a class="btn btn-xs btn-danger del" title="删除">'
								+ '<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>'
								+'</a>';
	              		}
			            html = html + '</div>';
					 	return html;
	             }}
					]; 
			$scope.myCallback = function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {            
		        $('td', nRow).find('.edit').bind('click', function() {
		            $scope.$apply(function() {
		                $scope.editFunction(aData);
		            });
		        });
		        $('td', nRow).find('.del').bind('click', function() {
		        	var tr = nRow;
		            $scope.$apply(function() {
		                $scope.delFunction(aData, tr);
		            });
		        });
		        return nRow;
		    };
		    
		    $scope.editFunction = function(obj) {
		    	$scope.customer = obj;
	            backTop();
		    }
			$scope.delFunction = function(obj, tr) {
				/* layer.msg('delete model, in development!', {icon: 5,time:2000}); */
				console.log("deleteObj", obj);
				/* angular.forEach($scope.sampleData, function(item, index){
		            if (obj.id === item.id) {
				      $scope.sampleData.splice(index, 1);
				      return;
				    };
				  }); */
				confimDelete($http, "deleteCustomer", {customerId:obj.id}, tr)
		    }
		})
	</script>


</body>
</html>