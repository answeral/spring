<%--피부질환진단 결과--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" type="text/css" href="/css/top.css">
	<link rel="stylesheet" type="text/css" href="/css/diagnosis/dom.css">
	<link rel="stylesheet" type="text/css" href="/css/footer.css">
	<title>HappyPawPet</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
</head>
<body>
		<%@ include file="../top/top.jsp" %>
		<!-- -------------------------------------------------------------------------------------------- -->
		<section>
		<div class="box1">
			<h2 id="heading" style="width: 400px; height: 100px; margin: 100px 10px 1px 350px;
			font-size: 43px;">oo님의 강아지 사진</h2>
			<div id="prod-img" style="float: left; margin-right: 40px; margin: 1px 10px 30px 350px;">
				<img src="/image/skinpro.jpg" alt="진드기" width="600" height="400">
			</div>
		</div>

		<div class="box2" style="width: 600px; height: 400px; display: inline-block; margin: 1px 10px 20px 350px;">
				<h2 class="heading2" style="font-weight: 1000;">질환 정보</h2>
				<p>oo님 강아지가 가지고 있는 질환으로 의심되는 <span style="color:red;">진드기</span>는 산책할 때 풀이 많은 공원이나 숲에 간다면 벼룩 또는 진드기에 물리면서 알레르기 염증 반응이 일어날 수 있습니다.
				벼룩 알레르기성 피부염(강아지 진드기)이 발병하면 하반신을 중심으로 심한 가려움을 느낍니다.벼룩과 진드기는 피부염 외에도 기생충을 옮길 수 있기에 풀이 많은 곳을 갈 때는 주의해야 합니다.</p>
		</div>
		

		<div id="rightDiv">
			<div id="result" style="margin: -850px 50px 50px 1150px;">
				<h2 class="resultTitle" style="width: 1000px; height: 60px;font-size: 43px;">진단 결과</h2>
				<p style="width: 500px; height: 20px; font-size: 40px;">‘00 님의 반려견 혹은 00(강아지 이름)의 의심 질환은 ‘진드기’입니다.</p>
				<br><br><br><br><br><br>
				<p style="width: 1000px; height: 50px; font-size: 30px;">확률: 00%</p>
			</div>
		</div>

		<div id="information" style="margin: -250px 50px 50px 350px;">
			<div id="drug">
				<h3 class="subTitle">추천 강아지 영양제</h3>
				<ul>
					<img src="/image/skingood.jpg" alt="백내장" width="300" height="250" style="margin: 1px 100px 1px 10px">
						<li><a href="/food">리브펫 스킨앤코트2.0 강아지 고양이 피모 피부영양제 60g</a></li>
						<li>22,900원</li>
						<button type="button" class="navyBtn" 
						onClick="location.href='https://livepet.co.kr/product/%EB%A6%AC%EB%B8%8C%ED%8E%AB-%EB%89%B4%EC%8A%A4%ED%82%A8-60g%ED%86%B5/17/category/24/display/1/'">
						해당 홈페이지 바로가기</button>
				</ul>
			</div>
			<div id="food" style="margin: -380px 100px 250px 500px">
					<h3 class="subTitle">추천 강아지 사료</h3>
					<ul>
						<img src="/image/skinfood.jpg" alt="백내장" width="300" height="250" style="margin: 1px 100px 1px 10px">
						<li><a href="/food">본아페티 강아지 피부 모질사료 각질 아토피 피모 저알러지 1KG</a></li>
						<li>19,800원</li>
						<button type="button" class="navyBtn" 
						onClick="location.href='https://brand.naver.com/boneapety/products/7596306755?n_media=27758&n_query=%EA%B0%95%EC%95%84%EC%A7%80%ED%94%BC%EB%B6%80%EC%82%AC%EB%A3%8C&n_rank=3&n_ad_group=grp-a001-01-000000037259481&n_ad=nad-a001-01-000000295865573&n_keyword_id=nkw-a001-01-000005642272923&n_keyword=%EA%B0%95%EC%95%84%EC%A7%80%ED%94%BC%EB%B6%80%EC%82%AC%EB%A3%8C&n_campaign_type=1&n_ad_group_type=1&n_match=1&NaPm=ct%3Dlyzb6ak8%7Cci%3D0yO0001FsE1AooW8FvlH%7Ctr%3Dsa%7Chk%3D7ed81e612bd3d77fb289aa00319f718708004da4%7Cnacn%3DSHmqBMAfTrxYB'">
						해당 홈페이지 바로가기</button>
						
					</ul>
			</div>
			<div id="medicine" style="margin: -620px 300px 250px 1050px">
					<h3 class="subTitle">추천 강아지 샴푸</h3>
					<ul>
						<img src="/image/sp.jpg" alt="백내장" width="300" height="250" style="margin: 1px 100px 1px 10px">
						<li><a href="/food">피부진정 건성 가려운 피부관리 아토엔샴푸 약용</a></li>
						<li>32,000원</li>
						<button type="button" class="navyBtn" 
						onClick="location.href='https://puppylove.co.kr/product/detail.html?product_no=457&cate_no=418&display_group=1'">
						해당 홈페이지 바로가기</button>
						
					</ul>
			</div>
		</div>
		</section>
		<!-- --------------------------------------------------------------------------------- -->
		<%@ include file="../footer/footer.jsp" %>

</body>
</html>