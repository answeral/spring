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
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
		<link rel="stylesheet" href="/css/footer.css">
    	<link rel="stylesheet" href="/css/header.css">
    	<link rel="stylesheet" href="/css/adopt_write1.css">
    	<link rel="stylesheet" href="/css/main_sec.css">
    	<link rel="stylesheet" href="/css/write.css">
    	<style>
    	</style>
	</head>
	<body>
	
		<section>
		    <div class="ad_title"> 입양후기 작성 </div>
		    <form action="/adopt_writing" name="write" method="post" enctype="multipart/form-data">
		    
	      <table>
	        <colgroup>
	          <col width="15%">
	          <col width="85%">
	        </colgroup>
	        <tr>
	          <th>작성자</th>
	          <td>
	            <input type="text" name="id">
	          </td>
	        </tr>
	        <tr>
	          <th>제목</th>
	          <td>
	            <input type="text" name="ttitle">
	          </td>
	        </tr>
	        <tr>
	          <th>내용</th>
	          <td>
	            <textarea name="tcontent" cols="50" rows="10"></textarea>
	          </td>
	        </tr>
	        <tr>
	          <th>이미지 표시</th>
	          <td>
	            <input type="file" name="files" id="tfile">
	          </td>
	        </tr>
	      </table>
			<div class="button-wrapper">
				<button type="submit" class="write">작성완료</button>
			    <a href="/adopt_review"><div class="list">목록</div></a>
			    <button type="button" class="cancel" onclick="javascript:location.href='/adopt_review'">취소</button>
	  		</div>
	  </section>
	  </form>
	
	</body>
</html>