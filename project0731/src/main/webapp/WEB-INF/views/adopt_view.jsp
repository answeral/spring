<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>adopt_review</title>
		<link rel="stylesheet" href="/css/footer.css">
    	<link rel="stylesheet" href="/css/header.css">
    	<link rel="stylesheet" href="/css/adopt_write1.css">
    	<link rel="stylesheet" href="/css/main_sec.css">
    	<style>
    	</style>
	</head>
	<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
		<section>
		    <div class="ad_title"> 입양후기 </div>
		    <table>
			      <tr>
			        <th>아롱이의 입양을 축하해주세요</th>
			      </tr>
			      <tr>
			        <td>2024-08-02</td>
			      </tr>
			      <tr class="vertical-layout">
			        <td class="article">
			          <img src="/adopt_imgs/puppy111.jpg"></td>
			          <td>아롱이의 입양을 축하해주세요</td>
			      </tr>
			      <tr>
			        <td><strong>다음글</strong> <span class="separator">|</span>다음글</td>
			      </tr>
			      <tr>
			        <td><strong>이전글</strong> <span class="separator">|</span>이전글</td>
			      </tr>
		    </table>
		
			    <a href="/adopt_review"><div class="list">목록</div></a>
			    <a href=""><div class="list">삭제</div></a>
			    <a href=""><div class="list">수정</div></a>
	  </section>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	</body>
</html>