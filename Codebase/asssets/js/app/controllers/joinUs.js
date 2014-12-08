myapp.controller('joinUs',function($scope,$http,AUTH,$location){

	$scope.handle_form = function(){
		
		
		var params = {
			name : $scope.joinus_form.fullname,
			email : $scope.joinus_form.email,
			password : $scope.joinus_form.password,
			check : $scope.joinus_form.agree
		};
		
		if(
			!params.name ||
			!params.email ||
			!params.password
		){
			console.log("invalid params !");
			return;
		}
		
		params.folder = "members";
		params.page = "register";
		
		
		$http.post(
			'backend/index.php', 
			params
		).success(
			function(data, status, headers, config) {
				// this callback will be called asynchronously
				// when the response is available
				console.log(data);//return;
				
				if(data.success == true){
				
					AUTH.login(data.Info);
					$location.path("/");
					
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