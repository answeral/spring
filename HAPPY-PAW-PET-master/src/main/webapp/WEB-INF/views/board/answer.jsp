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
  <title>HappyPawPet 관리자글쓰기</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="/css/top.css">
  <link rel="stylesheet" href="/css/board/answer.css">
  <link rel="stylesheet" href="/css/footer.css">
</head>
<body>
	<%@ include file="../top/top.jsp" %>
	<section>
	    <h1>Q&A 답변하기</h1>
	    <hr>
	
	    <form action="/board/answer" name="write" method="post">
	    <input type="hidden" name="qno" value="${map.qnadto.qno }">
	      <table>
	        <colgroup>
	          <col width="15%">
	          <col width="85%">
	        </colgroup>
	        <tr>
	          <th>작성자</th>
	          <td>
	            <input type="text" name="id" value="admin01" readonly="readonly">
	          </td>
	        </tr>
	        <tr>
	          <th>문의내용</th>
	          <td id="content">
	            ${map.qnadto.qcontent }
	          </td>
	        </tr>
	        <tr>
	          <th>내용</th>
	          <td>
	            <textarea name="acontent" cols="50" rows="10"></textarea>
	          </td>
	        </tr>
	      </table>
	      <hr>
	      <div class="button-wrapper">
	        <button type="submit" class="write">작성완료</button>
	        <button type="button" class="cancel" onclick="javascript:location.href='/board/qnaView?qno=${map.qnadto.qno}'">취소</button>
	      </div>
	    </form>
	
	  </section>
	  <!-- ----------------------------------------------------------------- -->
	  <%@ include file="../footer/footer.jsp" %>

</body>
</html>