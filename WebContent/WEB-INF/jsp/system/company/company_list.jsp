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
<html lang="en" ng-app="app">
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
	<div class="main-container" id="main-container" ng-controller="myCtrl">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							
						<!-- 检索 -->
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
							
										<tr ng-repeat="var in varList" ng-if="(QX.cha == 1)">
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="{{var.COMPANY_ID}}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">{{$.index+1}}</td>
											<td class='center'>{{var.NAME}}</td>
											<td class='center'>{{var.COMPANY_CODE}}</td>
											<td class='center'>{{var.COMPANY_ADDRESS}}</td>
											<td class='center'>{{var.COMPNAY_LOGO}}</td>
											<td class='center'>{{var.COMPANY_TEL}}</td>
											<td class='center'>{{var.COMPANY_FAX}}</td>
											<td class='center'>{{var.GSTNO}}</td>
											<td class="center">
												<!-- 
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.COMPANY_ID}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="del('${var.COMPANY_ID}');">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
													</c:if>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.edit == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="edit('${var.COMPANY_ID}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${var.COMPANY_ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
														</ul>
													</div>
												</div> -->
											</td>
										</tr>
									
									
										<tr ng-if="(QX.cha == 0)">
											<td colspan="100" class="center">您无权查看</td>
										</tr>
								
									<tr class="main_info" ng-if="(model.varList.length < 1)">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<a ng-if="(QX.add == 1)" class="btn btn-mini btn-success" onclick="add();">新增</a>
									<a ng-if="(QX.del == 1)" class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i>Del</a>
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
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>company/goAdd.do';
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>company/delete.do?COMPANY_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>company/goEdit.do?COMPANY_ID='+Id;
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮 
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
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
								url: '<%=basePath%>company/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		};
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>company/excel.do';
		}
		
		'use strict';
		 var app = angular.module("app",[]);
		 app.factory('serviceFactory', function($http, $q){
			 var REST_SERVICE_URI = 'company/listSvc/';
			 
			    var factory = {
			        fetchAllCompanys: fetchAllCompanys,
			        createCompany: createCompany,
			        updateCompany:updateCompany,
			        deleteCompany:deleteCompany
			    };
			    function fetchAllCompanys() {
			        var deferred = $q.defer();
			        $http.get(REST_SERVICE_URI,{datatype:"json"})
			            .then(
			            function (response) {
			            	console.log("json=", response.data);
			                deferred.resolve(response.data);
			            },
			            function(errResponse){
			                console.error('Error while fetching Company');
			                deferred.reject(errResponse);
			            }
			        );
			        return deferred.promise;
			    }
			 
			    function createCompany(company) {
			        var deferred = $q.defer();
			        $http.post(REST_SERVICE_URI, company)
			            .then(
			            function (response) {
			                deferred.resolve(response.data);
			            },
			            function(errResponse){
			                console.error('Error while creating company');
			                deferred.reject(errResponse);
			            }
			        );
			        return deferred.promise;
			    }
			 
			 
			    function updateCompany(company, id) {
			        var deferred = $q.defer();
			        $http.put(REST_SERVICE_URI+id, company)
			            .then(
			            function (response) {
			                deferred.resolve(response.data);
			            },
			            function(errResponse){
			                console.error('Error while updating company');
			                deferred.reject(errResponse);
			            }
			        );
			        return deferred.promise;
			    }
			 
			    function deleteCompany(id) {
			        var deferred = $q.defer();
			        $http.delete(REST_SERVICE_URI+id)
			            .then(
			            function (response) {
			                deferred.resolve(response.data);
			            },
			            function(errResponse){
			                console.error('Error while deleting company');
			                deferred.reject(errResponse);
			            }
			        );
			        return deferred.promise;
			    }
			    return factory;
		 });
		
		app.controller('myCtrl', function($scope, serviceFactory) {
			$scope.QX = {};
			var self = this;
		    self.user={id:null,username:'',address:'',email:''};
		    self.companys=[];
		 
//		    self.submit = submit;
//		    self.edit = edit;
//		    self.remove = remove;
//		    self.reset = reset;
		 
		 
		    fetchAllCompanys();
		 
		    function fetchAllCompanys(){
		    	serviceFactory.fetchAllCompanys()
		            .then(
		            function(d) {
		            	console.log("what is it = ?" + d);
		            	$scope.varList = d.model.varList;
		            	$scope.QX = {add: d.model.QX.add, cha: d.model.cha, del: d.model.del, edit: d.model.edit};
		            	console.log("what is it$scope.QX = ?" + $scope.QX);
		            },
		            function(errResponse){
		                console.error('Error while fetching Companys');
		            }
		        );
		    }
		 
//		    function createUser(user){
//		        UserService.createUser(user)
//		            .then(
//		            fetchAllUsers,
//		            function(errResponse){
//		                console.error('Error while creating User');
//		            }
//		        );
//		    }
		// 
//		    function updateUser(user, id){
//		        UserService.updateUser(user, id)
//		            .then(
//		            fetchAllUsers,
//		            function(errResponse){
//		                console.error('Error while updating User');
//		            }
//		        );
//		    }
		// 
//		    function deleteUser(id){
//		        UserService.deleteUser(id)
//		            .then(
//		            fetchAllUsers,
//		            function(errResponse){
//		                console.error('Error while deleting User');
//		            }
//		        );
//		    }
		// 
//		    function submit() {
//		        if(self.user.id===null){
//		            console.log('Saving New User', self.user);
//		            createUser(self.user);
//		        }else{
//		            updateUser(self.user, self.user.id);
//		            console.log('User updated with id ', self.user.id);
//		        }
//		        reset();
//		    }
		// 
//		    function edit(id){
//		        console.log('id to be edited', id);
//		        for(var i = 0; i < self.users.length; i++){
//		            if(self.users[i].id === id) {
//		                self.user = angular.copy(self.users[i]);
//		                break;
//		            }
//		        }
//		    }
		// 
//		    function remove(id){
//		        console.log('id to be deleted', id);
//		        if(self.user.id === id) {//clean form if the user to be deleted is shown there.
//		            reset();
//		        }
//		        deleteUser(id);
//		    }
		// 
		// 
//		    function reset(){
//		        self.user={id:null,username:'',address:'',email:''};
//		        $scope.myForm.$setPristine(); //reset Form
//		    }
		 
		});
	</script>


</body>
</html>