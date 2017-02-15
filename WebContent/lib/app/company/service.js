angular.module('app').factory('serviceFactory', ['$http', '$q', function($http, $q){
		 //angular.module("app").factory('serviceFactory', function($http, $q){
			 
			 var REST_SERVICE_URI = 'company/listSvc/';
			 
			    var factory = {
			        fetchAllObjects: fetchAllObjects,
			        createObject: createObject,
			        updateObject:updateObject,
			        deleteObject:deleteObject
			    };
			    function fetchAllObjects() {
			        var deferred = $q.defer();
			        $http.get(REST_SERVICE_URI,{datatype:"json"})
			            .then(
			            function (response) {
			            	console.log("json=", response.data);
			                deferred.resolve(response.data);
			            },
			            function(errResponse){
			                console.error('Error while fetching Object on service');
			                deferred.reject(errResponse);
			            }
			        );
			        return deferred.promise;
			    }
			 
			    function createObject(obj) {
			        var deferred = $q.defer();
			        $http.post(REST_SERVICE_URI, obj)
			            .then(
			            function (response) {
			                deferred.resolve(response.data);
			            },
			            function(errResponse){
			                console.error('Error while creating Object on service');
			                deferred.reject(errResponse);
			            }
			        );
			        return deferred.promise;
			    }
			 
			 
			    function updateObject(obj, id) {
			        var deferred = $q.defer();
			        $http.put(REST_SERVICE_URI+id, obj)
			            .then(
			            function (response) {
			                deferred.resolve(response.data);
			            },
			            function(errResponse){
			                console.error('Error while updating Object on service');
			                deferred.reject(errResponse);
			            }
			        );
			        return deferred.promise;
			    }
			 
			    function deleteObject(id) {
			        var deferred = $q.defer();
			        $http.delete(REST_SERVICE_URI+id)
			            .then(
			            function (response) {
			                deferred.resolve(response.data);
			            },
			            function(errResponse){
			                console.error('Error while deleting Object on service');
			                deferred.reject(errResponse);
			            }
			        );
			        return deferred.promise;
			    }
			    return factory;
		 }]);