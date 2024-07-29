<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list 페이지</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
	<section>
		<script>
			$(function(){
				$("#Btn").click(function(){
					alert("버튼 클릭");
					 
					$.ajax({
			       	 		url:"public_data",
			       	 		type:"post",
			       	 		data:{},
			       	 		dataType:"json",
			       	 		success:function(data){
			       	 			alert("성공");
			       	 			console.log("controller data : "+data);
			       	 			
			       	 			let arr = data.response.body.items.item;
			       	 			let htmlData = "";
			    	      
			       	 			for(let i=0;i<arr.length;i++){
				       	 			htmlData += '<tr>';
				       	 			htmlData += '<td>'+ arr[i].careNm +'</td>';
				       	 			htmlData += '<td>'+ arr[i].careAddr +'</td>';
				       	 			htmlData += '<td>'+ arr[i].careTel +'</td>';
				       	 			htmlData += '<td>'+ arr[i].age +'</td>';
				       	 			htmlData += '<td>'+ arr[i].specialMark +'</td>';
				       	 			htmlData += '</tr>';
			       	 			}
			       	 			
			       	 			$("#tbody").html(htmlData);
			       	 		},
			       	 		error:function(){
			       	 			alert("실패");
			       	 		}
			       	    });//ajax
					
					
				});
			});
		</script>
		<h2>main 페이지</h2>
		
        <button type="button" id="Btn">데이터 불러오기<i class="fas fa-search"></i></button>

		 <table>
		      <colgroup>
		        <col width="10%">
		        <col width="35%">
		        <col width="5%">
		        <col width="10%">
		        <col width="40%">
		      </colgroup>
		      <!-- 제목부분 -->
		      <tr>
		        <th>careNm</th>
		        <th>careAddr</th>
		        <th>careTel</th>
		        <th>age</th>
		        <th>specialMark</th>
		      </tr>
			      <!-- 내용부분 -->
			      <tbody id="tbody">
			     
      			</tbody>
      
    </table>
	</section>
	</body>
</html>