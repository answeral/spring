<%--진단이력--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" type="text/css" href="/css/top.css">
	<link rel="stylesheet" type="text/css" href="/css/diagnosis/diagnosis.css">
	<link rel="stylesheet" type="text/css" href="/css/footer.css">
	<title>diagnosis</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	</head>
	<body>
	<%@ include file="../top/top.jsp"%>
		<main>
			<section style="margin: 50px 10px 10px 500px">
				<h1>[oo의 진단이력입니다.]</h1>
				<br><br>
				<div id="result">
				<p>그동안 저장해왔던 증상들 기록 및 강아지 질환 과거력 등이 나오게... 동물병원 진료시 같은 말 반복 안해도 되고 어떤 증상인지 나열할 필요 없이 의사가 확인할 수 있음</p>
				</div>
				<br><br><br><br>
				<a href="#"><input type="submit" value="진단이력 프린트하기"></a>
				<p>[진단이력을 프린트해서 진료볼 때 제출해보세요!]</p>
			</section>
		</main>
		<%@ include file="../footer/footer.jsp"%>
	</body>
</html>