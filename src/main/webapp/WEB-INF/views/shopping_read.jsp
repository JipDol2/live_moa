<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- core 라이브러리 불러오기, prefix는 '<'다음에 태그명 지정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑방송 세부정보</title>
<link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${root}/resources/js/main.js"></script>
<style>
	a{
		color:#464646;
		text-decoration:none;
	}
	a:hover{
		color:#aaaaaa;
		text-decoration:none;
	}
</style>
<script>
// 수정/삭제 버튼 연결완료
$(function(){
	$("#btn_update").on('click', function(){
		var confirm_test=confirm("수정을 하시겠습니까?");
		if(confirm_test==true){
			alert("확인을 누르셨습니다");
			$("#updateform").submit();
		}else{
			alert("취소를 누르셨습니다.");
		}
	});
	$("#btn_delete").on('click', function(){
		var confirm_test=confirm("삭제를 하시겠습니까?");
		if(confirm_test==true){
			alert("확인을 누르셨습니다");
			$("#deleteform").submit();
		}else{
			alert("취소를 누르셨습니다.");
		}
	});
});
</script>
</head>
<body>
	<a href="/"><button class="btn btn-link">Go to Index</button></a><br>
	
	<div class="main_title" style="margin-left: 200px;">
		<h1>방송 세부정보</h1>
	</div>

	<div align="right" style="margin-right: 200px;">
		<a href="${root}/shopping/list/"><button class="btn btn-outline-info">쇼핑방송 리스트</button></a>
	</div>

	<div class= "container my-3" id="details">
		<div class="cast_list">
			<a href="${sdto.shopping_link}" style="display:inline-block; font-size:35px">방송명: ${sdto.cast_name}</a>			
			<table class="table" width="600px">
			    <thead>
			        <tr class="thead-dark">
			        	<th>일자</th>
			            <th>시간</th>
			            <th>플랫폼</th>
			            <th>판매자</th>
			        </tr>
			    </thead>
				<tr>
					<td>${sdto.cast_date}</td>
					<td>${sdto.cast_time}</td>
					<td>${sdto.cast_platform}</td>
					<td>${sdto.seller}</td>
	
				</tr>
			</table>
		</div>
		<div class= "container my-3" id="details">
		
		<div class= "product_list" style="margin-top:50px;">
			<h3>제품 정보</h3>

			<table class="table">
				<thead>
					<th>제품명</th>
					<th>할인율</th>
					<th>가격</th>
				</thead>
				<tbody>
					<c:forEach var="p" items="${pdto}">
					<tr class="thead-dark">
						<td>${p.product_name}</td>
						<td>${p.discount}</td>
						<td>${p.price}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
		
		<!-- 쇼핑방송 수정/삭제 버튼 -->
		<div class="btn_update_and_delete" style="display:flex; justify-content:flex-end;">			
  			<form action="${root}/product_updateform/${sdto.cast_id}/${pg}" id="updateform">
				<input class="btn btn-primary" type="button" value="방송정보 수정" id="btn_update">	
				<input type="hidden" name="mem_id" value="${sdto.mem_id}">			
			</form>
			<form action="${root}/product_deleteform/${sdto.cast_id}/${pg}" id="deleteform">
		  		<input class="btn btn-danger" type="button" value="방송정보 삭제" id="btn_delete">
				<input type="hidden" name="mem_id" value="${sdto.mem_id}">
			</form>					
		</div>

		<!-- 댓글 영역 -->
		<div class="comments" style="margin-top:50px;">
			<h3>댓글</h3>
			<form action="/comments/write" method="POST" id="form_comments" align="center">
				<textarea rows="5" cols="150" name="content" id="content"></textarea>
				<input type="hidden" name="cast_id" value="${sdto.cast_id}">
				<input type="hidden" name="pg" value="${pg}">
				<div align="right">
					<input class="btn btn-primary" type="submit" value="댓글달기">
				</div>
			</form>
			
			<c:forEach var="c" items="${cdto}">
				<h5><div class="mem_id">${c.mem_id}</div></h5>
				<div class="write_date" align="right">${c.write_date}</div>
				<div class="content" style="margin-bottom:10px;">${c.content}</div>
				
				<!-- 댓글 수정/삭제 -->
				<div align="right" style="display:flex; justify-content:flex-end;">
					<form action="${root}/comments/updateform/${c.comment_id}">
						<input class="btn btn-outline-primary" type="button" value="댓글 수정" class="btn_update">				
					</form>
					<form action="${root}/comments/delform" method="post">
						<input class="btn btn-outline-danger" type="button" value="댓글 삭제" class="btn_delete">
						<input type="hidden" name="comment_id" value="${c.comment_id}">
					</form>
				</div>
			</c:forEach>
			
		</div>
	</div> 
</body>
</html>