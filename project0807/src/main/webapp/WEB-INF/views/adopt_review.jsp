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
    	<link rel="stylesheet" type="text/css" href="/css/adopt_review.css">
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
		        <td>46</td>
		        <td>2024-07-31</td>
		      </tr>
		       	<!-- 내용부분 -->
      			<!-- for문을 돌려서 여러가지 글 작성 -->
		      <c:forEach items="${map.list}" var="bdto">
		      <tr>
		        <td>${bdto.tno}</td>
		        <td>${bdto.tfile} </td>
		        <td class="table-title" >
		        <a href="/view?tno=${bdto.tno}&page=${map.page}&category=${map.category}&searchWord=${map.searchWord}">
		        <!-- 답글부분 -->
			        <c:forEach var="i" begin="1" end="${bdto.tindent}" step="1">└▶</c:forEach>
			        <span style="color: black;">${bdto.ttitle}</span>
		        </a>
		        </td>
		        <td>${bdto.id}</td>
		        <td>${bdto.thit}</td>
		        
		        <td>
		        	<c:if test="${bdto.tdate != null}">
                		<fmt:formatDate value="${bdto.tdate}" pattern="yyyy-MM-dd"/>
            		</c:if>
            		<c:if test="${bdto.tdate == null}">
                		날짜 없음
            		</c:if>
		        </td>
		      </tr>
		      </c:forEach>
		    </table>


		    <ul class="page-num">
		     <!-- first 부분 -->
		     <c:if test="${map.page<=1}">
		      	<li class="first"><img src="/adopt_imgs/paging/paging_first.png"></li>
		     </c:if>
		     <c:if test="${map.page>1}">
				<a href="adopt_review?page=1"><li class="first"><img src="/adopt_imgs/paging/paging_first.png"></li></a>
		     </c:if>
		       
		       <!-- prev 부분 -->
		       <c:if test="${map.page<=1 }">
		      <li class="prev"><img src="/adopt_imgs/paging/paging_prev.png"></li>
		       </c:if>
		       <c:if test="${map.page>1}">
		      	<a href="adopt_review?page=${map.page-1}"><li class="prev"><img src="/adopt_imgs/paging/paging_prev.png"></li></a>
		      	</c:if>
		       
		       
		       <c:forEach var="i" begin="${map.startPage}" end="${map.endPage}" step="1">
		       	<c:if test="${map.page == i }">
		      		<li class="myNum num"><div>${i}</div></li>
		       	</c:if>

				<c:if test="${map.page != i}">
					<a href="adopt_review?page=${i}"><li class="num"><div>${i}</div></li></a>
				</c:if>		       
		       </c:forEach>
		       
				<c:if test="${map.page<map.maxPage}">		       
			      	<a href="adopt_review?page=${map.page+1}"><li class="next"><img src="/adopt_imgs/paging/paging_next.png"></li></a>
			      </c:if>
			      
			      <c:if test="${map.page>=map.maxPage}">
			      	<li class="next"><img src="/adopt_imgs/paging/paging_next.png"></li>
			      </c:if>
						      
			    <c:if test="${map.page<map.maxPage}"> 
			      <a href="adopt_review?page=${map.maxPage}"><li class="last"><img src="/adopt_imgs/paging/paging_last.png"></li></a>
				</c:if>
				<c:if test="${map.page>=map.maxPage}">
				    <li class="last"><img src="/adopt_imgs/paging/paging_last.png"></li>
				  </c:if>


		    </ul>
		    <a href="adopt_writing"><div class="list">쓰기</div></a>
		   
		
	  </section>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	</body>
</html>