<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="/css/top.css" />
	<link rel="stylesheet" type="text/css" href="/css/mypage/changePw.css" />
	<link rel="stylesheet" type="text/css" href="/css/footer.css" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>HappyPawPet 비밀번호 변경</title>
	<script>
	   //페이지 시작시 오픈된 페이지인지, 에러로 리턴된 페이지인지 확인
	   console.log("errorM : ${errorM}");
	   if("${errorM}" != ""){
		   alert("${errorM}"); 
	   }
	   
		// onclick형식, 비밀번호 생성
		var newPwVar = false;
		function newPw(){
			var pw = $("#newPw1").val();
			var hasLetter = /[a-zA-Z]/.test(pw);
			var hasNumber = /[0-9]/.test(pw);
			var specialChar = /[!@#$%^&*+?]/.test(pw);
			
			var cnt = 0;
			if (hasLetter) cnt++; //문자가 포함되면 ++
			if (hasNumber) cnt++; //숫자가 포함되면 ++
			if (specialChar) cnt++; //특수문자가 포함되면 ++
			console.log(cnt);	
			if (cnt == 2){
				if(pw.length >= 10){
					$("#NewPw").css("display","inline-block");
					$("#NoPw").css("display","none");
					newPwVar = true;
				}else{
					$("#NewPw").css("display","none");
					$("#NoPw").css("display","inline-block");
				}
			}else if(cnt == 3){
				if(pw.length >= 8){
					$("#NewPw").css("display","inline-block");
					$("#NoPw").css("display","none");
					newPwVar = true;
				}else{
					$("#NewPw").css("display","none");
					$("#NoPw").css("display","inline-block");
				}
			}else{
					$("#NewPw").css("display","none");
					$("#NoPw").css("display","inline-block");
			}
		}
		//비밀번호 확인
		var pwCheckVar = false;
		function pwCheck(){
			if($("#newPw1").val() == $("#newPw2").val()){
				$("#pwConfirm").text('비밀번호가 일치합니다.').css('color','blue');
				pwCheckVar = true;
			}else{
				$("#pwConfirm").text('비밀번호가 일치하지 않습니다.').css('color','red');
			}
		}
	
	    // 폼 제출 처리
	    function cBtn() {
	        var oldPw = $("#old_pw").val();
	        var newPw1 = $("#newPw1").val();
	        var newPw2 = $("#newPw2").val();
		    // 비밀번호가 입력되지 않은 경우 경고 표시
			if (!oldPw || !newPw1 || !newPw2) {
			    alert("모든 비밀번호를 입력해 주세요.");
			    return false;
			    }
			if(oldPw===newPw1){
    			alert("기존 비밀번호와 동일합니다. 새 비밀번호를 입력해주세요.");
    			$("#newPw1").focus();
    			return false;
    			}
			if (!newPwVar) {
		        alert("새 비밀번호의 조건이 만족되지 않았습니다. 다시 입력해주세요.");
		        $("#newPw1").focus();
		        return false; // 폼 제출 방지
		    	}
			if(!pwCheckVar){
				alert("새 비밀번호와 확인 비밀번호가 일치하지 않습니다. 다시 입력해주세요.")
    			$("#newPw2").focus();
    			return false; 	
    	    }
		    changeFrm.submit();	
		    
		}//cBtn()
	</script>
	</head>
	<body id="changePw" >
		<%@ include file="../top/top.jsp" %>
		<!-- ------------------------------------------------------------------------- -->
		<section>
			<div class="subbanner"></div>
			<div class="main">
				<h2>비밀번호 변경</h2>
				    <input type="hidden" id="chkPw" />
				<form action="/mypage/changePw" name="changeFrm" method="post">
					<fieldset id="fieldset_class">
						<dl id="exis">
							<dt>
								<div></div>
								<label for="exis">기존 비밀번호</label>
							</dt>
							<dd>
								<input type="password" id="old_pw" name="old_pw" minlength="8"
									placeholder="기존 비밀번호 확인" autoComplete="off" required />
							</dd>
						</dl>
					</fieldset>
					<div></div>
					<fieldset id="fieldset_class">
						<dl id="pwF">
							<dt>
								<div></div>
								<label for="pw">새 비밀번호</label>
							</dt>
							<dd>
								<input type="password" id="newPw1" name="newPw1" minlength="8"
									placeholder="새 비밀번호 입력" autoComplete="off" oninput="newPw()" required />
								<div id="NewPw">
									<i class="fa-solid fa-check" style="color: #226853;"></i>&ensp;사용
									가능한 비밀번호입니다.
								</div>
								<div id="NoPw">
									<i class="fa-solid fa-check" style="color: #e21212;"></i>&ensp;사용
									불가능한 비밀번호입니다.
								</div>
								<span>영문, 숫자, 특수문자(!@#$%^&*+?) 중 2종류 조합 시 10자리 이상 입력</span> <span>영문,
									숫자, 특수문자(!@#$%^&*+?) 모두 조합 시 8자리 이상 입력</span>
							</dd>
						</dl>
						<dl id="pw2F">
							<dt>
								<div></div>
								<label for="newPw2">새 비밀번호 확인</label>
							</dt>
							<dd>
								<input type="password" id="newPw2" name="newPw2" minlength="8"
									placeholder="새 비밀번호 확인" autoComplete="off" oninput="pwCheck()" required /> <span
									id="pwConfirm">비밀번호를 확인하세요.</span>
							</dd>
						</dl>
					</fieldset>
					<button type="button" onclick="cBtn()">변경 완료</button>
				</form>
				
			</div>
		</section>
		<!-- ------------------------------------------------------------------------------------------------ -->
		<%@ include file="../footer/footer.jsp" %>
	</body>
</html>