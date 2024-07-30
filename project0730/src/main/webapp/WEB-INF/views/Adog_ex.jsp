<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Adog_ex</title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" href="/css/footer.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/Adog_ex.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d6a3e4e63ce6514f39f88e53f8535e7e&libraries=services"></script>
    <style>
    	.win_index {width: 250px; height: 80px; padding:5px;  text-align: center; display: block; background: #50627F; 
    	color: #fff; text-align: center; line-height:22px;  border-radius:4px; padding-top: 23px; }
    
    </style>
</head>
<body>
<script>
    $(function(){
        $.ajax({
            url: "public_data2",
            type: "post",
            data: {},
            dataType: "json",
            success: function(data) {
                alert("성공");

                // 데이터 처리
                let arr = data.response.body.items.item; // 받은 데이터에서 필요한 배열 추출
                let dataMap = {}; // desertionNo를 키로 하는 데이터 저장 객체

                for (let i = 0; i < arr.length; i++) {
                    let desertionNo = arr[i].desertionNo;
                    if (!dataMap[desertionNo]) {
                        dataMap[desertionNo] = {
                            address: arr[i].careAddr,
                            name: arr[i].careNm,
                            tel: arr[i].careTel
                        };
                    }
                }

                // 중복 제거된 데이터 출력
                console.log("중복 제거된 데이터:", dataMap);

                // 주소 배열 추출
                let uniqueAddresses = Object.values(dataMap).map(item => item.address);
                console.log("중복 제거된 careAddr 목록:", uniqueAddresses);

                // 주소-좌표 변환 및 마커 추가
                convertAddressToCoords(uniqueAddresses, dataMap);
            },
            error: function(xhr, status, error) {
                alert("실패");
            }
        });

        function convertAddressToCoords(addresses, dataMap) {
            var geocoder = new kakao.maps.services.Geocoder();
            var mapContainer = document.getElementById('center_map');
            var mapOption = { 
                center: new kakao.maps.LatLng(37.4851520949372, 126.898809246391), // 지도의 중심좌표
                level: 15 // 지도의 확대 레벨
            };
            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            addresses.forEach(function(address) {
                geocoder.addressSearch(address, function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                        
                        // 마커 생성
                        var marker = new kakao.maps.Marker({
                            map: map,
                            position: coords,
                            title: address
                        });

                        // 마커를 지도에 표시합니다.
                        marker.setMap(map);

                        // 주소에 해당하는 데이터가 있는지 확인합니다.
                        let data = Object.values(dataMap).find(item => item.address === address);

                        if (data) {
                            // 인포윈도우 내용 설정
                            var iwContent = '<div class="win_index">' +
                                '<div>전화번호: ' + data.tel + '</div>' +
                                '<div>이름: ' + data.name + '</div>' +
                                '</div>';
                            
                            // 인포윈도우를 생성합니다
                            var infowindow = new kakao.maps.InfoWindow({
                                content : iwContent,
                                removable : true
                            });

                            // 마커에 클릭 이벤트를 등록합니다
                            kakao.maps.event.addListener(marker, 'click', function() {
                                // 마커 위에 인포윈도우를 표시합니다
                                infowindow.open(map, marker);  
                            });
                        } else {
                            console.log('주소 데이터 없음:', address);
                        }
                    } else {
                        console.log('지오코더 실패: ' + status);
                    }
                });
            });
        }
    });

    </script>
<jsp:include page="/WEB-INF/views/header.jsp"/>
	<section>
		<div id='container'><!-- 전체 틀 -->
			<div id='location'> <!-- Home > 유기견 > 상세페이지 -->
				<ol>
					<li class='step'><a href="/index">Home</a></li>
					<li class='step'>유기견</li>
					<li>상세페이지</li>
				</ol>
			</div>
			<div id="pet_content"><!-- 상세설명 전체 틀 -->
				<div id="pet_detail"><!-- 제일 상단 -->
					<div class='img_slide'><!-- img -->
						<div class='img'><img src='/project_img/멍멍.png' alt='강아지'></div>
					</div>
					<div class='info'> <!-- 동물 정보 -->
						<p class='title'><span>[강아지]</span>떡국</p>
						<div class='detail_info'>
							<ul>
								<li>
									<div class='dInfo'>나이</div>
									<span>1살</span>
								</li>
								<li>
									<div class='dInfo'>종</div>
									<span>차우차우</span>
								</li>
								<li>
									<div class='dInfo'>몸무게</div>
									<span>5kg</span>
								</li>
								<li>
									<div class='dInfo'>성별</div>
									<span>남자</span>
								</li>
								<li>
									<div class='dInfo'>색깔</div>
									<span>베이지</span>
								</li>
								<li>
									<div class='dInfo'>특징</div>
									<span>통통하고 귀여움</span>
								</li>
								<li>
									<div class='dInfo'>중성화</div>
									<span>O</span>
								</li>
								<li id='info_map'>
									<div class='dInfo'>보호위치</div>
									<div><span>서울시 관악구 OO 보호센터</span></div>
								</li>
								<li><a href="#center_map" id="scroll_move"><img src="/project_img/map.png"></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class='gil_title'><p>오시는 길</p></div>
				<div id='center_map'></div>
				<div class='center_info'> <!-- 센터위치정보 전체 틀 -->
				<!-- 1 주소연락처 -->
					<div class='center_address'>
						<p class='Caddress'><img src="/project_img/map_icon.png">서울 강남구 영동대로 302 (국민제1빌딩 3,4층)</p>
						<div class='center_tel'>
						<img src='/project_img/tel_ic.png'>
							
								<span>TEL<br>02)123-4567</span>
							
						</div>
					</div> <!-- 1 주소연락처 끝 -->
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>