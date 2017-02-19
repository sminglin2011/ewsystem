var app = angular.module('app', []);//'ui.bootstrap'
/**
 * select2封装
 * @param {scope} ng-model 选中的ID
 * @param {scope} select2-model 选中的详细内容
 * @param {scope} config 自定义配置
 * @param {String} [query] 内置的配置 (怎么也还得默认一个config)
 * @example
 * <input select2 ng-model="a" select2-model="b" config="config" type="text" placeholder="占位符" />
 * <input select2 ng-model="a" select2-model="b" config="default" query="member" type="text" placeholder="占位符" />
 * <select select2 ng-model="b" class="form-control"></select>
 */
app.directive('select2', function (select2Query) {
    return {
        restrict: 'A',
        scope: {
            config: '=',
            ngModel: '=',
            select2Model: '='
        },
        link: function (scope, element, attrs) {
            // 初始化
            var tagName = element[0].tagName,
                config = {
                    allowClear: true,
                    multiple: !!attrs.multiple,
                    placeholder: attrs.placeholder || ' '   // 修复不出现删除按钮的情况
                };

            // 生成select
            if(tagName === 'SELECT') {
                // 初始化
                var $element = $(element);
                delete config.multiple;

                $element
                    .prepend('<option value=""></option>')
                    .val('')
                    .select2(config);

                // model - view
                scope.$watch('ngModel', function (newVal) {
                    setTimeout(function () {
                        $element.find('[value^="?"]').remove();    // 清除错误的数据
                        $element.select2('val', newVal);
                    },0);
                }, true);
                return false;
            }

            // 处理input
            if(tagName === 'INPUT') {
                // 初始化
                var $element = $(element);

                // 获取内置配置
                if(attrs.query) {
                    scope.config = select2Query[attrs.query]();
                }

                // 动态生成select2
                scope.$watch('config', function () {
                    angular.extend(config, scope.config);
                    $element.select2('destroy').select2(config);
                }, true);

                // view - model
                $element.on('change', function () {
                    scope.$apply(function () {
                        scope.select2Model = $element.select2('data');
                    });
                });

                // model - view
                scope.$watch('select2Model', function (newVal) {
                    $element.select2('data', newVal);
                }, true);

                // model - view
                scope.$watch('ngModel', function (newVal) {
                    // 跳过ajax方式以及多选情况
                    if(config.ajax || config.multiple) { return false }

                    $element.select2('val', newVal);
                }, true);
            }
        }
    }
});

/**
 * select2 内置查询功能
 */
app.factory('select2Query', function ($timeout) {
    return {
        testAJAX: function () {
            var config = {
                minimumInputLength: 1,
                ajax: {
                    url: "http://localhost8080/ewsystem/chartofaccount/listSvc",
                    dataType: 'json',
//                    data: function (term) {
//                        return {
//                            q: term,
//                            page_limit: 10,
//                            apikey: "ju6z9mjyajq2djue3gbvv26t"
//                        };
//                    },
                    results: function (data, page) {
                        return {results: data.movies};
                    }
                },
                formatResult: function (data) {
                    return data.title;
                },
                formatSelection: function (data) {
                    return data.title;
                }
            };

            return config;
        }
    }
});
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
app.directive("myTable", function() {
	return function(scope, element, attrs) {
        // apply DataTable options, use defaults if none specified by user
        var options = {};
        if (attrs.myTable.length > 0) {
            options = scope.$eval(attrs.myTable);
        } else {
            options = {
                "bStateSave": true,
                "iCookieDuration": 2419200, /* 1 month */
                "bJQueryUI": true,
                "bPaginate": false,
                "bLengthChange": false,
                "bFilter": false,
                "bInfo": false,
                "bDestroy": true
            };
        }
        //console.log(options,"options");
        var explicitColumns = [];
        element.find('th').each(function(index, elem) {
            explicitColumns.push({"title":$(elem).text()});
        });
        
        console.log(explicitColumns,"explicitColumns");
        if (explicitColumns.length > 0) {
            options["aoColumns"] = explicitColumns;
        } else if (attrs.aoColumns) {
            options["aoColumns"] = scope.$eval(attrs.aoColumns);
        }
        
        if (attrs.aoColumnDefs) {
            options["aoColumnDefs"] = scope.$eval(attrs.aoColumnDefs);
        }
        
        if (attrs.fnRowCallback) {
            options["fnRowCallback"] = scope.$eval(attrs.fnRowCallback);
        }
       
        // apply the plugin
        var dataTable = element.dataTable(options);
        console.log(scope.$eval(attrs.aaData),"aa");
        
        scope.$watch(attrs.aaData, function(value) {
        	console.log(attrs.aaData,"attrs.aaData");
            var val = value || null;
            if (val) {
                dataTable.fnClearTable();
                dataTable.fnAddData(scope.$eval(attrs.aaData));
            }
        }); 
    };
});

