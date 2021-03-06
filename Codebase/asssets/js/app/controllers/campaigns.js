myapp.controller('campaigns',function($scope, $http, AUTH, $location){
	$scope.campaigns = [];
	
	$http.post(
		'backend/index.php', 
		{
			"folder":"campaigns",
			"page":"view",
			"start":0,
			"limit":30
		}
	).success(
		function(data, status, headers, config) {
			// this callback will be called asynchronously
			// when the response is available
			if(data.success == true){
				$scope.campaigns = data.Info;
			}
			console.log($scope.campaigns);
		}
	).error(
		function(data, status, headers, config) {
			// called asynchronously if an error occurs
			// or server returns response with an error status.
			//console.log(data, status, headers, config);
		}
	);
	
	$scope.help_now = function(id){
		
		$location.path("/campaign/"+id);
	};
	
});