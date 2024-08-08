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
    <link rel="stylesheet" type="text/css" href="/css/footer.css"/>
    <link rel="stylesheet" type="text/css" href="/css/animalList.css"/>
    <style>
    	h1{margin-top: 130px; padding-bottom: 20px;}
    </style>
</head>
<%@ include file="header.jsp" %>
<body>
	<section>
    	<h1>새로운 가족이 된 후기입니다</h1>
		    <c:forEach items="${map.list}" var="bdto">
				 	<div class="row">
				 		<div id = "total">
				 			<div class= "pic">
				 				<div class="picimg">
				 					<a href="/view?bno=${bdto.tno}&page=${map.page}&category=${map.category}&searchWord=${map.searchWord}&bfile=${map.tfile}">
					 				<c:forEach var="i" begin="1" end="${bdto.tindent}" step="1">▶</c:forEach>
					 				<img class= "image" src="/upload/${bdto.tfile}" alt="입양사진" width="280" height="250"
									style="margin: 20px 700px -50px 10px"> 
					 				</a>
				 				</div> <!--picimg -->
				 			</div> <!--pic -->
				 			
				 			<div id= "content">
				 				<h3 class="title" style="margin: -200px 600px 150px 350px">
				 				 	<a href="/view?tno=${bdto.tno}&page=${map.page}&category=${map.category}&searchWord=${map.searchWord}&bfile=${map.tfile}">
					        		<c:forEach var="i" begin="1" end="${bdto.tindent}" step="1">▶</c:forEach>
				 					${bdto.ttitle }
				 					</a>
				 				</h3>
				 				<ul class="titlecontent"></ul>
				 				<p></p>
				 			</div><!--content -->
				 		</div> <!--total -->
				 	</div><!--row  -->
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