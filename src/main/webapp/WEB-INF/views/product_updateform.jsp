<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(function(){
	 $('#btn_update').on('click',function(){
	    	if($("#cast_name").val()==""){
	            alert("방송제목을 입력해주세요");
	            $("#cast_name").focus();
	            return;
	        }
	        if($("#seller").val()==""){
	            alert("판매자를 입력해주세요");
	            $("#seller").focus();
	            return;
	        }
	        if($("#cast_date").val()==""){
	            alert("날짜를 입력해주세요");
	            $("#cast_date").focus();
	            return;
	        }
	        if($("#cast_time").val()==""){
	            alert("시간을 입력해주세요");
	            $("#cast_time").focus();
	            return;
	        }
	        if($("#product1").val()==""){
				alert("상품 1개는 등록해주세요");
				$("product1").focus();
				return;
			}
			if($("#price1").val()==""){
				alert("상품 1개는 등록해주세요");
				$("#price1").focus();
				return;
			}
			if($("#discount1").val()==""){
				alert("상품 1개는 등록해주세요");
				$("#discount1").focus();
				return;
			}
			if(isNaN($('#price1').val())==true){
				alert("가격란에 문자를 입력하시면 안됩니다.");
				return;
			}
			if(isNaN($('#discount1').val())==true){
				alert("할인란에 문자를 입력하시면 안됩니다.");
				return;
			}
			if(isNaN($('#price2').val())==true){
				alert("가격란에 문자를 입력하시면 안됩니다.");
				return;
			}
			if(isNaN($('#discount2').val())==true){
				alert("할인란에 문자를 입력하시면 안됩니다.");
				return;
			}
			if(isNaN($('#price3').val())==true){
				alert("가격란에 문자를 입력하시면 안됩니다.");
				return;
			}
			if(isNaN($('#discount3').val())==true){
				alert("할인란에 문자를 입력하시면 안됩니다.");
				return;
			}
	        $("#product_updateform").submit();
	    });
});
</script>
<link href="<%=request.getContextPath()%>/resources/bootstrap/bootstrap-4.5.3-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<main class="mainbox">
		<form action="${root}/product_update" id="product_updateform" name="product_updateform" method="post">
			<nav class="navbar">
	            <h3 class="small_title">방송 수정</h3>
	        </nav>
			<ul class="input_1">
				<div class="form-group">
					<label>제목</label>
	                <input type="text" class="form-control" name="cast_name" id="cast_name" value="${sdto.cast_name}">
	            </div>
				<div class="form-group">
					<label>판매자</label><input type="text" class="form-control" name="seller" id="seller" value="${sdto.seller}">
				</div>
				<div class="form-group">
					<label>쇼핑링크</label><input type="text" class="form-control" name="shopping_link" id="shopping_link" value="${sdto.shopping_link}">
				</div>
			</ul>
			<label>카테고리</label> 
	        <select class="form-control" id="category" name="category" required autofocus>
				<option value="패션" <c:if test="${sdto.category == '패션'}">selected</c:if>>패션</option>
				<option value="뷰티" <c:if test="${sdto.category == '뷰티'}">selected</c:if>>뷰티</option>
				<option value="라이프" <c:if test="${stdo.category == '라이프'}">selected</c:if>>라이프</option>
				<option value="푸드" <c:if test="${stdo.category == '푸드'}">selected</c:if>>푸드</option>
			</select>			
			<lable>플랫폼 : </label> 
	        <select class="form-control" id="cast_platform" name="cast_platform" required autofocus>
				<option value="naver" <c:if test="${sdto.cast_platform == 'naver'}">selected</c:if>>네이버</option>
				<option value="kakao"<c:if test="${sdto.cast_platform == 'kakao'}">selected</c:if>>카카오</option>
				<option value="eleven_burn"<c:if test="${sdto.cast_platform == 'eleven_burn'}">selected</c:if>>11번가</option>
				<option value="tvon"<c:if test="${sdto.cast_platform == 'tvon'}">selected</c:if>>티비온</option>
			</select>
			<div class="upload_product">
				<span>*최대 3개까지의 상품만 등록할 수 있습니다.</span>
				<ul class="input_2">
					<li>
						<span><span>상품1:</span> <input type="text" class="fome-control_cp" name="product1" id="product1" value="${pdto[0].product_name}"></span>
						<span><span>가격:</span><input type="text" class="fome-control_cp" name="price1" id="price1" value="${pdto[0].price}"></span> 
						<span><span>할인률:</span><input type="text" class="fome-control_cp" name="discount1" id="discount1" value="${pdto[0].discount}"></span>
					</li>
					<li>
						<span><span>상품2:</span><input type="text" class="fome-control_cp" name="product2" id="product2" value="${pdto[1].product_name}"></span>
						<span><span>가격:</span><input type="text" class="fome-control_cp" name="price2" id="price2" value="${pdto[1].price}"></span> 
						<span><span>할인률:</span><input type="text" class="fome-control_cp" name="discount2" id="discount2" value="${pdto[1].discount}"></span>
					</li>
					<li>
						<span><span>상품3:</span><input type="text" class="fome-control_cp" name="product3" id="product3" value="${pdto[2].product_name}"></span>
						<span><span>가격:</span><input type="text" class="fome-control_cp" name="price3" id="price3" value="${pdto[2].price }"></span> 
						<span><span>할인률:</span><input type="text" class="fome-control_cp" name="discount3" id="discount3" value="${pdto[2].discount}"></span>
					</li>
				</ul>
			</div> 		
			<input type="text" class="fome-control_cp" id="cast_date" name="cast_date" placeholder="yyyy-MM-dd" value="${sdto.cast_date}">년월일<br>
			<input type="text" class="fome-control_cp" id="cast_time" name="cast_time" placeholder="hh:00" value="${sdto.cast_time}">시간<br>
			<input type="hidden" id="cast_id" name="cast_id" value="${sdto.cast_id}">
			<input type="hidden" id="product_id1" name="product_id1" value="${pdto[0].product_id}"/>
			<input type="hidden" id="product_id2" name="product_id2" value="${pdto[1].product_id}"/>
			<input type="hidden" id="product_id3" name="product_id3" value="${pdto[2].product_id}"/>
			<div class="button">
				<input type="button" class="btn btn-primary" value="수정" id="btn_update">
				<input type="reset"	value="취소" class="btn btn-primary">
			</div>
		</form>
	</main>
</body>
</html>