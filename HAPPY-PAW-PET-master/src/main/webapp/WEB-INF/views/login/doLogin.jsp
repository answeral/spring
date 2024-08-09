<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>doLogin</title>
	</head>
	<body>
		<script>
			if (${chkLogin}==1){
				alert("로그인이 되었습니다.");
				location.href="/index";
			}else if(${chkLogin}==0){
				alert("아이디 또는 패스워드가 일치하지 않습니다.");
				location.href="/login/login";
			}else{
				alert("로그아웃이 되었습니다.");
				location.href="/index";
			}
		</script>
	</body>
</html>