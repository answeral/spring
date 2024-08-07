<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>입양 후기</title>
    <link rel="stylesheet" type="text/css" href="/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="/animalList.css"/>
    <link rel="stylesheet" type="text/css" href="/css/footer.css"/>
    <link rel="stylesheet" type="text/css" href="/css/adopt_review2.css">
    <link rel="stylesheet" href="/css/main_sec.css">
    <style>
        h1{ margin-top:150px; /* 상단 여백 제거 */}
        .card-container {margin-top: 80px; /* 상단 여백을 추가하여 아래로 밀기 */}
        footer {margin-top:3800px;}
    </style>
</head>
<%@ include file="header.jsp" %>
<body>
	<section>
    <h1>새로운 가족이 된 후기입니다</h1>
    
    <c:forEach items="${map.list}" var="bdto" varStatus="status">
		    <div class="card-container">
		        <div class="card">
		                <div class="card-content">
			            <a href="/view?tno=${bdto.tno}&page=${map.page}&category=${map.category}&searchWord=${map.searchWord}">
		                    <div class="card-image-container">
		                          <img src="${bdto.thumbnailUrl}" alt="썸네일">
		                    </div>
		                    <div class="card-info">
		                        <h2>${bdto.tno}번</h2> 
		                        <h2>${bdto.ttitle}</h2>
		                    </div>
		                </div>
		            </a>
		        </div>
		    </div>
	</c:forEach>

<ul class="page-num">
		     <!-- first 부분 -->
		     <c:if test="${map.page<=1}">
		      	<li class="first"><img src="/adopt_imgs/paging/paging_first.png"></li>
		     </c:if>
		     <c:if test="${map.page>1}">
				<a href="Card_list?page=1"><li class="first"><img src="/adopt_imgs/paging/paging_first.png"></li></a>
		     </c:if>
		       
		       <!-- prev 부분 -->
		       <c:if test="${map.page<=1 }">
		      <li class="prev"><img src="/adopt_imgs/paging/paging_prev.png"></li>
		       </c:if>
		       <c:if test="${map.page>1}">
		      	<a href="Card_list?page=${map.page-1}"><li class="prev"><img src="/adopt_imgs/paging/paging_prev.png"></li></a>
		      	</c:if>
		       
		       
		       <c:forEach var="i" begin="${map.startPage}" end="${map.endPage}" step="1">
		       	<c:if test="${map.page == i }">
		      		<li class="myNum num"><div>${i}</div></li>
		       	</c:if>

				<c:if test="${map.page != i}">
					<a href="Card_list?page=${i}"><li class="num"><div>${i}</div></li></a>
				</c:if>		       
		       </c:forEach>
		       
				<c:if test="${map.page<map.maxPage}">		       
			      	<a href="Card_list?page=${map.page+1}"><li class="next"><img src="/adopt_imgs/paging/paging_next.png"></li></a>
			      </c:if>
			      
			      <c:if test="${map.page>=map.maxPage}">
			      	<li class="next"><img src="/adopt_imgs/paging/paging_next.png"></li>
			      </c:if>
						      
			    <c:if test="${map.page<map.maxPage}"> 
			      <a href="Card_list?page=${map.maxPage}"><li class="last"><img src="/adopt_imgs/paging/paging_last.png"></li></a>
				</c:if>
				<c:if test="${map.page>=map.maxPage}">
				    <li class="last"><img src="/adopt_imgs/paging/paging_last.png"></li>
				  </c:if>


		    </ul>
		    <a href="adopt_writing"><div class="list">쓰기</div></a>
		   
	</section>
<%@ include file="footer.jsp" %>
</body>
</html>