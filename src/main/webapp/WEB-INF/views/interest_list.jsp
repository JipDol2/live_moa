<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<title>관심쇼핑 모아보기</title>
</head>

<body>
	<a href="/"><button class="btn btn-link">Go to Index</button></a><br>
	
	<div class="main_title" style="margin-left: 200px;">
		<h1>관심쇼핑 모아보기</h1>
	</div>

	<div align="right" style="margin-right: 200px;">
		<a href="${root}/shopping/list"><input class="btn btn-outline-info" type="button" value="쇼핑방송 리스트"></a>
	</div>
	
	<div class= "container my-3">
		<table class="table" width="1200px">
		    <thead>
		        <tr class="thead-dark">
		        	<th>일자</th>
		            <th>시간</th>
		            <th>방송명</th>
		            <th>플랫폼</th>
		            <th>판매자</th>
		            <th>작성자</th>
					<th>제품명</th>
					<th>가격</th>
					<th>상품정보</th>
					<th>관심버튼</th>
		        </tr>
		    </thead>
			<c:forEach var="dto" items="${interestDTO}">
				<tr>
					<td>${dto.cast_date}</td>
					<td>${dto.cast_time}</td>
					<td class="btn btn-link"><a href="${dto.shopping_link}">${dto.cast_name}</a></td>
					<td>${dto.cast_platform}</td>
					<td>${dto.seller}</td>
					<td>${dto.mem_id}</td>			
					<td>${dto.product_name}</td>
					<td>${dto.price}</td>
					<td><a href="${root}/shopping/read/1/${dto.cast_id}"><button class="btn btn-info" value = "상품정보"><img src="">상품정보</button></a></td> <!-- pg번호는 임시로 부여 -->
					<td>
						<form action="${root}/interest/delete" method="post">
							<input class="btn btn-danger" type="submit" value = "삭제" id="btn_interest">
							<input type="hidden" name="cast_id" value = "${dto.cast_id}">
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>