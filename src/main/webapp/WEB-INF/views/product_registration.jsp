<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="resources/js/main.js"></script>
<link href="resources/bootstrap/bootstrap-4.5.3-dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<main class="mainbox">
		<form action="product_reg" id="product_registration" name="product_registration" method="post">
			<nav class="navbar">
	            <h3 class="small_title">방송 등록</h3>
	        </nav>        	
			<ul class="list-group">
				<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control" name="cast_name" id="cast_name">
				</div>
				<div class="form-group">
					<label>판매자</label>
					<input type="text" class="form-control" name="seller" id="seller">
				</div>
				<div class="form-group">
					<label>쇼핑링크</label>
					<input type="text" class="form-control" name="shopping_link" id="shopping_link">
				</div>				
			</ul>
			<label>카테고리</label> 
			<select class="form-control" id="category" name="category" required autofocus>
				<option value="패션" selected>패션</option>
				<option value="뷰티">뷰티</option>
				<option value="라이프">라이프</option>
				<option value="푸드">푸드</option>
			</select>
			<label>플랫폼</label> 
			<select class="form-control" id="cast_platform" name="cast_platform" required autofocus>
				<option value="naver" selected>네이버</option>
				<option value="kakao">카카오</option>
				<option value="11burn">11번가</option>
				<option value="tvon">티비온</option>
			</select>
			<div class="upload_product">
				<span>*최대 3개까지의 상품만 등록할 수 있습니다.</span>
				<ul class="input_2">
					<li>
						<span><span>상품1:</span><input type="text" class="fome-control_cp" name="product1" id="product1"></span>
						<span><span>가격:</span><input type="text" class="fome-control_cp" name="price1" id="price1"></span> 
						<span><span>할인률:</span><input type="text" class="fome-control_cp" name="discount1" id="discount1"></span>
					</li>
					<li>
						<span><span>상품2:</span><input type="text" class="fome-control_cp" name="product2" id="product2"></span>
						<span><span>가격:</span><input type="text" class="fome-control_cp" name="price2" id="price2"></span> 
						<span><span>할인률:</span><input type="text" class="fome-control_cp" name="discount2" id="discount2"></span>
					</li>
					<li>
						<span><span>상품3:</span><input type="text" class="fome-control_cp" name="product3" id="product3"></span>
						<span><span>가격:</span><input type="text" class="fome-control_cp" name="price3" id="price3"></span> 
						<span><span>할인률:</span><input type="text" class="fome-control_cp" name="discount3" id="discount3"></span>
					</li>
				</ul>
			</div> 		
			<input type="text" class="fome-control_cp" id="cast_date" name="cast_date" placeholder="yyyy-MM-dd">년월일<br>
			<input type="text" class="fome-control_cp" id="cast_time" name="cast_time" placeholder="hh:00">시간<br>
			<div class="button">
				<input type="button" class="btn btn-primary" value="등록" id="btn_write">
				<a href="${root}/shopping/list"><input type="button" class="btn btn-primary" value="취소"></a>
			</div>
		</form>
	</main>
	</form>
</body>
</html>