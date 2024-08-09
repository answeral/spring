<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="/css/admin/adminTop.css" />
	<link rel="stylesheet" type="text/css" href="/css/admin/subbanner.css" />
	<link rel="stylesheet" type="text/css" href="/css/admin/adminQna.css" />
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>HappyPawPet 관리자페이지</title>
	</head>
	<body id="admin">
		<%@ include file="../top/adminTop.jsp" %>
		<!-- ------------------------------------------------------------------------- -->
		<%@ include file="../admin/subbanner.jsp" %>
		<section>
			<div class="banner">
				<a href="/admin/admin"><div class="title">ADMINISTRATOR</div></a>
				<ul class="subbanner">
					<li id="s01"><a href="/admin/member">회원관리</a></li>
					<li id="s02"><a href="#">진단내역</a></li>
					<li id="s03"><a href="/admin/pet">반려동물관리</a></li>
					<li id="s04"><a href="/admin/board">게시판</a></li>
					<li id="s05"><a href="/admin/qna">Q&A</a></li>
				</ul>
			</div>
			<div class="main">
				<h2><span>Q&A 분석</span></h2>
				<div class="boardlist">
					<div id="comment">
						<h4>Q&A 리스트</h4>
						<button id="Canalyst" class="Total">키워드분석하기</button>
					</div>
					<table id="board">
						<colgroup> 
					    	<col style="width: 7%;"/> 
					        <col style="width: 25%;"/> 
					        <col style="width: 28%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 10%;"/> 
					    </colgroup> 
					    <thead>
							<tr>
								<th>게시글번호</th>
								<th>제목</th>
								<th>내용</th>
								<th>작성일자</th>
								<th>조회수</th>
								<th>답변수</th>
								<th>이동</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ qalist}" var="qaDto">
								<tr>
									<td id="qno">${qaDto.qno }</td>
									<td>${qaDto.qtitle}</td>
									<td id ="content">${qaDto.qcontent }</td>
									<td>${qaDto.qdate }</td>
									<td>${qaDto.qhit }</td>
									<td>${qaDto.answer_cnt }</td>
									<td id="button"><div id="QnaOne"><a href="/board/qnaView?qno=${qaDto.qno }">바로가기</a></div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- ----------------------------------------------------------------------------- -->
				<!-- 차트분석 -->
				<div class="chart">
					<div id="chart_g">
						<canvas id="myChart"></canvas>
					</div>
					<div id="chart_a">
						<canvas id="myChart2"></canvas>
					</div>
				</div>
				<div class="totalChart">
					<div id="chartT1">
						<canvas id="tChart"></canvas>
					</div>
					<div id="chartT2">
						<canvas id="tChart2"></canvas>
					</div>
				</div>
			</div>
		</section>
	</body>
</html>