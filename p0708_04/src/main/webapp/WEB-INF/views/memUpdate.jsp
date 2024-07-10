<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보수정</title>
	</head>
	<body>
		<h2>회원가입</h2>
		<form action="memUpdate" name="frm" method="get">.
		<label>아이디</label>
		<input type="text" name="id" value="${id }"><br>
		<label>비밀번호</label>
		<input type="text" name="pw" value="${pw }"><br>
		<label>전화번호</label>
		<input type="text" name="phone"><br>
		
		<label>성별</label>
		<label for="male">남자</label>
		
		<input type="radio" name ="gender" value="male" id="male"><br>
		<label for="female">여자</label><br>
		<input type="radio" name ="gender" value="female" id="female"><br>
		<input type="submit" name="확인"><br>		
		
		<label for="hobby">취미</label><br>
		
		<input type="checkbox" name="game" value="game" id="game"><br>
		<label for="game">게임</label><br>
		<input type="checkbox" name="golf" value="golf" id="golf"><br>
		<label for="golf">골프</label><br>
		<input type="checkbox" name="run" value="run" id="run"><br>
		<label for="run">조깅></label><br>
		<input type="checkbox" name="swim" value="swim" id="swim"><br>
		<label for="swim">수영</label>
		
		
		
		
		</form>
	</body>
</html>