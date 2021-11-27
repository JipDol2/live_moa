<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="resources/bootstrap/bootstrap-4.5.3-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/main.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<script>
$(function (){
	var idx=false;
	var pdx=false;
	$('#btn_signup').on('click',function(){
	    if($("#mem_id").val()==""){
	        alert("아이디를 입력해주세요");
	        $("#mem_id").focus();
	        return;
	    }
	    if($("#mem_pwd").val()==""){
	        alert("비밀번호를 입력해주세요");
	        $("#mem_pwd").focus();
	        return;
	    }
	    if($("#mem_name").val()==""){
	        alert("이름을 입력해주세요");
	        $("#mem_name").focus();
	        return;
	    }
	    if($("#mem_email").val()==""){
	        alert("이메일을 입력해주세요");
	        $("#mem_email").focus();
	        return;
	    }
	    if($("#mem_phone").val()==""){
	        alert("전화번호를 입력해주세요");
	        $("#mem_phone").focus();
	        return;
	    }if(idx==false){
			alert("아이디 중복체크를 해주세요");
			return;
		}
	    if(pdx==false){
	    	alert("비밀번호를 다시 확인해 주세요");
	    	return;
	    }	    
	    $("#signupform").submit();
	});
	$('#check').on('click',function(){
		var mem_id=$('#mem_id').val();
		$.ajax({
			url:"/idCheck",
			type: 'POST',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			data: mem_id,
			success: function(data){
				//console.log(data);
				if(data > 0 ){
					idx=false;
					$('#id_check').text('중복된 아이디입니다');
					$('#id_check').css('color','red');
				}else{
					idx=true;
					$('#id_check').text('사용가능한 아이디입니다');
					$('#id_check').css('color','blue');
				}
			}
		});// ajax
	});//check
	//비밀번호 확인 체크
	$('#mem_pwd2').blur(function(){
		if($('#mem_pwd').val()==$(this).val()){
			pdx=true;
			console.log(pdx);
			$('#pwd_check').text('비밀번호가 일치합니다');
			$('#pwd_check').css('color','blue');			
		}else{
			pdx=false;
			console.log(pdx);
			$('#pwd_check').text('비밀번호가 일치하지 않습니다.');
			$('#pwd_check').css('color','red');
		}
	});
})
</script>
</head>
<body>
<main class="wrap">
	<form action="signup" method="post" name="signupform" id="signupform">	
        <nav class="navbar">
	            <h3 class="small_title">회원가입</h3>
	    </nav> 		
        <div class="form-group">
            <label for="exampleInputEmail">아이디</label>
            <input type="text" class="form-control" name="mem_id"id="mem_id" style="margin-bottom:5px">
            <div id="id_check"></div>
            <input type="button" class="btn btn-outline-secondary btn-sm" id="check" value="중복체크">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail">비밀번호</label>
            <input type="password" class="form-control" name="mem_pwd" id="mem_pwd">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail">비밀번호 확인</label>
            <div id="pwd_check"></div>
            <input type="password" class="form-control" name="mem_pwd2" id="mem_pwd2">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail">이름</label>
            <input type="text" class="form-control" name="mem_name"id="mem_name">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail">이메일</label>
            <input type="text" class="form-control" name="mem_email"id="mem_email">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail">전화번호</label>
            <input type="text" class="form-control" name="mem_phone"id="mem_phone">
        </div>
        <div class="click_but">
            <input type="button" class="btn btn-primary" value="등록" id="btn_signup">
            <input type="reset" class="btn btn-primary" value="취소">
        </div>
    </form>		
</main>
</body>
</html>