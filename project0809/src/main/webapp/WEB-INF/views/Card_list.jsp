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
		<title>adopt_review</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
		<link rel="stylesheet" href="/css/footer.css">
    	<link rel="stylesheet" href="/css/header.css">
		<link rel="stylesheet" href="/css/animalList.css">
		<style>
    	</style>
	</head>
	<body>
	<%@ include file="top.jsp" %>
		<section>
		<form action="/Card_list" name="review" method="post" enctype="multipart/form-data">
		<div class="ad_title"> 입양후기 </div>
		<div class="ad_title_2">입양후기를 적어주세요. HappyPawPet을 통해 입양하신 분들은 누구나 후기를 적어주세요!<br>
		가족이 되어 즐겁게 지내시는 모습, 입양 전후 사진, 특이한 버릇, 입양 후 가장 좋은 점 등 입양을 망설이시거나 고민하시는 분들께 좋은 선물이 될 수 있습니다.</div>
		<!-- ------------------------------------------------------------------------------------ -->
		<table>
		      <colgroup>
		        <col width="16%">
		        <col width="54%">
		        <col width="16%">
		        <col width="*">
		        <col width="*%">
		      </colgroup>
		<tbody>
		<c:forEach items="${map.list}" var="bdto" varStatus="status">
		<c:if test="${status.index %2 == 0 }">
			<tr>
		</c:if>
			<td>
		 		<div id = "total">
		 			<div class= "pic">
		 				<div class="picimg">
		 					<a href="/view?tno=${bdto.tno}&page=${map.page}&category=${map.category}&searchWord=${map.searchWord}&tfile=${map.tfile}">
			 				 <c:choose>
                                  <c:when test="${bdto.tfile != null && bdto.tfile != ''}">
						 				<img class= "image" src="/upload/${bdto.tfile}" alt="입양사진" width="280" height="250"
										style="margin: 20px 700px -50px 10px">
										</c:when>
								<c:otherwise>
                                        <img class="image" src="/images/anima_rights.png" alt="기본 이미지" width="280" height="250"
                                             style="margin: 20px 700px -50px 10px">
                                    </c:otherwise>
							</c:choose>
			 				</a>
		 				</div> <!--picimg -->
		 			</div> <!--pic -->
		 			<div id= "content">
		 				<h3 class="title">
		 				 	<a href="/view?tno=${bdto.tno}&page=${map.page}&category=${map.category}&searchWord=${map.searchWord}&bfile=${map.tfile}">
			        		<c:forEach var="i" begin="1" end="${bdto.tindent}" step="1">▶</c:forEach>
		 					${bdto.ttitle }
		 					</a>
		 				</h3>
		 				
		 				<p class="titleDetail4">
		 				 내용 : ${bdto.tcontent}
		 				</p> <!--내용 -->
		 				
		 				<ul class="titlecontent">
		 					<li class="titleDetail1">작성자: ${bdto.id }</li>   <!--작성자 -->
		 					<li class="titleDetail2">작성일: ${bdto.tdate }</li>   <!--날짜 -->
		 					<li class="titleDetail3">조회수: ${bdto.thit }</li>   <!--조회수 -->
		 				</ul>
		 			</div><!--content -->
		 		</div> <!--total -->
		 	 </td>

        	<c:if test="${status.index % 2 == 1 || status.last}">
        	 </tr> <!-- 홀수 인덱스일 때 행 닫기 -->
       			 </c:if>
		 	</c:forEach>
		</tbody>
		 </table>
		 
		<!-- ------------------------------------------------------------------------------------ -->
		 
		 <ul class="page-num">
		      <!-- first 부분 -->
		      <c:if test="${map.page<=1}">
		      	<li class="first" ></li> 
		      </c:if>
		      <c:if test="${map.page>1}">
		      	<a href="Card_list?page=1"><li class="first" ></li></a> 
		      </c:if>
		      <!-- prev 부분 -->
		      <c:if test="${map.page<=1}">
		      	<li class="prev"></li>
		      </c:if>
		      <c:if test="${map.page>1}">
		      	<a href="Card_list?page=${map.page-1}"><li class="prev"></li></a>
		      </c:if>
		      
		      <c:forEach var="i" begin="${map.startPage}" end="${map.endPage}" step="1">
		      	<c:if test="${map.page == i}">
		      		<li class="myNum num"><div>${i}</div></li>
		      	</c:if>
		      	<c:if test="${map.page != i}">
		      		<a href="Card_list?page=${i}"><li class="num"><div>${i}</div></li></a> 
		      	</c:if>
		      </c:forEach>
		      
		      <c:if test="${map.page<map.maxPage}">
		      	<a href="Card_list?page=${map.page+1}"><li class="next"></li></a>
		      </c:if>
		      <c:if test="${map.page>=map.maxPage}">
		      	<li class="next"></li>
		      </c:if>
		      <c:if test="${map.page<map.maxPage}">
		      	<a href="Card_list?page=${map.maxPage}"><li class="last"></li></a>
		      </c:if>
		      <c:if test="${map.page>=map.maxPage}">
		      	<li class="last"></li>
		      </c:if>
		    </ul>
		 	<div class="list"><a href="adopt_writing">글쓰기</a></div>
		 </form>
		     <!-- 내용부분 끝 -->
		</section>
<%@ include file="footer.jsp" %>
	</body>
</html>