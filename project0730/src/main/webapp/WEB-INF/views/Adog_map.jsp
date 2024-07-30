<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Adog_map</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d6a3e4e63ce6514f39f88e53f8535e7e&libraries=services"></script>
    <style>
    	.win_index {width: 250px; height: 80px; padding:5px;  text-align: center; display: block; background: #50627F; 
    	color: #fff; text-align: center; line-height:22px;  border-radius:4px; padding-top: 23px; }
    
    </style>
</head>
<body>
    <div id="map" style="width:100%; height:500px;"></div>

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
            var mapContainer = document.getElementById('map');
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
</body>
</html>
