<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="/css/top.css" />
	<link rel="stylesheet" type="text/css" href="/css/login/findId.css" />
	<link rel="stylesheet" type="text/css" href="/css/footer.css" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>HappyPawPet 아이디찾기</title>
	</head>
	<body id="findForm">
		
		<header>
			<nav>
				<div id="logo">
					<a href="/index">
					HappyPawPet<div id="logoImg"></div>
					</a>
				</div>
			    <!-- ----------------------------------------------------------------------- -->
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
						
						$("select[name=domain_select]").on("change", function(){
							let addr = $(this).closest("#email").find("input[name=mail_tail]");
							if ($(this).val() == ""){
								addr.val('');
								addr.prop("readonly", false);
							} else{
								addr.val($(this).val());
								$(addr.prop("readonly",true));
							}
						});//이메일 클릭
					});
				</script>
				<script>
					function sBtn(){
						let fullEmail = $("#mail_id").val()+'@'+$("#mail_tail").val();
						$("#fullEmail").val(fullEmail);
						findFrm.submit(); 
					}
				</script>
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
				<h2>아이디 찾기</h2>
				<form action="/login/findId" name="findFrm" method="post">
					<input type="hidden" name="fullEmail" id="fullEmail">
					<h4>
					본인 및 이메일확인
					<span>(* 항목은 필수 항목입니다.)</span>
					</h4>
					<fieldset class="fieldset_class">
						<dl id="name">
							<dt>
								<div></div>
								<label for="name_v">이름</label>
							</dt>
							<dd>
								<input type="text" id="name_v" name="name_v" required/>
							</dd>
						</dl>
						<dl id="email">
							<dt>
								<div></div>
								<label for="mail_id">이메일</label>
							</dt>
							<dd>
								<input type="text" id="mail_id" name="mail_id" required />
								<span>@</span>
								<input type="text" id="mail_tail" name="mail_tail" required value="" />
								<select name="domain_select">
									<option value="">직접입력</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="nate.com">nate.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="empal.com">empal.com</option>
									<option value="dreamwiz.com">dreamwiz.com</option>
								</select>
							</dd>
						</dl>
						
					</fieldset>
					<button type="button" onclick="sBtn()">아이디찾기</button>
				</form>
				
			</div>
		</section>
		<!-- ------------------------------------------------------------------------------------------------ -->
		<%@ include file="../footer/footer.jsp" %>
	</body>
</html>