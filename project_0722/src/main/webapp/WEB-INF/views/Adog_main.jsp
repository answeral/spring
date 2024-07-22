<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<title>유기견메인</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
<style>
@charset "UTF-8";
@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Nanum+Gothic&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	font-family: "Noto Sans KR", "Nanum Gothic", sans-serif, 'Inter';
	font-weight: 400;
	font-style: normal;
}
header {
	position: fixed;
	left: 0;
	top: 0;
	z-index: 100;
	width: 100%;
	height: 100px;
	background: black;
	display: inline-block;	
}

nav {
	width: 95%;
	height: 90px;
	margin: 5px 15px 15px 0px;
	display: flex;
}

#logo {
	width: 400px;
	margin-left: 30px;
	box-sizing: border-box;
}

#logo a {
	padding-left: 20px;
	color: white;
	font-size: 35px;
	font-family: Roboto;
	font-weight: 800;
	line-height: 80px;
	display: inline-block;
}

#logoImg {
	position: relative;
	top: 18px;
	z-index: 300;
	display: inline-block;
	width: 80px;
	height: 60px;
	background: url('/image/logo.png') no-repeat;
	background-size: 95%;
}

#navi {
	width: 85%;
	height: 90px;
	text-align: right;
}

.qmenu {
	margin: auto 0;
}

.qmenu ul {
	height: 60px;
	display: flex;
	justify-content: right;
	align-items: center;
	line-height: 30px;
	padding: 15px 0;
}

.qmenu ul li {
	height: 30px;
}

.qmenu li a {
	display: inline-block;
	font-size: 18px;
	font-weight: 600;
	color: white;
	width: 100px;
	height: 30px;
	letter-spacing: -0.5;
	text-align: right;
}

.qmenu li a:after {
	display: inline-block;
	content: "";
	width: 1px;
	height: 20px;
	background: #d3d3d3;
	margin-left: 13px;
	vertical-align: middle;
}

#q02 {
	width: 135px;
}

#q03 {
	width: 135px;
}

#q04 {
	width: 125px;
}

#q05 {
	width: 100px;
}

#q05 {
	width: 100px;
	text-align: right;
}

#q06:after {
	display: inline-block;
	content: "";
	width: 0;
	margin-left: 0;
}

body {
	height: 2000px;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
}
<!----------------------------body----------------------------------------->

#container {border: 1px solid black;
	width: 100%;
	height: 1500px;
	display: inline-block;
}

#location {border: 1px solid black;
	width: 100%;
	height: 3000px;
	line-height: 10%;
	border: none;
	display: inline-block;
	margin-bottom: 50px;
	margin-top:200px;
}
#location.ul {
	border: 1px solid black;
	display: inline-block;
	margin-top: 100px;
}

#location.li {
	list-style: none;
	border: 1px solid black;
	display: inline;
	}

#wrap {border: 1px solid black;
	width: 100%;
	height: 1200px;
	line-height: 90%;
	margin: 0 auto;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 50px;
	margin-top: 50px;
}

.wrap_menu {
	width: 70%;
	height: 300px;
	text-align: center;
	margin-left: 260px;
	margin-right: auto;
}
#wrap.ul {
	border: 1px solid black;
	display: inline-block;
}
.wrap_menu li {list-style: none;border: 1px solid black;padding: 5px
	width: 24%;
	height: 100px;
	display: inline-block;
	text-align: center;
	border: none;
	margin-left: auto;
	margin-right: auto;
	align-items: center;
	display: inline-block
}

.dog_img {
	width:
	height: 368px;
}

.dog_txt {
	height: 50%
}

footer {
	display: inline-block;
	font-weight: 900;
	position: relative;
	overflow: hidden;
	width: 100%;
	height: 300px;
	background: black;
	box-sizing: border-box;
}

.names {
	position: absolute;
	width: 100%;
	height: 30px;
	left: 35%;
	top: 90%;
	font-size: 20px;
	line-height: 30px;
	color: #FFFFFF;
	text-align: center;
}

.section1 {
	position: relative;
	display: flex;
	left: 35%;
	top: 25%;
	flex-direction: row;
}

.section1>div {
	font-family: 'Inter';
	font-style: normal;
	font-weight: 900;
	font-size: 25px;
	line-height: 30px;
	color: #FFFFFF;
	margin-left: 20px;
	max-width: 230px;
}

.section1 .introduction {
	position: absolute;
	width: 250px;
	height: 32px;
	left: 9px;
	top: 3px;
}

.section1 .privacy-policy {
	position: absolute;
	width: 200px;
	height: 32px;
	left: 300px;
	top: 3px;
}

.section1 .terms {
	position: absolute;
	width: 150px;
	height: 32px;
	left: 570px;
	top: 3px;
}

.section1 .notice {
	position: absolute;
	width: 150px;
	height: 32px;
	left: 750px;
	top: 3px;
}

.section2 {
	position: relative;
	width: 506px;
	height: 80px;
	top: 45%;
	left: 35%;
	margin-left: 30px;
}

.section2 .company-info {
	position: absolute;
	width: 663px;
	height: 18px;
	left: calc(50% - 663px/ 2 + 78.5px);
	top: 6px;
	font-size: 15px;
	line-height: 18px;
	color: #FFFFFF;
}

.section2 .business-license {
	position: absolute;
	width: 216px;
	height: 18px;
	left: 1px;
	top: 31px;
	font-size: 15px;
	line-height: 18px;
	text-align: justify;
	color: #FFFFFF;
}

.section2 .address {
	position: absolute;
	width: 437px;
	height: 18px;
	left: 1px;
	top: 56px;
	font-size: 15px;
	line-height: 18px;
	color: #FFFFFF;
}

.images {
	position: absolute;
	top: 33px;
	width: 349px;
	height: 289px;
	margin-top: 10px;
	background: url('/image/footerLogo.png') no-repeat; /*로고 넣을 곳*/
	background-repeat: no-repeat;
	background-size: auto;
	left: 250px;
}
</style>
<body>
<header>
		<nav>
			<div id="logo">
				<a href="/index">
				HappyPawPet<div id="logoImg"></div>
				</a>
			</div>
		<script>
			$(function(){
				$("#q06").click(function(){
					console.log("sessionId : ${sessionId}");
					if (${sessionId == null}){
						alert("로그인 이후 이용 가능한 페이지입니다.");
						location.href="/login/login";
					}else{
						console.log("test");
						location.href="/login/myPage";
					}
				});
			});
		</script>
		<div id="navi">
				<div class="qmenu">
					<ul>
						<li><a href="/index" id="q01">Home</a></li>
						<li><a href="#" id="q02">CheckTools</a></li>
						<li><a href="#" id="q03">Emergency</a></li>
						<li><a href="#" id="q04">Adoption</a></li>
						<c:if test="${sessionId == null }">
						<li><a href="/login/login" id="q05">Login</a></li>
						</c:if>
						<c:if test="${sessionId != null }">
						<li><a href="/login/logout" id="q05">Logout</a></li>
						</c:if>
						<li><a href="#" id="q06">MyPage</a></li>
					</ul>
				</div>
			</div>
		</nav>
</header>
<tbody>
	<div id="container">
		<div id="location">
			<ul>
				<li>지역</li>
				<li>
					<select>
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="인천">인천</option>
						<option value="대전">대전</option>
						<option value="광주">광주</option>
						<option value="부산">부산</option>
					</select>
				<li>
			</ul>
		</div>
		<div id="dog_wrap">
			<ul class="wrap_menu">
				<!-- li반복 -->
				<li class="wrap_li">
					<div class="dog_img">
						<a href="#"> <img src="#"></a>
					</div>
					<div class="dog_txt">
						<a href="#">설명</a>
					</div>
				</li>
				<!-- li반복 -->
				<li>
					<div class="dog_img">
						<a href="#"> <img src="#">
						</a>
					</div>
					<div class="dog_txt">
						<a href="#">설명</a>
					</div>
				</li>
				<!-- li반복 -->
				<li>
					<div class="dog_img">
						<a href="#"> <img src="#">
						</a>
					</div>
					<div class="dog_txt">
						<a href="#">설명</a>
					</div>
				</li>
				<!-- li반복 -->
				<li>
					<div class="dog_img">
						<a href="#"> <img src="#">
						</a>
					</div>
					<div class="dog_txt">
						<a href="#">설명</a>
					</div>
				</li>
				<!-- li반복 -->
				<li>
					<div class="dog_img">
						<a href="#"> <img src="#">
						</a>
					</div>
					<div class="dog_txt">
						<a href="#">설명</a>
					</div>
				</li>
				<!-- li반복 -->
				<li>
					<div class="dog_img">
						<a href="#"> <img src="#">
						</a>
					</div>
					<div class="dog_txt">
						<a href="#">설명</a>
					</div>
				</li>
				<!-- li반복 -->
				<li>
					<div class="dog_img">
						<a href="#"> <img src="#">
						</a>
					</div>
					<div class="dog_txt">
						<a href="#">설명</a>
					</div>
				</li>
				<!-- li반복 -->
				<li>
					<div class="dog_img">
						<a href="#"> <img src="#">
						</a>
					</div>
					<div class="dog_txt">
						<a href="#">설명</a>
					</div>
				</li>
				<!-- li반복 -->
				<li>
					<div class="dog_img">
						<a href="#"> <img src="#">
						</a>
					</div>
					<div class="dog_txt">
						<a href="#">설명</a>
					</div>
				</li>

				<!-- li 반복 끝 9개  -->

			</ul>
		</div>

	</div>
</tbody>
<footer>
    <div class="names">
        이규원, 김현희, 맹준호, 방아옥, 안슬기, 유인하, 임태균, 한승희, 홍유진
    </div>
    <div class="section1">
        <div class="introduction">HappyPawPet 소개</div>
        <div class="privacy-policy">개인정보처리방침</div>
        <div class="terms">이용약관</div>
        <div class="notice">공지사항</div>
    </div>
    <div class="section2">
        <div class="company-info">상호 : HappyPawPet | 대표자 : *** | 개인정보취급담당자 : ***</div>
        <div class="business-license">사업자등록번호 : ***-**-*****</div>
        <div class="address">(08378) 서울 구로구 디지털로34길 27 (구로동) 1106-7호</div>
    </div>
    <div class="images">
    </div>
</footer>
</body>
</html>