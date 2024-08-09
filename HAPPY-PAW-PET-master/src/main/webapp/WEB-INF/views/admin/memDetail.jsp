<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="/css/admin/adminTop.css" />
	<link rel="stylesheet" type="text/css" href="/css/admin/memDetail.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>MY PAGE</title>
</head>
<body id="mypage">
<%@ include file="../top/adminTop.jsp" %>
<!--  ------------------------------------------------------------------------------------------------------------>
	<section>
        <div id="blank1"></div>
        <div id="main">
            <div id="sub_top_area">
                <h3>회원 정보</h3>
            </div>
            <div id="profile">
                <div id="image">
                    <img src="/upload/${mDto.profile }" alt="프로필 이미지">
                </div>
                <div id="info">
                        <div class="hello">${mDto.name } 님의 회원 정보 &ensp;</div>
                        <table id="mem">
                        	<colgroup>
                        		<col style="width: 20%;"/>
                        		<col style="width: 25%;"/>
                        		<col style="width: 30%;"/>
                        	</colgroup>
                        	<tbody>
                        		<tr>
                        			<th>ID</th>
                        			<td>${mDto.id }</td>
                        			<td></td>
                        		</tr>
                        		<tr>
                        			<th>이름</th>
                        			<td>${mDto.name }</td>
                        			<td></td>
                        		</tr>
                        		<tr>
                        			<th>생일</th>
                        			<td>${mDto.birth }</td>
                        			<td></td>
                        		</tr>
                        		<tr>
                        			<th>성별</th>
                        			<td>${mDto.gender }</td>
                        			<td></td>
                        		</tr>
                        		<tr>
                        			<th>전화번호</th>
                        			<td>${mDto.phone }</td>
                        			<td id="button"><div id="memInfo"><a href="/admin/">문자보내기</a></div></td>
                        		</tr>
                        		<tr>
                        			<th>Email</th>
                        			<td>${mDto.email }</td>
                        			<td id="button"><div id="memInfo"><a href="/admin/">이메일보내기</a></div></td>
                        		</tr>
                        	</tbody>
                        </table>
                        
                    <div id="blank2"></div>
                        <div class="infoB" id="dEdit_button">${mDto.name } 님의 반려동물 정보</div>
                        <div class="petlist">
							<h4>반려동물정보관리 (총 ${plist.size()} 마리)</h4>
							<c:forEach items="${plist }" var="pDto">
							<table id="pet">
								<colgroup> 
							        <col style="width: 25%;"/> 
							        <col style="width: 15%;"/> 
							        <col style="width: 20%;"/> 
							    </colgroup> 
								<tbody>
									<tr>
										<td rowspan="6" style="background: #FAF7F0;border-top: none;border-left: none;
										border-bottom: none;"><img id="pfile" src="/upload/${pDto.pfile }"></td>
										<th>이름</th>
										<td>${pDto.pname}</td>
									</tr>
									<tr>
										<th>무게(kg)</th>
										<td>${pDto.pweight}</td>
									</tr>
									<tr>
										<th>생일</th>
										<td><fmt:formatDate value="${pDto.pbirth }" pattern="yyyy-MM-dd"/></td>
									</tr>
									<tr>
										<th>나이</th>
										<td>만 ${pDto.page }세</td>
									</tr>
									<tr>
										<th>성별</th>
										<td>${pDto.pgender }</td>
									</tr>
									<tr>
										<th>중성화여부</th>
										<td>${pDto.psurgery }</td>
									</tr>
								</tbody>
							</table>
							</c:forEach>
						</div>
                    </div>
                </div>  
        </div>	
    </section>
<!-- ---------------------------------------------------------------------------- ------------------------------------------------->
</body>
</html>