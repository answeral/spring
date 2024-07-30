<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    

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
					console.log("sessionId : ${sessionId}");
					if (${sessionId == null}){
						alert("로그인 이후 이용 가능한 페이지입니다.");
						location.href="/login/login";
					}else{
						console.log("test");
						location.href="/login/myPage";
					}
				});
			});
		</script>
		<div id="navi">
				<div class="qmenu">
					<ul>
						<li><a href="/index" id="q01">Home</a></li>
						<li><a href="#" id="q02">CheckTools</a></li>
						<li><a href="#" id="q03">Emergency</a></li>
						<li><a href="#" id="q04">Adoption</a></li>
						<c:if test="${sessionId == null }">
						<li><a href="/login/login" id="q05">Login</a></li>
						</c:if>
						<c:if test="${sessionId != null }">
						<li><a href="/login/logout" id="q05">Logout</a></li>
						</c:if>
						<li><a href="#" id="q06">MyPage</a></li>
					</ul>
				</div>
			</div>
		</nav>
</header>