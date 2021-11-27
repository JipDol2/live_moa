$(function(){	
    $('#btn_signin').on('click',function(){
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
        $("#loginform").submit();
    });
    $('#btn_write').on('click',function(){
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
        $("#product_registration").submit();
    });
});