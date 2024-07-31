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
    	<link rel="stylesheet" href="/css/adopt_review.css">
    	<link rel="stylesheet" href="/css/main_sec.css">
    	<style>
    	</style>
	</head>
	<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
		<section>
			<div class="ad_title"> 입양후기 </div>
		    <table>
		      <colgroup>
		        <col width="12%">
		        <col width="8%">
		        <col width="50%">
		        <col width="16%">
		        <col width="*">
		        <col width="*%">
		      </colgroup>
		      <!-- 제목부분 -->
		      <tr>
		        <th>No.</th>
		        <th>사진</th>
		        <th class="table-title">제목</th>
		        <th>아이디</th>
		        <th>조회수</th>
		        <th>작성일</th>
		      </tr>
		      <tr>
		        <td><span class="table-notice">NOTICE</span></td>
		        <td>사진</td>
		        <td class="table-title1">입양 후기 작성 시 주의할 내용</td>
		        <td>admin</td>
		        <td>조회수</td>
		        <td>작성일</td>
		      </tr>
		       	<!-- 내용부분 -->
      			<!-- for문을 돌려서 여러가지 글 작성 -->
		      <c:forEach items="${list }" var="bdto">
		      <tr>
		        <td>${bdto.tno}</td>
		        <td>${bdto.tfile} </td>
		        <td class="table-title">
		        <a href="/adopt_write?tno=${bdto.tno}">
		        <!-- 답글부분 -->
		        <c:forEach var="i" begin="1" end="${bdto.tindent }" step="1">└▶</c:forEach>
		        ${bdto.ttitle }
		        </a>
		        </td>
		        <td>${bdto.tid}</td>
		        <td>${bdto.thit}</td>
		        <td>${bdto.tdate}</td>
		      </tr>
		      </c:forEach>
		    </table>

		    <ul class="page-num">
		      <li class="first"></li>
		      <li class="prev"></li>
		      <li class="num">
		        <div>1</div>
		      </li>
		      <li class="next"></li>
		      <li class="last"></li>
		    </ul>
		    
		    <a href=""><div class="list">답변달기</div></a>
		    <a href="Admin_write"><div class="list">쓰기</div></a>
		
	  </section>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	</body>
</html>