<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>차트그리기</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<style>
			#main{border: 3px solid black; width:80%; height:550px; margin:20px auto;}
		</style>
		<script >
			$(function(){
				

				//let ch_label=['대구', '경북', '경남', '제주', '광주', '대전','세종','인천','울산','전북','강원','전남','서울','경기','충북','부산','충남'];
				//let ch_data = [273997,203285.1];
				
				let ch_label;
				let ch_data;
				//차트 초기화
				let chartStatus = Chart.getChart("myChart"); // <canvas> id
				  if (chartStatus != undefined) {
				  	chartStatus.destroy();
				  }
				
				ch_label=[];
				ch_data=[];
				
				$("#btn").click(function(){
						alert("검색을 시작합니다");
					$.ajax({
						url:"/chart_data",
						type:"post",
						data:{"data":$("#data").val()},
						dataType:"json",
						success:function(data){
							alert("성공");
							console.log(data);
							
							
							
							data.forEach(function(d){
								console.log(d.region);
								console.log(d.period);
								console.log(d.amt);
								
								if(d.period==null) {ch_label.push(d.region); 
								ch_data.push(d.amt);}
								else {ch_label.push(d.period);
								ch_data.push(d.amt);}
								
							});
							
							const ctx = document.getElementById('myChart');
							
							  new Chart(ctx, {
							    type: 'bar',
							    data: {
							      labels: ch_label,
							      datasets: [{
							        label: '지역별 대출액',
							        data: ch_data,
							        borderWidth: 1
							      }]
							    },
							    options: {
							      scales: {
							        y: {
							          beginAtZero: true
							        }
							      }
							    }
							  });
							
							
						},
						error:function(){
							alert("실패");
						}
					});
					
				
					
					
					
					
				});
			});//jquery
		</script>
	</head>
	<body>
		<h2>차트그리기</h2>
		<label>데이터</label>
		<select name="data" id="data">
			<option value="region">지역별</option>
			<option value="period">기간별</option>
		</select>
		<button type="button" id="btn">검색</button>
		<br><br>
		<div id="main">
		  <canvas id="myChart"></canvas>
		</div>
		
		<script>
		  
		</script>
	
	</body>
</html>