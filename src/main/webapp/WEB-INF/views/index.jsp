<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIVEMOA</title>
<link href="resources/bootstrap/bootstrap-4.5.3-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
</head>
<body>
<main class="mainpage">
    <h1><a href="/" class="title">LIVE MOA</a></h1>
    <div class="login_out">
	    <div class="list-group">
			<a href="product_registration" class="list-group-item list-group-item-action">쇼핑방송 등록</a>
		    <a href="shopping/list" class="list-group-item list-group-item-action">쇼핑방송 리스트</a>
		    <a href="interest/login_check" class="list-group-item list-group-item-action">관심쇼핑 모아보기</a>
		</div>  
		<div class="write_log">
			<c:if test="${mem_id == null}">
        	<a href="loginform" class="btn btn-secondary btn-sm">로그인</a>
        	<a href="signupform" class="btn btn-secondary btn-sm">회원가입</a>
		    </c:if>
		    
		    <c:if test="${mem_id != null}">
		        <span>${mem_id}님</span>
		        <input type="button" class="btn btn-secondary btn-sm" value="로그아웃" onclick="location.href='/signout'">
		    </c:if>
		    
		    <c:if test="${msg == false}">
		        <p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해봐</p>
		    </c:if>
		</div>    	
    </div>	  
</main>
</body>
</html>