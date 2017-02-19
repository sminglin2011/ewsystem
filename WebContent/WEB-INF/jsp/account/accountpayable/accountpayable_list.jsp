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
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- datatable


<script type="text/javascript" src="static/datatable/js/jquery.js"></script>
<script type="text/javascript" src="static/angular.js"></script>
 -->
 <style type="text/css">
 
 </style>
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
				<div class="space-12"></div>
					<!-- 
					<div class="page-header">
							<h1>
								Account Payable
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									 Listing
								</small>
							</h1>
					</div><!-- /.page-header -->
					
					<div class="row">
						<div class="col-xs-12">
						<div class="btn-group">
					        <label class="btn btn-xs btn-danger" ng-model="radioModel" ng-click="vm.add()">New</label>
					        <label class="btn btn-xs btn-primary" ng-model="radioModel" >Middle</label>
					        <label class="btn btn-xs btn-primary" ng-model="radioModel" >Right</label>
					    </div>
						
						<div class="table-header">
							<!-- &nbsp; -->
						</div>
						<!-- 
						<table id="dynamic-table" class="table table-striped table-bordered"	
							my-table="overrideOptions"
				        	aa-data="sampleData"
				        	ao-columns="columns"
				        	ao-column-defs="columnDefs"
				        	fn-row-callback="myCallback">
						</table> -->
						<table class="table table-striped table-bordered table-hover" style="width: 100%">
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
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 
	<script src="static/datatable/js/jquery.dataTables.js"></script>
	<script src="static/datatable/js/dataTables.bootstrap.js"></script>
	 -->
	 
	<!-- page specific plugin scripts -->
	
	<script src="static/html_UI/assets/js/dataTables/jquery.dataTables.js"></script>
	
	<script src="static/html_UI/assets/js/dataTables/jquery.dataTables.bootstrap.js"></script>
	<script src="static/html_UI/assets/js/dataTables/extensions/TableTools/js/dataTables.tableTools.js"></script>
	<script src="static/html_UI/assets/js/dataTables/extensions/ColVis/js/dataTables.colVis.js"></script>
	
	
	<!-- SND SMING
	<script type="text/javascript" src="static/ui-bootstrap-tpls-2.5.0.js"></script>
	 -->
	<script src="lib/layer/2.1/layer.js"></script>
	<script src="static/js/SND-utils.js"></script>
	<script type="text/javascript" src="static/js/snd/app.js"></script>
	
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>accountreceiptable/excel.do';
		}
		app.controller("myCtrl", function($scope, $http, serviceFactory, $compile) {
			var vm = this;
			var table = angular.element(".table").DataTable({
				//responsive: true,
				//pageLength: 3,
				serverSide: true,
			    ajax: {
			        url: 'accountpayable/listSvc/',
			        dataFilter: function(data){
			            var json = jQuery.parseJSON( data );
			            console.log(json.model.varList, 'json');
			            json.recordsTotal = 12;
			            json.recordsFiltered = 10;
			            json.data = json.model.varList; 
			            return JSON.stringify( json ); // return JSON string
			        }
			    },
			    columns: [
			    	{"title":"ID", "width": "20%", "visible":true, "mData": "accountpayable_ID"}
			    	,{"title":"Customer Name", "width": "20%", "visible":true, "mData": "supplier_name"}
		            ,{"title":"Contact Person", "width":"10%", "visible":true, "mData": "date"}
		            ,{"title":"Telephone", "width":"10%", "visible":true, "mData":'terms'}
		            ,{"title":"Action", "width":"10%", "visible":true, orderable:false
		             , render: function(data, type, row) {
		                 return '<a ng-click="show()">测试</a>';
		             }}
			     ],
			     rowCallback: function( row, data, index ) {
			    	 // console.log('row', row, 'data', data, 'index', index);
			    	  $(row).find('a').bind('click', function(){
			    		  $scope.$apply(function() {
				                $scope.show();
				            });
			    	  })
			     }
		    });
			vm.add = function() {
				var index = layer.open({
					  type: 2,
					  title: "Edit Account Payable",
					  content: 'accountpayable/goAdd.do',
					  success: function(layero, index){
					    var body = layer.getChildFrame('body', index);
					    var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
					    //console.log(body.html()) //得到iframe页的body内容
					    //body.find('input').val('Hi，我是从父页来的')
					  }
					});
				layer.full(index);
			};
		});
	</script>


</body>
</html>