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
		<title>HappyPawPet입양후기 커뮤니티</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    	<link rel="stylesheet" href="/css/top.css">
    	<link rel="stylesheet" href="/css/adoption/adoption_review.css">
		<link rel="stylesheet" href="/css/footer.css">
		<script>
			function wBtn(){
				if(${sessionId == null}){
					alert("로그인 후 이용 가능합니다.");
					return false;
				}else{
					location.href="/adoption/adopt_writing";
				}
			}
		</script>
	</head>
	<body>
		<%@ include file="../top/top.jsp" %>
		<!-- --------------------------------------------------------------------------------------------------------------------------------- -->
		<section>
			<div id="blank1"></div>
			<div id="main">
				<h1>입양후기</h1>
				<div class="wrapper">
					<form action="/adoption/adopt_review" name="review" method="post" enctype="multipart/form-data">
						<select name="category" id="category">
				          <option value="all">전체</option>
				          <option value="btitle">제목</option>
				          <option value="bcontent">내용</option>
				        </select>
				        <div class="title">
				          <input type="text" size="16" name="searchWord" id="searchWord" value="${map.searchWord }">
				        </div>
				        
				        <button type="submit" onclick="sBtn()"><i class="fas fa-search"></i></button>
			      	</form>
			    </div>
			    
		    <table>
		      <colgroup>
		        <col width="18%">
		        <col width="40%">
		        <col width="10%">
		        <col width="18%">
		        <col width="10%">
		      </colgroup>
		      <!-- 제목부분 -->
		      <tr>
		        <th>No.</th>
		        <th>제목</th>
		        <th>아이디</th>
		        <th>작성일</th>
		        <th>조회수</th>
		      </tr>
		      <!-- 내용부분 시작 -->
		      <c:forEach items="${map.list}" var="adDto">
			      <tr>
				      <c:choose>
				      	<c:when test="${adDto.topchk == 1 }">
				      		<td><span class="table-notice">NOTICE</span></td>
				      	</c:when>
				      	<c:otherwise>
					        <td><span class="table-normal">${adDto.bno}</span></td>
				      	</c:otherwise>
				      </c:choose>
			        <td class="table-title">
			        <a href="/adoption/view?bno=${adDto.bno}&page=${map.page}&category=${map.category}&searchWord=${map.searchWord}">
			        <c:forEach var="i" begin="1" end="${adDto.bindent}" step="1">▶</c:forEach>
			        ${adDto.btitle }
			        </a>
			        </td>
			        <td>${adDto.id }</td>
			        <td>${adDto.bhit }</td>
			        <td>${adDto.bdate }</td>
			      </tr>
		      </c:forEach>
		      <!-- 내용부분 끝 -->
		    </table>
			<!-- -------------------------------------------------- -->
			
	     <ul class="page-num">
		      <!-- first 부분 -->
		      <c:if test="${map.page>map.startPage}">
		      	<a href="adopt_review?page=${map.startPage}"><li class="first"></li></a> 
		      </c:if>
		      <c:if test="${map.page==map.startPage}">
			    	<li class="first"></li>
			  </c:if>
			   
			  <!-- prev -->
			  <c:if test = "${map.page<=1 }">
			    <li class="prev"></li>
			  </c:if>
			  <c:if test = "${map.page>1 }">
			   	<a href="adopt_review?page=${map.page-1}&category=${map.category}&searchWord=${map.searchWord}"><li class="prev"></li></a>
			  </c:if>
			   
			  <c:forEach var="i" begin="${map.startPage }" end="${map.endPage }" step="1">
			   	<c:if test="${map.page == i}">
			    	<li class="MyNum num"><div>${i}</div></li>
			    </c:if>
			    <c:if test="${map.page != i}">
			    	 <a href="adopt_review?page=${i}&category=${map.category}&searchWord=${map.searchWord}"><li class="num"><div>${i}</div></li></a>
			    </c:if>
			  </c:forEach>
			   
			  <!-- next 부분 -->
			  <c:if test="${map.page<map.maxPage}">
			   	<a href="adopt_review?page=${map.page+1}&category=${map.category}&searchWord=${map.searchWord}"><li class="next"></li></a>
			  </c:if>
			  <c:if test="${map.page>=map.maxPage}">
			    <li class="next"></li>
			  </c:if>
			   
			  <!-- last -->
		 	  <c:if test="${map.page<map.maxPage}">
			    <a href="adopt_review?page=${map.maxPage}&category=${map.category}&searchWord=${map.searchWord}"><li class="last"></li></a>
			  </c:if>
			  <c:if test="${map.page>=map.maxPage}">
			    <li class="last"></li>
			  </c:if>
	    </ul>
		<!-- -------------------------------------------------------------- -->
		<div id="blank"></div>
			<c:choose>
				<c:when test="${sessionId == 'admin01' }">
					<div class="write"><a href="/adoption/notice" onclick="wBtn()">공지사항등록</a></div>
				</c:when>
			</c:choose>
			<div class="write"><a href="#" onclick="wBtn()">쓰기</a></div>
		</div>
	  </section>
	  <!-- ----------------------------------------------------------------------- -->
	  <%@ include file="../footer/footer.jsp" %>
	</body>
</html>