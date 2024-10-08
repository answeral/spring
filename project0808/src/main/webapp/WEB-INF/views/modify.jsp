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
  <title>글수정</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="/css/footer.css">
  <link rel="stylesheet" href="/css/header.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/write.css">
</head>
<body>
<section>
    <h1>게시글수정</h1>
    <hr>

    <form action="/doUpdate" name="modify" method="post" enctype="multipart/form-data">
      <table>
      <input type="hidden" name="tno" value="${boardDto.tno}">
      <input type="hidden" name="tfile" value="${boardDto.tfile}">
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="id" value="${boardDto.id}" readonly>
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="ttitle" value="${boardDto.ttitle }">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="tcontent" cols="50" rows="10">${boardDto.tcontent}</textarea>
          </td>
        </tr>
        <tr>
          <th>이미지 표시</th>
          <td>
            <input type="file" name="files" id="file">
          </td>
        </tr>
        <tr>
          <th>파일이름</th>
          <c:if test="${boardDto.tfile != null}">
          	<td>${bdto.tfile}</td>
          </c:if>
          <c:if test="${boardDto.tfile == null}">
          	<td>첨부파일 없음</td>
          </c:if>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="submit" class="write">수정완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='/Card_list?tno=${boardDto.tno}'">취소</button>
      </div>
    </form>

  </section>

</body>
</html>