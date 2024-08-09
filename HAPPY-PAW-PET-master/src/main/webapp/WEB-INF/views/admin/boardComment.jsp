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
	<link rel="stylesheet" type="text/css" href="/css/admin/boardComment.css" />
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function(){
		    let g_label = [];  //성비 레이블
		    let g_data = [];   //성비 데이터
		    let a_label= [];
		    let a_data= [];
		    
		    $(".click").click(function(){
		    	$(".chart").css("display","flex");
		    	//alert("검색 시작");
		        let bno = $(this).attr("id");
		        
		        // 차트 초기화
		        let chartStatus = Chart.getChart("myChart"); // <canvas> id
		        if (chartStatus != undefined) {
		            chartStatus.destroy();
		        }
		        
		        let chartStatus2 = Chart.getChart("myChart2"); // <canvas> id
		        if (chartStatus2 != undefined) {
		            chartStatus2.destroy();
		        }
		        
		        g_label = [];
		        g_data = [];
		        a_label= ['0-9세','10대','20대','30대','40대','50대이상'];
		        a_data= [];
		        
		        $.ajax({
		            url: "/admin/commentChart1",
		            type: "post",
		            data: {"bno":bno},
		            dataType: "json",
		            success: function(data){
		                //alert("성공");
		                
		                data.forEach(function(d){
		                    console.log(d.gender);
		                    console.log(d.cnt);
		                    g_label.push(d.gender);
		                    g_data.push(d.cnt);
		                });
		                
		                // 댓글 남녀성비 
		                const ctx = document.getElementById('myChart').getContext('2d');
		                new Chart(ctx, {
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
		                                text: '댓글남녀성비',
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
		            url: "/admin/commentChart2",
		            type: "post",
		            data: {"bno":bno},
		            dataType: "json",
		            success: function(data2){
		                //alert("성공");
		               
		                data2.forEach(function(a){
		                    console.log(a.age_group);
		                    console.log(a.acnt);
		                    //a_label.push(a.age_group);
		                    a_data.push(a.acnt);
		                });
		               
		                // 연령대별 차트 그리기
		                const ctx2 = document.getElementById('myChart2').getContext('2d');
		                new Chart(ctx2, {
		                    type: 'bar',
		                    data: {
		                      labels: a_label,
		                      datasets: [{
		                        label: '연령대',
		                        data: a_data,
		                        borderWidth: 2,
		                        backgroundColor: ['#DABEEE','#CFEFE1','#F0E6B1','#EFB8B0','#9FA0F0','#BDF0DF']
		                      }]
		                    },
		                    options: {
		                        responsive: true,
		                        plugins: {
		                            title: {
		                                display: true,
		                                text: '연령대',
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
		                        maintainAspectRatio: false,
		                        scales: {
		                            x: {
		                                grid: {
		                                    display: false
		                                }
		                            },
		                            y: {
	                                    display: false,
		                                grid: {
		                                    display: false
		                                    }
		                                }
		                            }
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
	<script>
		$(function(){
		    let tg_label = [];  //전체 성비 레이블
		    let tg_data = [];   //전체 성비 데이터
		    let ta_label= [];	//전체 연령 레이블
		    let ta_data= [];	//전체 연령 데이터
		    
		    $(".Total").click(function(){
		    	$(".totalChart").css("display","flex");
		        
		        // 차트 초기화
		        let chartStatus = Chart.getChart("tChart"); // <canvas> id
		        if (chartStatus != undefined) {
		            chartStatus.destroy();
		        }
		        
		        let chartStatus2 = Chart.getChart("tChart2"); // <canvas> id
		        if (chartStatus2 != undefined) {
		            chartStatus2.destroy();
		        }
		        
		        tg_label = [];
		        tg_data = [];
		        ta_label= ['0-9세','10대','20대','30대','40대','50대이상'];
		        ta_data= [];
		        
		        $.ajax({
		            url: "/admin/ctChart1",
		            type: "post",
		            data: "",
		            dataType: "json",
		            success: function(data){
		                //alert("성공");
		                
		                data.forEach(function(d){
		                    console.log(d.gender);
		                    console.log(d.cnt);
		                    tg_label.push(d.gender);
		                    tg_data.push(d.cnt);
		                });
		                
		                // 댓글 남녀성비 
		                const ctx = document.getElementById('tChart').getContext('2d');
		                new Chart(ctx, {
		                    type: 'pie',
		                    data: {
		                      labels: tg_label,
		                      datasets: [{
		                        label: '남녀성비',
		                        data: tg_data,
		                        borderWidth: 2,
		                        backgroundColor: ['#F0AB81','#F0E898']
		                      }]
		                    },
		                    options: {
		                        responsive: true,
		                        plugins: {
		                            title: {
		                                display: true,
		                                text: '댓글 수 Top 10 댓글작성자 남녀성비',
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
		            url: "/admin/ctChart2",
		            type: "post",
		            data: "",
		            dataType: "json",
		            success: function(data2){
		                //alert("성공");
		               
		                data2.forEach(function(a){
		                    console.log(a.age_group);
		                    console.log(a.acnt);
		                    //ta_label.push(a.age_group);
		                    ta_data.push(a.acnt);
		                });
		               
		                // 연령대별 차트 그리기
		                const ctx2 = document.getElementById('tChart2').getContext('2d');
		                new Chart(ctx2, {
		                    type: 'bar',
		                    data: {
		                      labels: ta_label,
		                      datasets: [{
		                        label: '연령대',
		                        data: ta_data,
		                        borderWidth: 2,
		                        backgroundColor: ['#DABEEE','#CFEFE1','#F0E6B1','#EFB8B0','#9FA0F0','#BDF0DF']
		                      }]
		                    },
		                    options: {
		                        responsive: true,
		                        plugins: {
		                            title: {
		                                display: true,
		                                text: '댓글 수 Top 10 댓글작성자 연령대',
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
		                        maintainAspectRatio: false,
		                        scales: {
		                            x: {
		                                grid: {
		                                    display: false
		                                }
		                            },
		                            y: {
	                                    display: false,
		                                grid: {
		                                    display: false
		                                    }
		                                }
		                            }
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
				<h2><span>댓글 분석</span></h2>
				<div class="boardlist">
					<div id="comment">
						<h4>댓글수 Top 10</h4>
						<button id="Canalyst" class="Total">전체글분석</button>
					</div>
					<table id="board">
						<colgroup> 
					    	<col style="width: 5%;"/> 
					        <col style="width: 25%;"/> 
					        <col style="width: 30%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 10%;"/> 
					    </colgroup> 
					    <thead>
							<tr>
								<th>순위</th>
								<th>제목</th>
								<th>내용</th>
								<th>작성일자</th>
								<th>조회수</th>
								<th>댓글수</th>
								<th>댓글성비분석</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="rank" value="1"/>
							<c:forEach items="${ clist}" var="cDto">
								<tr>
									<td id="rank">${rank }</td>
									<td>${cDto.btitle}</td>
									<td id ="content">${cDto.bcontent }</td>
									<td>${cDto.bdate }</td>
									<td>${cDto.bhit }</td>
									<td>${cDto.comment_cnt }</td>
									<td id="button"><button type="button" id="${cDto.bno}" class="click">확인하기</button></td>
									<c:set var="rank" value="${rank +1 }"/>
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