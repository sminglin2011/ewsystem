app.factory('serviceFactory', ['$http', '$q', function($http, $q){
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
//angular.module("app")
app.directive("select2",function($timeout,$parse){
    return {
        restrict: 'AC',
        link: function(scope, element, attrs) {
            var options = [],
                el = $(element),
                angularTriggeredChange = false,
                selectOptions = attrs["selectOptions"].split(" in "),
                propertys = selectOptions[0].split(" n "),
                property = propertys[0],
                property_text = propertys[1],
                optionsObject = selectOptions[1];
            // watch for changes to the defining data model
            scope.$watch(optionsObject, function(n, o){
                var data = [];
                // format the options for select2 data interface
                for(var i in n) {
                    var obj = {id:n[i][property] , text: n[i][property]};
                    data.push(obj);
                }
                el.select2({data: data});
                // keep local copy of given options
                options = n;
            }, true);
            // watch for changes to the selection data model
            scope.$watch(attrs["ngModel"], function(n, o) {
                // select2 is indexed by the array position,
                // so we iterate to find the right index
                for(var i in options) {
                    if(options[i][property] === n) {
                        angularTriggeredChange = true;
                       // el.val(i).trigger("change");
                    }
                }
            }, true);
            // Watch for changes to the select UI
            el.select2().on("change", function(e){
                // if the user triggered the change, let angular know
                if(!angularTriggeredChange) { 
                    scope.$eval(attrs["ngModel"]+"='"+options[property]+"'");
                    scope.$digest();
                }
                // if angular triggered the change, then nothing to update
                angularTriggeredChange = false;
            });

        }
    };
});