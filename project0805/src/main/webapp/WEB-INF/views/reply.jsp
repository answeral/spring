
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
    <h1>게시글 답글달기</h1>
    <hr>

    <form action="/doReply" name="reply" method="post" enctype="multipart/form-data">
      <table>
      <input type="hidden" name="tno" value="${boardDto.tno }">
      <input type="hidden" name="tgroup" value="${boardDto.tgroup }">
      <input type="hidden" name="tstep" value="${boardDto.tstep }">
      <input type="hidden" name="tindent" value="${boardDto.tindent }">
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
            <input type="text" name="ttitle" value="[답변] ${boardDto.ttitle }">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
<textarea name="tcontent" cols="50" rows="10">

---------------------------
[답글]
${boardDto.tcontent }
</textarea>
          </td>
        </tr>
        <tr>
          <th>이미지 표시</th>
          <td>
            <input type="file" name="tfiles" id="tfile">
          </td>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="submit" class="write">답변완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='list.do'">취소</button>
      </div>
    </form>

  </section>

</body>
</html>
