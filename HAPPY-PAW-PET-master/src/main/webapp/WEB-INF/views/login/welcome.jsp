<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="/css/top.css" />
	<link rel="stylesheet" type="text/css" href="/css/login/welcome.css" />
	<link rel="stylesheet" type="text/css" href="/css/footer.css" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>회원가입 완료</title>
</head>
<body id="welcome">
<%@ include file="../top/top.jsp" %>
<!--  ---------------------------------------------------------------------------->
    <section>
        <div class="subBanner"></div>
        <div id="blank"></div>
        <div id="main">
	        <div id="sub_top_area">
	            <h3>회원가입</h3>
	        </div>
	        <div id="join_success_div">
	            <p>
	                감사합니다.
	                <strong>회원가입이 완료되었습니다.</strong>
	            </p>
	            <button type="button" class="mBtn" id="go_login" onClick="location.href='login'">로그인 하러 가기</button>
	        </div>
        </div>	
    </section>
<!-- ---------------------------------------------------------------------------- -->
<%@ include file="../footer/footer.jsp" %>
</body>
</html>