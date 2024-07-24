<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
	<head>
	<link href="/css/header.css" rel="stylesheet" type="text/css">
	<link href="/css/footer.css" rel="stylesheet" type="text/css">
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
section {
	margin-top: 100px;
	height: 1600px;
}
#container {
	position: relative;
	max-width: 900px;
	padding: 46px 0 40px 0;
	margin: 0px auto;
}
#location {
	position: absolute;
	right: 0;
	top: 11px;
	overflow: hidden;
}
#location ol {
	float: right;
	padding: 0 0 0 7px;
}
ol, ul {
	list-style: none;
}
#location ol li {
	float: left;
	padding: 12px 14px 12px 7px;
	font-size: 13px;
	line-height: 1.1;
	background: url(file:///C:/work/seung/zdown/%EC%87%BC%ED%95%91%EB%AA%B0html_back/images/bg/bg_location.gif)right 12px no-repeat;
}
#location ol li a {
	text-decoration: none;
	
}
#location ol li .last {
	background: url(none);
	color: #333;
	padding: 12px 0 12px 7px;
	color: #888;
}
#pet_content {
	width: 110%;
	height: 1600px;
	vertical-align: baseline;
}
#pet_detail {
	padding: 20px;
	display: flex;
    justify-content: center;
    align-items: center;
}
#pet_detail .img_slide {
	width: 350px;
	height: 400px;
	margin: 0 40px 0 0;
	overflow: hidden;
	display: flex;
	align-items: center;
	padding-right: 50px;
}
#pet_detail .img_slide img{
 	position: relative;
	overflow: hidden;
	border: 1px #DEDEDE solid;
	width: 110%;
	height: 110%;
	object-fit: contain;
	
}
.gil_title {
	width: 100%;
	height: 100px;
	border-bottom: 1px solid #ddd;
	margin-top: 15px;
	line-height: 100px;
}
.gil_title p {
	font-size: 35px;
	font-color: #333;
	text-align: center;
}
#center_map {
	width: 100%;
	height: 400px;
	border: 1px solid black;
}
.center_info {
	height: 400px;
	padding: 30px;
	width: 100%;
}
#center_address {
	height: 130px;
	width: 100%;
	border-bottom: 1px solid #ddd;
}
#center_address p {
	font-color: #000;
	font-size: 25px;
	font-weight: 500;
	line-height: 70px;
	float: left;
}
#center_address p img{
	text-align: left;
}
.center_tel {
	float: right;
}
.center_tel p {
	margin: 0 0;
}
.center_tel p span img{
	margin: 0 2rem 0 3rem;
}
.center_tel p span span{
	margin-top: 4px;
	color: #0D0D0D;
	font-size: 20px;
}
.center_traffic {
	height: 130px;
	width: 100%;
	border-bottom: 1px solid #ddd;
	
}
.center_traffic p{
	color: #E60013;
	font-size: 20px;
}
.center_traffic ul{
	list-style: none;
}
.center_time {
	height: 130px;
	width: 100%;	
}
.center_time li {
	float: left;	
}
#pet_detail .info {
	float: left;
	width: 430px;
	margin: 10px 0 0 0 ;
}
#pet_detail .info .title {
	font-size: 30px;
	font-weight: 600;
	line-height: 1.1;	
	border-bottom: 1px #D9D9D9 solid;
	padding: 0 0 20px 0;
}
#pet_detail .info .title span {
	font-size: 14px;
	font-weight: 600;
	color: #777;
	padding: 0 0 10px 0;
	display: block;
	
}
#pet_detail .info .detail_info {
	width: 100%;
	margin: 25px 0 0 0;
}
#pet_detail .info .detail_info ul li div {
	display: block;
	float: left;
	font-size: 20px;
}
#pet_detail .info .detail_info ul li {
	width: 100%;
	padding: 0 0 16px 0;
}
#pet_detail .info .detail_info ul li span{
	font-size: 20px;
}
#pet_detail .info .detail_info ul li .dInfo {
	width: 100px;
	font-size: 20px;
	margin-right: 10px;
}
#info_map a{
	border: 1px solid #777;
	line-height: 30px;
	margin-left: 10px;
	padding: 1px 2px 1px 2px;
}
	</style>
		<meta charset="UTF-8">
		<title>보호소 지도</title>
	</head>

	<script>
	$(document).ready(function($) {

        $(".scroll_move").click(function(event){         

                event.preventDefault();

                $('html,body').animate({scrollTop:$(this.hash).offset().top}, 600);

        });

});
	
	</script>
	<body>
	  <h2>보호소 지도 불러오기</h2>
	  <section>
		<div id='container'><!-- 전체 틀 -->
			<div id='location'> <!-- Home > 유기견 > 상세페이지 -->
				<ol>
					<li>
						<a href="#">Home</a>
					</li>
					<li>유기견</li>
					<li class='last'>상세페이지</li>
				</ol>
			</div>
			<div id="pet_content"><!-- 상세설명 전체 틀 -->
				<div id="pet_detail"><!-- 제일 상단 -->
					<div class='img_slide'><!-- img -->
						<div class='img'><img src='/다운로드/project_img/멍멍.png' alt='강아지'></div>
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
									<span>5 kg</span>
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
								<li><a href="#center_address" id="scroll_move">위치보기</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class='gil_title'><p>오시는 길</p></div>
				<div id='center_map'>지도 들어갈 공간</div>
				<div class='center_info'> <!-- 센터위치정보 전체 틀 -->
				<!-- 1 주소연락처 -->
					<div id='center_address'>
						<p class='address'><img src="/다운로드/project_img/map_icon.png">서울 강남구 영동대로 302 (국민제1빌딩 3,4층)</p>
						<div class='center_tel'>
							<p><span><img src='/다운로드/project_img/tel_ic.png'><span><b>TEL</b><br>02)123-4567</span></span></p>
						</div>
					</div> <!-- 1 주소연락처 끝 -->
				<!-- 2 교통편 -->
					<div class='center_traffic'>
						<p>교통편</p>
						<ul>
							<li>
								<p>버스</p>
							</li>
							<li>지하철</li>
						</ul>
					</div> <!-- 2 교통편 끝-->
				
				<!-- 3 영업시간 -->
					<div>
						<p>영업시간</p>
						<div>09:00 ~ 20:00 (주말 및 공휴일 제외)</div>
					</div>
					<!-- 3 영업시간 끝 -->
				</div>
			</div>
		</div>
	</section>
	</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>