﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
							        <label class="btn btn-xs btn-success" title="Receipt" >Receipt</label>
							        <label class="btn btn-xs btn-primary" ng-model="radioModel" >Right</label> 
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
	            .then(function(d) { $scope.sampleData = d.model.varList; vm.QX = d.model.QX;},
	            function(errResponse){
	                console.error('Error while fetching Objects on controller');
	            });
			}
			$scope.columns = [ 
	            {"title":"<label class='pos-rel'><input type='checkbox' id='zcheckbox' class='ace'><span class='lbl'></span></label>"
	            	, width:"1%", "visible":true, "mDataProp": "accountpayable_ID"
	            	, render: function(data, type, row, mate) {
	            		return "<label class='pos-rel'>"
	            		+"<input type='checkbox' name='ids' value='"+data+"' class='ace id' /><span class='lbl'></span></label>"
	            	}
	            }
	            ,{"title":"AR Number", width:"15%", "visible":true, "mDataProp": "ar_number"}
	            ,{"title":"Customer Name", width:"15%", "visible":true, "mDataProp": "customer_name"}
	            ,{"title":"Contact Person", width:"10%", "visible":true, "mDataProp": "date"}
	            ,{"title":"Telephone", width:"10%", "visible":true, mDataProp:'terms', orderable:false}
	            ,{"title":"Action", width:"10%","visible":true, orderable:false, searchable: false
	             , render: function(data, type, row) {
		            	 html = '<div class="btn-group">';
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
		    	var index = layer.open({
					  type: 2,
					  title: "Edit Account Payable",
					  content: 'accountreceiptable/goEdit.do?accountreceiptable_ID='+obj.accountreceiptable_ID,
					  success: function(layero, index){
					    var body = layer.getChildFrame('body', index);
					    var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
					    //console.log(body.html()) //得到iframe页的body内容
					    //body.find('input').val('Hi，我是从父页来的')
					  }
					});
				layer.full(index);
		    };
			$scope.delFunction = function(obj, tr) {
				layer.confirm('Confirm Delete', {
		    		  btn: ['Confirm'] //可以无限个按钮
		    		}, function(index, layero){
		    			serviceFactory.postData("accountreceiptable/delete.do", $.param({accountreceiptable_ID: obj.accountreceiptable_ID}))
		    			.then(function(d) {
		    				if (d.result == 'false') {
		    					layer.msg("Please delete items first", {icon: 5, time:3000});
		    				} else {
		    					layer.msg("cussess", {icon: 1});
		    					location.reload();
		    				}
				    	},
			            function(errResponse){
			                console.error('Error while fetching Objects on controller');
			            });
		    		});
		    	console.log("delete obj");
		    };
			vm.add = function() {
				var index = layer.open({
					  type: 2,
					  title: "Edit Account Payable",
					  content: 'accountreceiptable/goAdd.do',
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
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>chartofaccount/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											console.log(data);
									 });
								}
							});
						}
					}
				}
			});
		};
		$(function(){
			//复选框全选控制
			var active_class = 'active';
			$('.table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
	</script>


</body>
</html>