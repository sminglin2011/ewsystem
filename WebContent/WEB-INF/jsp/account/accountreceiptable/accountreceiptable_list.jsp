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
							
						<!-- 检索  -->
						<form action="" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" 
											autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" ng-model="vm.keyword"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastStart" id="lastStart"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastEnd" name="lastEnd"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="name" id="id" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
									<option value=""></option>
									<option value="">全部</option>
									<option value="">1</option>
									<option value="">2</option>
								  	</select>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
								<c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>
							</tr>
						</table>
						<!-- 检索  -->
						<div class="clearfix">
							<div class="pull-right tableTools-container"></div>
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
				 "pageLength": 3,
				 buttons: [ 'copy', 'csv', 'print' ]
			};
			$scope.sampleData = '';
			fetchAllObjects();
			//fetch all chart of accounts
			function fetchAllObjects() {
				serviceFactory.fetchAllObjects('accountpayable/listSvc/')
	            .then(function(d) { $scope.sampleData = d.model.varList; vm.QX = {add: d.model.QX.add, cha: d.model.QX.cha, del: d.model.QX.del, edit: d.model.QX.edit};},
	            function(errResponse){
	                console.error('Error while fetching Objects on controller');
	            });
			}
			/* $scope.columnDefs = [ 
	            { "mDataProp": "category", "aTargets":[0]},
	            { "mDataProp": "name", "aTargets":[1] },
	            { "mDataProp": "price", "aTargets":[2] }
	        ]; */
			$scope.columns = [ 
	            {"title":"ID", width:"5%", "visible":true, "mDataProp": "accountpayable_ID"}
	            ,{"title":"Customer Name", width:"15%", "visible":true, "mDataProp": "supplier_name"}
	            ,{"title":"Contact Person", width:"10%", "visible":true, "mDataProp": "date"}
	            ,{"title":"Telephone", width:"10%", "visible":true, mDataProp:'terms', orderable:false}
	            ,{"title":"Action", width:"10%","visible":true, orderable:false, searchable: false
	             , render: function(data, type, row) {
	                 return "<a style='text-decoration:none' class='ml-5 edit' id='edit' href='javascript:;' title='Edit'><i class='Hui-iconfont Hui-iconfont-edit'></i></a>"
	                                    +"<a style='text-decoration:none' class='ml-5 del' id='del' href='javascript:;'      title='Delete'><i class='Hui-iconfont Hui-iconfont-del3'></i></a>";
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