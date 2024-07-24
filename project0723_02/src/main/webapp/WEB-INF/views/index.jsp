<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>테스트 페이지</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b65b85b42cdb0c93154ad10c8e8184c"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			$(document).ready(function($) {
		
		        $(".scroll_move").click(function(event){         
		
		                event.preventDefault();
		
		                $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
		
		        });
		
		});
		</script>
		
		<script>
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

            // 데이터 불러오기 버튼 클릭 시 AJAX 요청
            $("#sBtn").click(function(){
                alert("버튼 클릭");

                $.ajax({
                    url: "/public_data", // Spring Controller에서 정의한 URL
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        console.log("Received data:", data);

                        // 데이터를 반복해서 처리하고 지도에 마커 추가
                        data.response.body.items.item.forEach(function(item) {
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
                });
            });
        });
    </script>
		
	<style>
		#div1{border:1px solid black; width:100px; height:100px; background-color:yellow;}
		#div2{border:1px solid black; width:100px; height:100px; background-color:blue;}
		#div3{border:1px solid black; width:100px; height:100px; background-color:green;}
		#div4{border:1px solid black; width:100px; height:100px; background-color: red;}
		#center_map{margin-top:100px;border:1px solid black; width:100px; height:100px; display: inline-block;}
		.center_info{margin-top:100px;border:1px solid black; width:100px; height:100px; display: inline-block;}
		#map{margin-top:100px; border:1px solid black; width:100px; height: 500px; display: inline-block;}
		
	</style>
	
	</head>
	<body onload="initMap()">
	
	<h2>테스트 페이지</h2>
	
	  
		<div id="map" style="width:500px;height:400px;"></div>
    	<button id="sBtn">데이터 불러오기</button>
		
		
			
			<!-- -------------------------------------------------------------------------- -->
			<div class='gil_title'><p>오시는 길</p></div>
			<div id='center_map'></div>
				<div class='center_info'> <!-- 위치정보 -->
				
				<div> <!-- 이미지 -->이미지</div>
			</div>

			<div class="scroll-moveBox flex flex-br-c">
			  <ul>
			    <li><a href="#div1" id="scroll_move">div1로 이동</a></li>
			    <li><a href="#div2" id="scroll_move">div2로 이동</a></li>
			    <li><a href="#div3" id="scroll_move">div3로 이동</a></li>
			    <li><a href="#div4" id="scroll_move">div4로 이동</a></li>
			  </ul>
			</div>
			
			
			
			
			
			<div id="div2">div2</div>
			
			
			<div id="div3">div3</div>
			
			
			<div id="div4">div4</div>
			
			
	</body>
</html>