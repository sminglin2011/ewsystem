'use strict';
angular.module("app").controller('myCtrl', function($scope, serviceFactory) {
			var vm = this;
			vm.QX = {add:'', del:'', edit:'', cha:''};
			vm.varList = [];
			
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
		    	layer.msg('delete model, in development!', {icon: 5,time:2000});
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