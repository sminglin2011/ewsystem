angular.module('app').factory('serviceFactory', ['$http', '$q', function($http, $q){
		 //angular.module("app").factory('serviceFactory', function($http, $q){
			 
			 //var REST_SERVICE_URI = 'company/listSvc/';
			 
			    var factory = {
			        fetchAllObjects: fetchAllObjects,
			        postData: postData,
			        creditor: creditor,
			        debitor: 10000
			    };
			    function creditor() {
			    	var deferred = $q.defer();
			    	deferred.resolve(20000);
			    }
			    function fetchAllObjects(url) {
			        var deferred = $q.defer();
			        $http.get(url,{datatype:"json"}) //REST_SERVICE_URI
			            .then(
			            function (response) {
			                deferred.resolve(response.data);
			            },
			            function(errResponse){
			                console.error('Error while fetching Object on service');
			                deferred.reject(errResponse);
			            }
			        );
			        return deferred.promise;
			    }
			    function postData(url, obj){
			    	console.log("post data 2 ", url);
			    	var deferred = $q.defer();
			        $http.post( url, obj,
			          	{
			        		headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' } //application/x-www-form-urlencoded; charset=UTF-8}
			          	}
			        ).then(function(response) {// success
			  	    	deferred.resolve(response.data);
			  	    }, 
			  	    function(errResponse) { // optional // failed
			  	    	console.error('Error while updating Object on service');
		                deferred.reject(errResponse);
			  	    });
			        
			        return deferred.promise;
			    }

			    return factory;
		 }]);