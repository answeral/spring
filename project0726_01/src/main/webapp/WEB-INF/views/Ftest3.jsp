<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ftest3 페이지</title>
	</head>
	<div id="map" style="width:100%;height:500px;"></div>

	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d6a3e4e63ce6514f39f88e53f8535e7e&libraries=services"></script>
			
	<script>
	var addressArr = [];
	var positionsData = [];

	// 서버에서 주소 데이터를 받아오는 함수
	function fetchAddressData() {
	    fetch('/getAnimalData')
	        .then(response => response.json())
	        .then(data => {
	            // 서버에서 받아온 JSON 데이터를 addressArr에 추가
	            addressArr = data.map(item => item.careAddr);
	            console.log('Received addresses:', addressArr);

	            // 주소별로 좌표를 검색하고 positionsData에 추가
	            addressArr.forEach(address => {
	                var geocoder = new kakao.maps.services.Geocoder();
	                geocoder.addressSearch(address, function(result, status) {
	                    if (status === kakao.maps.services.Status.OK) {
	                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                        positionsData.push({ title: address, latlng: coords });
	                        console.log('Added position:', positionsData);

	                        // 모든 주소를 처리한 후 지도에 마커 표시
	                        if (positionsData.length === addressArr.length) {
	                            displayMarkers();
	                        }
	                    }
	                });
	            });
	        })
	        .catch(error => console.error('Error fetching address data:', error));
	}

	// 마커를 지도에 표시하는 함수
	function displayMarkers() {
	    var mapContainer = document.getElementById('map');
	    var mapOption = {
	        center: new kakao.maps.LatLng(37.4851520949372, 126.898809246391),
	        level: 10
	    };

	    var map = new kakao.maps.Map(mapContainer, mapOption);

	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png';
	    var imageSize = new kakao.maps.Size(24, 35);
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

	    positionsData.forEach(position => {
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: position.latlng,
	            title: position.title,
	            image: markerImage
	        });
	    });
	}

	// 페이지 로드 시 주소 데이터를 가져와서 처리
	fetchAddressData();
	</script>
	<body>
		<h2>Ftest3 페이지</h2>
		
	</body>
</html>