'use strict';
angular.module("app").controller('myCtrl', function($scope, serviceFactory) {
			var vm = this;
			vm.QX = {add:'', del:'', edit:'', cha:''};
			vm.varList = [];
			vm.model = {};
			
			vm.submit = submit;
		    vm.edit = edit;
		    vm.remove = remove;
		    vm.reset = reset;
		    
		    fetchAllObjects();
		 
		    function fetchAllObjects(){
		    	serviceFactory.fetchAllObjects()
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
		 
		    function createObject(obj){
		    	serviceFactory.createObject(obj)
		            .then(
		            fetchAllObjects,
		            function(errResponse){
		                console.error('Error while creating Ctrl');
		            }
		        );
		    }
		 
		    function updateObject(obj, id){
		    	serviceFactory.updateObject(obj, id)
		            .then(
		            fetchAllObjects,
		            function(errResponse){
		                console.error('Error while updating Object on Ctrl');
		            }
		        );
		    }
		    function deleteObject(id){
		    	serviceFactory.deleteObject(id)
		            .then(
		            fetchAllObjects,
		            function(errResponse){
		                console.error('Error while deleting object on Ctrl');
		            }
		        );
		    }
		 
		    function submit() {
		        //if(self.user.id===null){
		        //    console.log('Saving New User', self.user);
		        //    createUser(self.user);
		        //}else{
		        //    updateUser(self.user, self.user.id);
		        //    console.log('User updated with id ', self.user.id);
		        //}
		        reset();
		    }
		// 
		    function edit(id){
		    	console.log("eidt", id);
		    	vm.model = id;
		    	layer.open({
		    		  type: 1,
		    		  title: false,
		    		  closeBtn: 1,
		    		  area: '516px',
		    		  skin: 'layui-layer-nobg', //没有背景色
		    		  shadeClose: false,
		    		  content: $('#editDiv')
		    		});
		    	/*
		    	//iframe层-父子操作
		    	layer.open({
		    	  type: 2,
		    	  area: ['700px', '530px'],
		    	  fixed: false, //不固定
		    	  maxmin: true,
		    	  content: 'company/goEdit.do?COMPANY_ID='+id
		    	});*/
		    }
		 
		    function remove(id){
//		        console.log('id to be deleted', id);
//		        if(self.user.id === id) {//clean form if the user to be deleted is shown there.
//		            reset();
//		        }
//		        deleteUser(id);
		    }

	 
		    function reset(){
		        //self.user={id:null,username:'',address:'',email:''};
		        //$scope.myForm.$setPristine(); //reset Form
		    }
		 
		});