myapp.factory('AUTH',function($cookieStore){
	return {
		logout : function(){
			$cookieStore.remove("_user");
		},
		login : function(_user){
			$cookieStore.put("_user", _user);
		},
		is_login : function(){
			var user = $cookieStore.get("_user");			
			if(user){
				return true;
			}
			return false;
		}
	};
});