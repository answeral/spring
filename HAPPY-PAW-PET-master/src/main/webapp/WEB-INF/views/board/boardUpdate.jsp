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
  <link rel="stylesheet" href="/css/board/write.css">
  <link rel="stylesheet" href="/css/footer.css">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script>
  	function writeBtn(bno){
  		alert("수정이 완료되었습니다.");
  		write.submit();
  	}
  </script>
  <script>
	  $(document).ready(function() {  //content 내용 input에 넣기
		    $("select[name=topck_select]").on("change", function() {
		        let topchk = $(this).val();
		        $("#topchk").val(topchk);
		        console.log("topchk : "+topchk);
		    });
		});
  </script>
</head>
<body>
	<%@ include file="../top/top.jsp" %>
	<section>
	    <h1>공지사항 수정하기</h1>
	    <hr>
	
	    <form action="/board/doBoardUpdate" name="write" method="post" enctype="multipart/form-data">
	    <input type="hidden" name="bno" value="${bDto.bno}">
      	<input type="hidden" name="bfile" value="${bDto.bfile}">
	      <table>
	        <colgroup>
	          <col width="15%">
	          <col width="85%">
	        </colgroup>
	        <tr>
	          <th>선택</th>
	          <td>
	          	<input type="hidden" name="topchk" id="topchk" value="${bDto.topchk }" required/>
	            <select name="topck_select">
					<option value="0" ${fn:contains(bDto.topchk, '0')?'selected':''}>선택안함</option>
					<option value="1" ${fn:contains(bDto.topchk, '1')?'selected':''}>상위노출</option>
					<option value="2" ${fn:contains(bDto.topchk, '2')?'selected':''}>필독</option>
				</select>
	          </td>
	        </tr>
	        <tr>
	          <th>작성자</th>
	          <td>
	            <input type="text" name="id" value="${bDto.id }" readonly="readonly">
	          </td>
	        </tr>
	        <tr>
	          <th>제목</th>
	          <td>
	            <input type="text" name="btitle" value="${bDto.btitle}">
	          </td>
	        </tr>
	        <tr>
	          <th>내용</th>
	          <td>
	            <textarea name="bcontent" cols="50" rows="10">${bDto.bcontent}</textarea>
	          </td>
	        </tr>
	        <tr>
	          <th>기존 이미지</th>
	          <td>
	          <c:if test="${bDto.bfile != null}">
	            <input type="text" name="exisFile" id="exisFile" value="${bDto.bfile}" readonly>
	            </c:if>
	           <c:if test="${bDto.bfile == null}">
	           	<input type="text" name="exisFile" id="exisFile" value="이미지 없음" readonly>
	           	</c:if>
	          </td>
	        </tr>
	        <tr>
	          <th>이미지 표시</th>
	          <td>
	            <input type="file" name="files" id="bfile" accept=".jpg, .jpeg, .png, .gif">
	          </td>
	        </tr>
	      </table>
	      <hr>
	      <div class="button-wrapper">
	        <button type="button" class="write" onclick="writeBtn(${bDto.bno})">수정완료</button>
	        <button type="button" class="cancel" onclick="window.history.back()">취소</button>
	      </div>
	    </form>
	
	  </section>
	  <!-- ----------------------------------------------------------------- -->
	  <%@ include file="../footer/footer.jsp" %>
</body>
</html>