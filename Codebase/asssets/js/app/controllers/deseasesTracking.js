myapp.controller('deseasesTracking',function($scope,$http){
	
	$scope.deseases = [];
	var locations = [];
	
	function drawMap() {
		/* locations = [
			['Bondi Beach', -33.890542, 151.274856, 4],
			['Coogee Beach', -33.923036, 151.259052, 5],
			['Cronulla Beach', -34.028249, 151.157507, 3],
			['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
			['Maroubra Beach', -33.950198, 151.259302, 1]
		]; */

		var map = new google.maps.Map(document.getElementById('map-canvas'), {
			zoom: 10,
			center: new google.maps.LatLng(-33.92, 151.25),
			mapTypeId: google.maps.MapTypeId.ROADMAP
		});

		var infowindow = new google.maps.InfoWindow();

		var marker, i;

		for (i = 0; i < locations.length; i++) {  
			marker = new google.maps.Marker({
				position: new google.maps.LatLng(locations[i][1], locations[i][2]),
				map: map
			});

			google.maps.event.addListener(marker, 'click', (function(marker, i) {
				return function() {
					infowindow.setContent(locations[i][0]);
					infowindow.open(map, marker);
				}
			})(marker, i));
		}
	}
	//initialize();
	//google.maps.event.addDomListener(window, 'load', initialize);
	
	// Simple GET request example :
	$http.post(
		'backend/index.php', 
		{
			folder: "infections",
			page: "view" ,
			start: 1 ,
			limit: 30
		}
	).success(
		function(data, status, headers, config) {
			// this callback will be called asynchronously
			// when the response is available
			if(data.success == true){
				$scope.deseases = data.Info;
				
				var location = [];
				for(var i = 0; i < $scope.deseases.length ; i++){
					location = [
						$scope.deseases[i].title, 
						parseFloat($scope.deseases[i].longitude), 
						parseFloat($scope.deseases[i].latitude), 
						(i + 1)
					];
					locations.push(location);
				}
				drawMap();
			}
		}
	).error(
		function(data, status, headers, config) {
			// called asynchronously if an error occurs
			// or server returns response with an error status.
			//console.log(data, status, headers, config);
		}
	);
});