myapp.controller('campaign',function($sce,$scope, $http, AUTH, $location, $routeParams){
	$scope.campaign = [];
	
	/* function initiate_facebook_plugin(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=1481656762057304&version=v2.0";
		fjs.parentNode.insertBefore(js, fjs);
	};
	
	
	initiate_facebook_plugin(document, 'script', 'facebook-jssdk'); */
	$scope.get_secure_url = function(data){
		if(data){return $sce.trustAsResourceUrl(data.replace("watch?v=", "v/"));}
		
	};
	
	
	var params = {
		"folder":"campaigns",
		"page":"details",
		"id": $routeParams.id
	};
	$http.post(
		'backend/index.php', 
		params
	).success(
		function(data, status, headers, config) {
			// this callback will be called asynchronously
			// when the response is available
			if(data.success == true){
				$scope.campaign = data.Info[0];
			}
			console.log($scope.campaign);
		}
	).error(
		function(data, status, headers, config) {
			// called asynchronously if an error occurs
			// or server returns response with an error status.
			//console.log(data, status, headers, config);
		}
	);
	
});