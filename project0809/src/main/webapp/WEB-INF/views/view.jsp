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
  <title>뷰페이지</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="/css/footer.css">
  <link rel="stylesheet" href="/css/header.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/read.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    function deleteBtn(tno){
    	//alert(bno);
    	if(confirm("게시글을 삭제하시겠습니까?")){
    		location.href="/delete?tno="+tno;
    	}
    }
    
  </script>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
    <h1>NOTICE</h1>
    <table>
      <colgroup>
        <col width="80%">
        <col width="10%">
        <col width="10%">
        
      </colgroup>
      <tr>
        <th colspan="3">제목</th>
      </tr>
      <tr>
        <td colspan="3"><strong>${map.boardDto.ttitle }</strong></td>
      </tr>
      <tr>
        <td>${map.boardDto.id }</td>
        <td>조회수</td>
        <td>${map.boardDto.thit }</td>
      </tr>
      <tr>
        <td colspan="3" class="article">${map.boardDto.tcontent }</td>
      </tr>
      
      <tr>
        <td colspan="3"><strong>파일첨부</strong></td>
      </tr>
      <tr>
        <c:if test="${map.boardDto.tfile != null}">
        	<td colspan="3" class="article">
        	  <img style="width:50%;" src="/upload/${map.boardDto.tfile }">
        	</td>
        </c:if>
        <c:if test="${map.boardDto.tfile == null}">
        	<td colspan="3" class="article">첨부파일 없음</td>
        </c:if>
      </tr>
      
      <tr>
        <td colspan="3"><strong>다음글</strong> <span class="separator">|</span> 
        	<c:if test="${map.prevDto.tno != null }">
        		<a href="/view?tno=${map.prevDto.tno}&page=${page}">[게시글] ${map.prevDto.ttitle }</a> 
        	</c:if>
        	<c:if test="${map.prevDto.tno == null }">
        		다음글이 없습니다.
        	</c:if>
        </td>
      </tr>
      <tr>
        <td colspan="3"><strong>이전글</strong> <span class="separator">|</span> 
        	<c:if test="${map.nextDto.tno != null }">
        	  <a href="/view?tno=${map.nextDto.tno}&page=${page}">[게시글] ${map.nextDto.ttitle }</a>
        	</c:if>
        	<c:if test="${map.nextDto.tno == null }">
        		이전글이 없습니다.
        	</c:if>
        </td>
      </tr>
    </table>

    <a href="/Card_list?page=${page}&category=${category}&searchWord=${searchWord}"><div class="list">목록</div></a>
    <div class="list" onclick="deleteBtn(${map.boardDto.tno})">삭제</div>
    <a href="/update?tno=${map.boardDto.tno}"><div class="list">수정</div></a>
    <a href="/reply?tno=${map.boardDto.tno }"><div class="list">답변달기</div></a>
  </section>
<%@ include file="footer.jsp" %>
</body>
</html>
