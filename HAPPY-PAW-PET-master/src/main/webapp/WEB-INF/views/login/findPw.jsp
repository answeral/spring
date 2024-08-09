<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="/css/top.css" />
	<link rel="stylesheet" type="text/css" href="/css/login/findPw.css" />
	<link rel="stylesheet" type="text/css" href="/css/footer.css" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>HappyPawPet 비밀번호찾기</title>
	<script>
		
	</script>
	</head>
	<body id="findForm">
		<header>
			<nav>
				<div id="logo">
					<a href="/index">
					HappyPawPet<div id="logoImg"></div>
					</a>
				</div>
				<script>
					$(function(){
						$("#q06").click(function(){
							if (${sessionId == null}){
								alert("로그인 이후 이용 가능한 페이지입니다.");
								location.href="/login/login";
							}else{
								location.href="/login/myPage";
							}
						});//마이페이지 클릭
						
						
						$(".sBtn").click(function(){
							alert("이메일을 발송했습니다.");
							findpwFrm.submit(); //form 형태로 controller로 입력값을 보냄
							
						});//폼 전송
						
					});
				</script>
				<script>
					if (${chkFind}==0){
						alert("해당 정보로 가입된 아이디가 없습니다.");
						location.href="/login/findId";
					}
				</script>
			    <!-- ----------------------------------------------------------------------- -->
				<div id="navi">
						<div class="qmenu">
							<ul>
								<li><a href="/index" id="q01">Home</a></li>
								<li><a href="#" id="q02">CheckTools</a></li>
								<li><a href="#" id="q03">Emergency</a></li>
								<li><a href="#" id="q04">Adoption</a></li>
								<li><a href="/login/login" id="q05">Login</a></li>
								<li><a href="#" id="q06">MyPage</a></li>
							</ul>
						</div>
					</div>
			</nav>
		</header>
		<!-- ------------------------------------------------------------------------- -->
		<section>
			<div class="subbanner"></div>
			<div class="main">
				<h2>비밀번호 찾기</h2>
				<form action="/login/emailSend" name="findpwFrm" method="post">
					<input type="hidden" name="id" id="id" value="${mDto.id }">
					<fieldset class="fieldset_class">
						<dl id="id">
							<dt>찾은 아이디</dt>
							<dd>${mDto.id }</dd>
						</dl>
						<dl id="name_t">
							<div></div>
							<dt><label for="name">이름</label></dt>
							<dd><input type="text" name="name" id="name" value="${mDto.name }" readonly="readonly" required></dd>
						</dl>
						<dl id="email_t">
							<div></div>
							<dt><label for="email">이메일</label></dt>
							<dd><input type="text" name="email" id="email" value="${mDto.email }" required></dd>
						</dl>
						<dl id="pw_send">
							<dd id="color">비밀번호가 기억나지 않으세요?</dd>
							<dd><button type="button" class="sBtn">임시비밀번호 발급받기</button></dd>
						</dl>
						
					</fieldset>
				</form>
			</div>
		</section>
		<!-- ------------------------------------------------------------------------------------------------ -->
		<%@ include file="../footer/footer.jsp" %>
	</body>
</html>