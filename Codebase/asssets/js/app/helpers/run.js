/**
 * Created by hp on 12/5/2014.
 */
myapp.run(function (
    $rootScope,
    AUTH,
    $location
    ) {
    $rootScope.$on('$routeChangeStart',
        function (evt, next, curr) {

            var current = next.$$route ? next.$$route.controller : "";
            var previous = (curr && curr.$$route) ? curr.$$route.controller : "";

            if(previous){
                $rootScope.$broadcast('previous-page-exists',true);
            }

			/* console.log((next	));
			console.log(["signIn","joinUs"].indexOf(current));
			console.log(AUTH.is_login()); */
			if(["signIn","joinUs"].indexOf(current) !== -1 &&
				AUTH.is_login()
			){
				$location.path("/");
			}

            
        }
    );

});