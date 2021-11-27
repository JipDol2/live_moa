<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="resources/js/main.js"></script>
<link href="<%=request.getContextPath()%>/resources/bootstrap/bootstrap-4.5.3-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<main class="wrap">
		<form action="signin" method="post" name="loginform" id="loginform">	
	        <nav class="navbar">
	            <h3 class="small_title">로그인</h3>
	        </nav> 		
	        <div class="form-group">
	            <label for="exampleInputEmail">아이디</label>
	            <input type="text" class="form-control" name="mem_id"id="mem_id">
	        </div>
	        <div class="form-group">
	            <label for="exampleInputEmail">비밀번호</label>
	            <input type="password" class="form-control" name="mem_pwd" id="mem_pwd">
	        </div>
	        <input type="button" class="btn btn-primary" value="로그인" id="btn_signin">
	        <a href="signupform" class="btn btn-primary">회원가입</a>
	    </form>		
	</main>
</body>
</html>