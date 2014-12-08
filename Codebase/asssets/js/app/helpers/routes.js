myapp.config(['$routeProvider',function($routeProvider) {
	$routeProvider.when('/', {
		templateUrl: 'asssets/js/app/views/home.html',
		controller: 'home'
	}).when('/newcampaign', {
		templateUrl: 'asssets/js/app/views/newcampaign.html',
		controller: 'newcampaign'
	}).when('/campaign/:id', {
		templateUrl: 'asssets/js/app/views/campaign.html',
		controller: 'campaign'
	}).when('/login', {
		templateUrl: 'asssets/js/app/views/login.html',
		controller: 'signIn'
	}).when('/register', {
		templateUrl: 'asssets/js/app/views/register.html',
		controller: 'joinUs'
	}).when('/deseasesTracking', {
		templateUrl: 'asssets/js/app/views/deseasesTracking.html',
		controller: 'deseasesTracking'
	}).when('/campaigns', {
		templateUrl: 'asssets/js/app/views/campaigns.html',
		controller: 'campaigns'
	}).otherwise({
		redirectTo: '/'
	});
}]);