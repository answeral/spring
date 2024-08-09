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
	<link rel="stylesheet" type="text/css" href="/css/admin/adminMember.css" />
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function(){
		    let c_label = [];  //탈퇴 이유 레이블
		    let g_label = [];  //성비 레이블
		    let c_data = [];   //탈퇴 이유 데이터
		    let g_data = [];   //성비 데이터
		    
		    $("#click").click(function(){
		        //alert("검색을 시작합니다.");
		        
		        // 차트 초기화
		        let chartStatus = Chart.getChart("myChart"); // <canvas> id
		        if (chartStatus != undefined) {
		            chartStatus.destroy();
		        }
		        
		        let chartStatus2 = Chart.getChart("myChart2"); // <canvas> id
		        if (chartStatus2 != undefined) {
		            chartStatus2.destroy();
		        }
		        
		        c_label = [];
		        g_label = [];
		        c_data = [];
		        g_data = [];
		        
		        $.ajax({
		            url: "/admin/byememChart1",
		            type: "post",
		            data: "",
		            dataType: "json",
		            success: function(data){
		               //alert("성공");
		                
		                data.forEach(function(d){
		                    console.log(d.content);
		                    console.log(d.cnt);
		                    c_label.push(d.content);
		                    c_data.push(d.cnt);
		                });
		                
		                // 탈퇴 이유 차트 그리기
		                const ctx = document.getElementById('myChart').getContext('2d');
		                new Chart(ctx, {
		                    type: 'pie',
		                    data: {
		                      labels: c_label,
		                      datasets: [{
		                        label: '탈퇴한 이유',
		                        data: c_data,
		                        borderWidth: 2,
		                        backgroundColor: ['#DABEEE','#CFEFE1','#F0E6B1','#EFB8B0','#9FA0F0','#BDF0DF','#F0C8A4']
		                      }]
		                    },
		                    options: {
		                        responsive: true,
		                        plugins: {
		                            title: {
		                                display: true,
		                                text: '탈퇴회원 이유 분석',
		                                font: {
		                                    size: 20,
		                                    weight: 'bold'
		                                }
		                            },
		                            datalabels: {
		                                formatter: (value, ctx) => {
		                                    let sum = 0;
		                                    let dataArr = ctx.chart.data.datasets[0].data;
		                                    dataArr.map(data => {
		                                        sum += data;
		                                    });
		                                    let percentage = (value * 100 / sum).toFixed(1) + "%";
		                                    return percentage;
		                                },
		                                color: 'black',
		                                font: {
		                                    weight: 'bold'
		                                }
		                            }
		                        },
		                        maintainAspectRatio: false
		                    },
		                    plugins: [ChartDataLabels]
		                });//차트
		            }, // success
		            error: function(){
		                alert("실패");
		            } // error
		        });// ajax
		        
		        $.ajax({
		            url: "/admin/byememChart2",
		            type: "post",
		            data: "",
		            dataType: "json",
		            success: function(data2){
		                //alert("성공");
		                
		                data2.forEach(function(g){
		                    console.log(g.gender);
		                    console.log(g.gcnt);
		                    g_label.push(g.gender);
		                    g_data.push(g.gcnt);
		                });
		                
		                // 남녀 성비 차트 그리기
		                const ctx2 = document.getElementById('myChart2').getContext('2d');
		                new Chart(ctx2, {
		                    type: 'pie',
		                    data: {
		                      labels: g_label,
		                      datasets: [{
		                        label: '남녀성비',
		                        data: g_data,
		                        borderWidth: 2,
		                        backgroundColor: ['#CFEFE1','#DABEEE']
		                      }]
		                    },
		                    options: {
		                        responsive: true,
		                        plugins: {
		                            title: {
		                                display: true,
		                                text: '남녀성비',
		                                font: {
		                                    size: 20,
		                                    weight: 'bold'
		                                }
		                            },
		                            datalabels: {
		                                formatter: (value, ctx) => {
		                                    let sum = 0;
		                                    let dataArr = ctx.chart.data.datasets[0].data;
		                                    dataArr.map(data => {
		                                        sum += data;
		                                    });
		                                    let percentage = (value * 100 / sum).toFixed(1) + "%";
		                                    return percentage;
		                                },
		                                color: 'black',
		                                font: {
		                                    weight: 'bold'
		                                }
		                            }
		                        },
		                        maintainAspectRatio: false
		                    },
		                    plugins: [ChartDataLabels]
		                });// 차트2
		            }, // success
		            error: function(){
		                alert("실패");
		            } // error
		        });// ajax2
		    });// click
		});// jQuery
	</script>
	<title>HappyPawPet 관리자페이지</title>
	</head>
	<body id="admin">
		<%@ include file="../top/adminTop.jsp" %>
		<!-- ------------------------------------------------------------------------- -->
		<section>
			<%@ include file="../admin/subbanner.jsp" %>
			<div class="main">
				<h2><span>회원관리</span></h2>
				<div class="member">
					<h4>회원관리 (총  ${list.size()} 명)</h4>
					<table id="mem">
						<colgroup> 
					    	<col style="width: 10%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 17%;"/> 
					        <col style="width: 18%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 15%;"/> 
					    </colgroup> 
					    <thead>
							<tr>
								<th>회원아이디</th>
								<th>이름</th>
								<th>생일</th>
								<th>휴대전화번호</th>
								<th>이메일</th>
								<th>성별</th>
								<th>이용약관</th>
								<th>개인정보처리방침</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ list}" var="mDto">
									<tr>
										<td>${mDto.id }</td>
										<td>${mDto.name}</td>
										<td><fmt:formatDate value="${mDto.birth }" pattern="yyyy-MM-dd"/></td>
										<td>${mDto.phone }</td>
										<td>${mDto.email }</td>
										<td>${mDto.gender }</td>
										<td>동의</td>
										<td>동의</td>
									</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- ----------------------------------------------------------------------------- -->
				<div class="byemem">
					<h4>탈퇴회원관리 (총  ${blist.size()} 명)</h4>
					<table id="bye">
						<colgroup> 
					    	<col style="width: 15%;"/> 
					        <col style="width: 15%;"/> 
					        <col style="width: 15%;"/> 
					        <col style="width: *%;"/> 
					    </colgroup> 
					    <thead>
							<tr>
								<th>회원아이디</th>
								<th>이름</th>
								<th>성별</th>
								<th>탈퇴이유</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ blist}" var="bDto">
									<tr>
										<td>${bDto.id }</td>
										<td>${bDto.name}</td>
										<td>${bDto.gender }</td>
										<td>${bDto.content }</td>
									</tr>
							</c:forEach>
						</tbody>
					</table>
					<button type="button" id="click">탈퇴회원분석하기</button>
					<div class="chart">
						<div id="chart_c">
							<canvas id="myChart"></canvas>
						</div>
						<div id="chart_g">
							<canvas id="myChart2"></canvas>
						</div>
					</div>
				</div>
			</div>
		</section>
	</body>
</html>