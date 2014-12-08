myapp.controller('signIn',function($scope, $http, AUTH, $location){
	$scope.handle_form = function(){
		//console.log($scope.signin_form);
		
		var params = {
			email : $scope.signin_form.loginEmail,
			password : $scope.signin_form.inputPassword,
			rememberme : $scope.signin_form.rememberme
		};
		
		if(
			!params.email ||
			!params.password
		){
			console.log("invalid params !");
			return;
		}
		
		params.folder = "members";
		params.page = "login";
		
		
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
					$('#signIn').modal('hide')
					
					
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