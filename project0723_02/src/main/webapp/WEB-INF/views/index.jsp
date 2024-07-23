<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b65b85b42cdb0c93154ad10c8e8184c"></script>
		<script>
			$(document).ready(function($) {
		
		        $(".scroll_move").click(function(event){         
		
		                event.preventDefault();
		
		                $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
		
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
		#map{margin-top:100px; border:1px solid black; width:100px; height:100px; display: inline-block;}
		
	</style>
	<script >
		$(function(){
			$.ajax({
				url:"index",
				type="post",
				data:{},
				dataType:{},
				success:function(data){
					alert("성공");
					console.log("data : "+data);
					let arr = data.response.body.itmes.item;
					
					let htmlData = "";
					for(let i=0; i<arr.length;i++){
						htmlData += "";
						
					}
					$("").html(htmlData);
				},
				error:function(){
					alert("실패");
				}
			});//ajax
		});//jquery
	
	
	
	</script>
	</head>
	<body>
		<h2>테스트 페이지</h2>
		<div id="map" style="width:500px;height:400px;"></div> <!--  지도표시 div  -->
		<script>
			var container = document.getElementById('map'); 
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),//지도 중심좌효
				level: 3 //지도 확대 레벨
			};
		    // 지도 생성
			var map = new kakao.maps.Map(container, options);
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
		
			</script>

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
			
			
			<div id="div1">div1</div>
			
			
			<div id="div2">div2</div>
			
			
			<div id="div3">div3</div>
			
			
			<div id="div4">div4</div>
			
			
	</body>
</html>