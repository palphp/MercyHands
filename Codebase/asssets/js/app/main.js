myapp.controller('main',function($location,$scope, $http, AUTH){

	$scope.is_login = function(){
		if(AUTH.is_login()){
			return true;
		}
		
		return false;
	};
	$scope.logout= function(){
		$http.post(
			'backend/index.php', 
			{
				folder : "members",
				page : "logout"
			}
		).success(
			function(data, status, headers, config) {
				// this callback will be called asynchronously
				// when the response is available
				console.log(data);//return;
				
				if(data.success == true){
					AUTH.logout();
					$location.path("/login");
					
				}else{
					alert(data.Info);
				}
			}
		).error(
			function(data, status, headers, config) {
				// called asynchronously if an error occurs
				// or server returns response with an error status.
				//console.log(data, status, headers, config);
			}
		);
	};
	
});