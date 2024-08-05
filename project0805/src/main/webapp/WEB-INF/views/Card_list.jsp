<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>유기 강아지 목록</title>
    <link rel="stylesheet" type="text/css" href="/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="/animalList.css"/>
    <link rel="stylesheet" type="text/css" href="/css/footer.css"/>
    
</head>
<body>
<%@ include file="header.jsp" %>
<main>
    <h1>새로운 가족들의 후기입니다!</h1>
	    <c:forEach items="${map.list}" var="bdto">
		    <div class="card-container">
		                <div class="card ">
		                    <!-- <a href=${map.list}> -->
		                        <div class="card-content">
		                            <div class="card-image-container">
		                                <img src=>
		                            </div>
		                            <div class="card-info">
		                                <h2>${bdto.ttitle}</h2>
		                                <p class="important-info">${bdto.tcontent}</p>
		                                <p>성별: 남자 / 중성화: 중성화</p>
		                                <p class="contact-info">ㅇㅇㅇ / 010-1111-1111</p>
		                            </div>
		                        </div>
		                    </a>
		                </div>
		    </div>
	    </c:forEach>
    <%-- <c:forEach items="${map.list}" var="bdto">
	    <!-- 반복하여 카드를 생성 -->
	    <div class="card-container">
	            <div class="card">
	                <a href="/view?tno=${bdto.tno}&page=${map.page}&category=${map.category}&searchWord=${map.searchWord}">
	                    <div class="card-content">
	                        <div class="card-image-container">
	                            <img src="/adopt_imgs/puppy111.jpg">
	                        </div>
	                        <div class="card-info">
	                            <h2>${bdto.ttitle}</h2>
	                        </div>
	                    </div>
	                </a>
	            </div>
		</div>
    </c:forEach>--%>
<!----------------------------------------------------- 페이지 부분----------------------------------------------------------------- -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a class="location" href="/adoption/animalList?uprCd=${uprCd}&orgCd=${orgCd}&page=1">&lt;&lt;</a>
            <a class="location" href="/adoption/animalList?uprCd=${uprCd}&orgCd=${orgCd}&page=${currentPage - 1}">&lt;</a>
        </c:if>
        <c:forEach items="${paginationLinks}" var="link">
            <c:choose>
                <c:when test="${link == '...'}">
                    <span>${link}</span>
                </c:when>
                <c:otherwise>
                    <a id="num" href="/adoption/animalList?uprCd=${uprCd}&orgCd=${orgCd}&page=${link}" class="${link == currentPage ? 'active' : ''}">${link}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a class="location" href="/adoption/animalList?uprCd=${uprCd}&orgCd=${orgCd}&page=${currentPage + 1}">&gt;</a>
            <a class="location" href="/adoption/animalList?uprCd=${uprCd}&orgCd=${orgCd}&page=${totalPages}">&gt;&gt;</a>
        </c:if>
    </div>
</main>
<%@ include file="footer.jsp" %>
</body>
</html>