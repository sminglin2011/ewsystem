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
<html lang="en" ng-app="app" ng-controller="myCtrl as ctrl">
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
							
						<!-- 检索 
						<form action="#" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词"/>
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
								<td ng-show="{{QX.cha == 1}}" style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								<td ng-show="{{QX.toExcel == 1}}" style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">CN</th>
									<th class="center">Company Name</th>
									<th class="center">Company Code</th>
									<th class="center">Company Address</th>
									<th class="center">Company Logo</th>
									<th class="center">Compnay Telephone</th>
									<th class="center">Company Fax</th>
									<th class="center">GST NO.</th>
									<th class="center">Action</th>
								</tr>
							</thead>
													
							<tbody>
							
							<!-- 开始循环 -->	
							
										<tr ng-repeat="var in ctrl.varList" ng-if="(ctrl.QX.cha == 1)">
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="{{var.COMPANY_ID}}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">{{$index+1}}</td>
											<td class='center'>{{var.NAME}}</td>
											<td class='center'>{{var.COMPANY_CODE}}</td>
											<td class='center'>{{var.COMPANY_ADDRESS}}</td>
											<td class='center'>{{var.COMPNAY_LOGO}}</td>
											<td class='center'>{{var.COMPANY_TEL}}</td>
											<td class='center'>{{var.COMPANY_FAX}}</td>
											<td class='center'>{{var.GSTNO}}</td>
											<td class="center">
												<span ng-if="(ctrl.QX.edit != 1 && ctrl.QX.del !=1)" class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												<div class="hidden-sm hidden-xs btn-group">
													<a ng-if="(ctrl.QX.edit == 1)" class="btn btn-xs btn-success" title="Edit" ng-click="ctrl.edit(var)">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="Edit"></i>
													</a>
													<a ng-if="(ctrl.QX.del == 1)" class="btn btn-xs btn-danger" title="Delete" ng-click="ctrl.deleteObj(var)">
														<i class="ace-icon fa fa-trash-o bigger-120" title="Delete"></i>
													</a>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<li ng-if="(ctrl.QX.edit == 1)">
																<a style="cursor:pointer;" class="tooltip-success" data-rel="tooltip" title="Edit" ng-click="ctrl.edit(var)">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															<li ng-if="(ctrl.QX.del == 1)">
																<a style="cursor:pointer;" class="tooltip-error" data-rel="tooltip" title="Delete" ng-click="ctrl.deleteObj(var)">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
											</td>
										</tr>
									
									
										<tr ng-if="(ctrl.QX.cha == 0)">
											<td colspan="100" class="center">您无权查看</td>
										</tr>
								
										<tr class="main_info" ng-if="(ctrl.varList.length < 1)">
											<td colspan="100" class="center" >没有相关数据</td>
										</tr>
								
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<a ng-if="(ctrl.QX.add == 1)" class="btn btn-mini btn-success" ng-click="ctrl.add();">New</a>
									<!-- <a ng-if="(ctrl.QX.del == 1)" class="btn btn-mini btn-danger" onclick="makeAll('Confirm Delete All Selected Data?');" title="Batch Delte" ><i class='ace-icon fa fa-trash-o bigger-120'></i>Batch Delete</a> -->
								</td>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
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

<div id="editDiv" style="display: none;">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<input type="hidden" name="COMPANY_ID" id="COMPANY_ID" ng-model="model.COMPANY_ID"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Company Name:</td>
								<td><input type="text" name="NAME" id="NAME" maxlength="255"  ng-model="ctrl.model.NAME" 
								ng-readyonly="model.COMPANY_ID != NULL"
								placeholder="这里输入Company Name" title="Company Name" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Company Code:</td>
								<td><input type="text" name="COMPANY_CODE" id="COMPANY_CODE" ng-model="ctrl.model.COMPANY_CODE"
								ng-readonly="ctrl.model.COMPANY_CODE != null"
								maxlength="10" placeholder="这里输入Company Code" title="Company Code" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">Company Address:</td>
								<td><input type="text" name="COMPANY_ADDRESS" id="COMPANY_ADDRESS"
								 ng-model="ctrl.model.COMPANY_ADDRESS"
								maxlength="255" placeholder="这里输入Company Address" title="Company Address" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;"></td>
								<td>
									 <label style="float:left;padding-left: 8px;padding-top:7px;">
								        <input name="ISMAIN" class="ace" id="ISMAIN" type="checkbox" ng-checked="ctrl.isMainCompany(ctrl.model.ISMAIN)"
								        	ng-model="ctrl.model.ISMAIN" ng-true-value="1" ng-false-value="0">	
								        <span class="lbl">Main Company</span>
								    </label>
								</td>
							</tr>
						</table>
						</div>
					</div>
</div></div></div>
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
	
	<!-- SND SMING -->
	<script src="lib/layer/2.1/layer.js"></script>
	<script src="static/js/SND-utils.js"></script>
	<script type="text/javascript" src="lib/app/app.js"></script>
	<script type="text/javascript" src="lib/app/service.js"></script>
	<script type="text/javascript" src="lib/app/company/controller.js"></script>
	
	<script type="text/javascript">
	
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>company/excel.do';
		}
		
		'use strict';
		angular.module("app").controller('myCtrl', function($scope, serviceFactory) {
					var vm = this;
					vm.QX = {add:'', del:'', edit:'', cha:''};
					vm.varList = [];
					vm.model = {};
					
					vm.submit = submit;
				    vm.edit = edit;
				    vm.add = add;
				    vm.deleteObj = deleteObj;
				    vm.isMainCompany = isMainCompany;
				    
				    fetchAllObjects();
				 
				    function fetchAllObjects(){
				    	serviceFactory.fetchAllObjects('company/listSvc/')
				            .then(
				            function(d) {
				            	console.log("what is it = ?" + d);
				            	vm.varList = d.model.varList;
				            	vm.QX = {add: d.model.QX.add, cha: d.model.QX.cha, del: d.model.QX.del, edit: d.model.QX.edit};
				            	console.log("what is it$scope.QX = ?" + vm.QX.add, vm.QX.cha, vm.QX.del, vm.QX.edit);
				            },
				            function(errResponse){
				                console.error('Error while fetching Objects on controller');
				            }
				        );
				    }
				    function submit() {
				    	console.log("submit");
				    	serviceFactory.postData("company/listSvc/save.do", $.param(vm.model)).then(function(d) {
				    		fetchAllObjects();
				    		layer.msg('success',{icon: 1});
			    			setTimeout(function() { layer.closeAll(); }, 2000);
				    	},
			            function(errResponse){
			                console.error('Error while fetching Objects on controller');
			            });
				    	
				    }
				    function deleteObj(obj) {
				    	layer.confirm('Confirm Delete', {
				    		  btn: ['Confirm'] //可以无限个按钮
				    		}, function(index, layero){
				    			serviceFactory.postData("company/delete.do", $.param(obj)).then(function(d) {
						    		layer.msg(d, {icon: 1});
						    		fetchAllObjects();
						    	},
					            function(errResponse){
					                console.error('Error while fetching Objects on controller');
					            });
				    		});
				    	console.log("delete obj");
				    }
					function add() {
						vm.model = {ISMAIN: false}; //must rest model
						layerOpen($('#editDiv'), submit);
					}
				    function edit(obj){
				    	vm.model = angular.copy(obj);
				    	layerOpen($('#editDiv'), submit);
				    }
				    function isMainCompany(isMain) {
				    	 console.log("isMain", isMain);
				    	 if (isMain == '1' || isMain == true || isMain == 'on') {
				    		 return true;
				    	 } else return false;
				     }
				});
	</script>


</body>
</html>