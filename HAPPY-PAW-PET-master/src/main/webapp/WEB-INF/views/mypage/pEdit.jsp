<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="/css/top.css" />
	<link rel="stylesheet" type="text/css" href="/css/mypage/pEdit.css" />
	<link rel="stylesheet" type="text/css" href="/css/footer.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>회원 정보 수정</title>
	<script>
		//이메일 정보 업데이트
		$(function(){
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
		//전화번호 숫자만 가능!
		   $(function(){
			  $("#f_tell").keyup(function(){
				  if(!this.value.replace(/[^0-9]/g,'')){
					$("#alert").text("* 숫자만 입력이 가능합니다.");
				  }else{
					  $("#alert").text("");
				  }
				  this.value=this.value.replace(/[^0-9]/g,'');
			  });
			  $("#m_tell").keyup(function(){
				  if(!this.value.replace(/[^0-9]/g,'')){
					$("#alert").text("* 숫자만 입력이 가능합니다.");
				  }else{
					  $("#alert").text("");
				  }
				  this.value=this.value.replace(/[^0-9]/g,'');
			  });
			  $("#l_tell").keyup(function(){
				  if(!this.value.replace(/[^0-9]/g,'')){
					$("#alert").text("* 숫자만 입력이 가능합니다.");
				  }else{
					  $("#alert").text("");
				  }
				  this.value=this.value.replace(/[^0-9]/g,'');
			  });
		   });
		// controller로 회원가입정보 업데이트
		$(function(){
			$(".uBtn").click(function(){
				let email = $("#mail_id").val()+'@'+$("#mail_tail").val();
				let phone = $("#f_tell").val()+'-'+$("#m_tell").val()+'-'+$("#l_tell").val();
				
				$("#email").val(email);
				$("#phone").val(phone);
				
				if($("#pw1").val() != $("#pw2").val()){
					alert("비밀번호를 확인하여주십시오.")
					return false;
				}else{
					memFrm.submit();
					alert("정보가 수정되었습니다.")
				}
			});
		});
	</script>
	</head>
	<body id="pEdit">
	<%@ include file="../top/top.jsp" %>
		<!-- ------------------------------------------------------------------------- -->
	<section>
		<div class="subbanner"></div>
		<div class="main">
			<h2>회원 정보 수정</h2>
			<form action="/mypage/doUpdateMem" name="memFrm" id="memForm" method="post">
				<input type="hidden" id="email" name="email">
				<input type="hidden" id="phone" name="phone">
				<h4>
					필수 정보 입력 <span>(* 항목은 필수 항목입니다.)</span>
				</h4>
				<fieldset class="fieldset_class">
					<dl id="nameF">
						<dt>
							<div></div>
							<label for="name">이름</label>
						</dt>
						<dd>
							<input type="text" id="name" name="name" value="${mdto.name }" disabled />
						</dd>
					</dl>
					<dl id="idF">
						<dt>
							<div></div>
							<label for="id">아이디</label>
						</dt>
						<dd>
							<input type="text" id="id" name="id" minlength="4" maxlength="16" value="${mdto.id }" disabled />
						</dd>
					</dl>
					<dl id="email">
						<dt>
							<div></div>
							<label for="mail_id">이메일</label>
						</dt>
						<dd>
							<input type="text" id="mail_id" name="mail_id" value="${mdto.email.split('@')[0]}" required /> <span>@</span>
							<input type="text" id="mail_tail" name="mail_tail" required
								value="${mdto.email.split('@')[1]}" /> <select name="domain_select">
								<option value="">직접입력</option>
								<option value="gmail.com" ${fn:contains(mdto.email.split('@')[1], 'gmail.com')?'selected':''} >gmail.com</option>
								<option value="naver.com" ${fn:contains(mdto.email.split('@')[1], 'naver.com')?'selected':''}>naver.com</option>
								<option value="nate.com" ${fn:contains(mdto.email.split('@')[1], 'nate.com')?'selected':''}>nate.com</option>
								<option value="hanmail.net" ${fn:contains(mdto.email.split('@')[1], 'hanmail.net')?'selected':''}>hanmail.net</option>
								<option value="empal.com" ${fn:contains(mdto.email.split('@')[1], 'empal.com')?'selected':''}>empal.com</option>
								<option value="dreamwiz.com" ${fn:contains(mdto.email.split('@')[1], 'dreamwiz.com')?'selected':''}>dreamwiz.com</option>
							</select>
						</dd>
					</dl>
					<dl id="tell">
						<dt>
							<div></div>
							<label for="f_tell">휴대전화</label>
						</dt>
						<dd>
							<input type="text" id="f_tell" name="f_tell" maxlength="3" value="${mdto.phone.split('-')[0]}" required/> <span> - </span>
							<input type="text" id="m_tell" name="m_tell" maxlength="4" value="${mdto.phone.split('-')[1]}" required /> <span> - </span>
							<input type="text" id="l_tell" name="l_tell" maxlength="4" value="${mdto.phone.split('-')[2]}" required />
							<span id="alert"></span>
						</dd>
					</dl>
					<dl id="birth">
						<dt>
							<label for="birth">생년월일</label>
						</dt>
						<dd>
							<input type="date" id="birth" name="birth"  value="${mdto.birth}" max="2024-12-31" min="1930-01-01" onchange="uBtn()">
							<div id="type">
								<input type="radio" name="calendar" id="lunar" value="lunar" checked="checked">
									<label for="lunar">양력</label>
									<input type="radio" name="calendar" id="solar" value="solar" />
									<label for="solar">음력</label>
							</div>
						</dd>
					</dl>
					<dl id="gender">
						<dt>
							<label for="gender_m">성별</label>
						</dt>
						<dd>
							<div>
								<input type="radio" name="gender" id="male" value="male"
									 <c:if test="${mdto.gender == 'male' }">checked</c:if>> <label for="male">남성</label> <input
									type="radio" name="gender" id="female" value="female"
									 <c:if test="${mdto.gender == 'female' }">checked</c:if>/> <label for="female">여성</label>
							</div>
						</dd>
					</dl>
				</fieldset>
				<button type="button" class="uBtn" >저장하기</button>
			</form>
		</div>
	</section>
	<!-- ------------------------------------------------------------------------------------------------ -->
		<%@ include file="../footer/footer.jsp" %>
	</body>
</html>