<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>careAddr 페이지</title>
	</head>
	<div id="map" style="width:100%;height:500px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b65b85b42cdb0c93154ad10c8e8184c"></script>
			
	<body>
		<h2>careAddr 페이지</h2>
		<div id="map" style="width:100%;height:350px;"></div> 
		<script> 
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = { 
				center: new kakao.maps.LatLng(37.5665, 126.9780), // 지도의 중심좌표 
				}; 
				level: 3 // 지도의 확대 레벨 
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다 
				// Spring Boot 에서 데이터를 받아옵니다. 
				fetch('/getAnimalData')
			    .then(response => response.text()) // XML 데이터를 문자열로 변환
			    .then(xmlString => {
			        // XML 문자열을 파싱하여 XML 문서로 변환
			        var parser = new DOMParser();
			        var xmlDoc = parser.parseFromString(xmlString, 'text/xml');
			
			        // XML 문서에서 필요한 데이터를 추출 (예: careAddr)
			        var careAddr = xmlDoc.getElementsByTagName('careAddr')[0].textContent;
			
			        // 추출한 데이터를 사용하여 원하는 작업을 수행
			        var geocoder = new kakao.maps.services.Geocoder();
			        geocoder.addressSearch(careAddr, function(result, status) {
			            if (status === kakao.maps.services.Status.OK) {
			                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			                var marker = new kakao.maps.Marker({
			                    map: map,
			                    position: coords
			                });
			                map.setCenter(coords);
			            }
			        });
			    })
			    .catch(error => console.error('Error fetching XML:', error));
			        });
			    });
		</script> 
		
	</body>
</html>