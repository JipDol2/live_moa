<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/> <!-- 상대경로 이용 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
<title>쇼핑방송 리스트</title>
<style>
	a{
		text-decoration:none;
	}
	a:hover{
		color:#2CE0BC;
		text-decoration:none;
	}
</style>
</head>

<body>
	<a href="/"><button class="btn btn-link">Go to Index</button></a><br>
	
	<div align="right" style="margin-right: 200px;">
		<c:if test="${mem_id != null}">
			<a href="${root}/signout"><input class="btn btn-success" type="button" value="로그아웃"></a>
			<a href="${root}/interest/list"><input class="btn btn-success" type="button" value="My 관심쇼핑"></a>
		</c:if>
		<c:if test="${mem_id == null}">
			<a href="${root}/loginform"><input class="btn btn-success" type="button" value="로그인"></a>
			<a href="${root}/signupform"><input class="btn btn-success" type="button" value="회원가입"></a><br>

		</c:if>
	</div>
	
	<div class="main_title" style="margin-left: 200px;">
		<h1>LIVE 모아 쇼핑방송 리스트</h1>
		<h5>※중복된 방송은 하나만 저장됩니다.</h5>
	</div>
	
	<div class="cast_category" align="left" style="margin-left: 200px; margin-top:20px;">
		<form class="form_category" action="${root}" method="get" >
			<input class="btn btn-primary" type="submit" name="category" value="all">	
			<input class="btn btn-secondary" type="submit" name="category" value="패션">
			<input class="btn btn-secondary" type="submit" name="category" value="뷰티">
			<input class="btn btn-secondary" type="submit" name="category" value="라이프">
			<input class="btn btn-secondary" type="submit" name="category" value="푸드">
		</form>	
	</div>
	
	<div align="right" style="margin-right: 200px;">
		<a href="${root}/product_registration"><input class="btn btn-outline-success" type="button" value="쇼핑방송 등록"></a><br>
	</div>
		
	<div class= "container my-3">
		<table class="table" swidth="1200px" >
		    <thead>
		        <tr class="thead-dark">
		        	<th>카테고리</th>
		        	<th>일자</th>
		            <th>시간</th>
		            <th>방송명</th>
		            <th>플랫폼</th>
		            <th>판매자</th>
		            <th>관심버튼</th>
		            <th>작성자</th>
					<th>상품정보</th>
		        </tr>
		    </thead>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.category}</td>
					<td>${dto.cast_date}</td>
					<td>${dto.cast_time}</td>
					<td class="btn btn-link"><a href="${dto.shopping_link}">${dto.cast_name}</a></td>
					<td>${dto.cast_platform}</td>
					<td>${dto.seller}</td>
					<td>
						<input class="btn btn-outline-danger" type="button" value = "관심" id="btn_interest" 
						onclick="location.href='/insertInterest/${pg}/${dto.cast_id}'">
					</td>
					<td>${dto.mem_id}</td>			
					<td><a href="/shopping/read/${pg}/${dto.cast_id}"><button class="btn btn-info" value = "상품정보">상품정보</button></a></td>
				</tr>
			</c:forEach>
		</table>

		<!-- ############## 페이징 ############# -->
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		    <c:if test="${pg > pageSize}">
		    	<a class="page-link" href="${root}/shopping/list/?pg=${startPage-1}&category=${category}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
				<!-- <a class="page-link" href="${root}/shopping/list/?pg=1&category=${category}"><span aria-hidden="true">FIRST</span></a>   -->
			</c:if>
		      
		    </li>
		    
		    <c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li class="page-item"><a class="page-link" href="${root}/shopping/list/?pg=${i}&category=${category}">${i}</a></li>
   			</c:forEach>
   			
		    <li class="page-item">
		    <c:if test="${endPage >= totalPage}">
		    	<a class="page-link" href="${root}/shopping/list/?pg=${endPage+1}&category=${category}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
		    	<!-- <a class="page-link" href="${root}/shopping/list/?pg=${totalPage}&category=${category}"><span aria-hidden="true">LAST</span></a>  -->
		    </c:if>
		    </li>
		  </ul>
		</nav>
		<!-- ############## 페이징 ############# -->
	</div>

</body>
</html>