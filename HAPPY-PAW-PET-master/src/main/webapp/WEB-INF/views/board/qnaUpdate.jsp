<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Q&A 수정하기</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="/css/top.css">
  <link rel="stylesheet" href="/css/board/question.css">
  <link rel="stylesheet" href="/css/footer.css">
  <script>
  	function writeBtn(qno){
  		alert("작성이 완료되었습니다.");
  		write.submit();
  	}
  </script>
</head>
<body>
	<%@ include file="../top/top.jsp" %>
	<section>
	    <h1>Q&A 수정하기</h1>
	    <hr>
	
	    <form action="/board/doQnaUpdate" name="write" method="post" enctype="multipart/form-data">
	    <input type="hidden" name="qno" value="${qdto.qno}">
      	<input type="hidden" name="qfile" value="${qdto.qfile}">
	      <table>
	        <colgroup>
	          <col width="15%">
	          <col width="85%">
	        </colgroup>
	        <tr>
	          <th>작성자</th>
	          <td>
	            <input type="text" name="id" value="${sessionId }" readonly="readonly">
	          </td>
	        </tr>
	        <tr>
	          <th>제목</th>
	          <td>
	            <input type="text" name="qtitle" value="${qdto.qtitle}">
	          </td>
	        </tr>
	        <tr>
	          <th>내용</th>
	          <td>
	            <textarea name="qcontent" cols="50" rows="10">${qdto.qcontent}</textarea>
	          </td>
	        </tr>
	        <tr>
	          <th>기존 이미지</th>
	          <td>
	          <c:if test="${qdto.qfile != null}">
	            <input type="text" name="exisFile" id="exisFile" value="${qdto.qfile}" readonly>
	            </c:if>
	           <c:if test="${qdto.qfile == null}">
	           	<input type="text" name="exisFile" id="exisFile" value="이미지 없음" readonly>
	           	</c:if>
	          </td>
	        </tr>
	        <tr>
	          <th>이미지 표시</th>
	          <td>
	            <input type="file" name="files" id="qfile" accept=".jpg, .jpeg, .png, .gif">
	          </td>
	        </tr>
	      </table>
	      <hr>
	      <div class="button-wrapper">
	        <button type="button" class="write" onclick="writeBtn(${qdto.qno})">작성완료</button>
	        <button type="button" class="cancel" onclick="window.history.back()">취소</button>
	      </div>
	    </form>
	
	  </section>
	  <!-- ----------------------------------------------------------------- -->
	  <%@ include file="../footer/footer.jsp" %>
</body>
</html>