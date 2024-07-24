<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6a3e4e63ce6514f39f88e53f8535e7e"></script>
	</head>
	<body>
		<h2>테스트 페이지</h2>
		
		 	<script>
		 	 // 카카오지도 초기화
            $(document).ready(function() {
            var map;

            // 카카오지도 초기화
            function initMap() {
                var mapContainer = document.getElementById('map');
                var mapOption = {
                    center: new kakao.maps.LatLng(37.5665, 126.978), // 초기 지도 중심 좌표 (서울)
                    level: 10 // 초기 지도 확대 레벨
                };
                map = new kakao.maps.Map(mapContainer, mapOption);
            }

				$(function(){
					$("#sBtn").click(function(){
						alert("검색버튼 클릭");
						
					   $.ajax({
							url:"public_data",
							type:"post",
							data:{},
							dataType;"json",
							success:function(data){
								alert("성공");
								console.log("controller data : "+data);
								let arr = data.response.body.items.item;
								 // 데이터를 반복해서 처리하고 지도에 마커 추가
		                       	arr.forEach(function(item) {
		                            var markerPosition = new kakao.maps.LatLng(parseFloat(item.lat), parseFloat(item.lng));

		                            // 마커 생성
		                            var marker = new kakao.maps.Marker({
		                                position: markerPosition,
		                                map: map,
		                                title: item.careNm // 마커에 보호소 이름 추가
		                            });

		                            // 마커에 클릭 이벤트 추가
		                            kakao.maps.event.addListener(marker, 'click', function() {
		                                alert('선택한 보호소: ' + item.careNm + '\n주소: ' + item.careAddr);
		                            });
		                        });
		                    },
		                    error: function(xhr, status, error) {
		                        console.error("Failed to fetch data:", error);
		                    }
						   
					   })//ajax
					});//sBtn
				});//jqery
		
		 	</script>
		
			<div id="map" style="width:500px;height:400px; border: 1px solid Black;"></div>
    		<button id="sBtn">데이터 불러오기</button>
	</body>
</html>