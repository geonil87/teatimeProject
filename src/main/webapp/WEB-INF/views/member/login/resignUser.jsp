<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title> TEA :: TIME</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/btstrap/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="container-fluid">
	<hr>
	<div class="row" align="center">
		<h1> TEA::TIME 회원 탈퇴 페이지</h1>
	</div>
	<hr>
	<div class="row" align="center">
		<h4><b style="color: red">*주의*</b></h4>
		<h5> 회원 탈퇴를 하시면 계정 복구가 <b style="color: red">불가능</b> 합니다.</h5>
		<h5> 회원 탈퇴를 원하시면 비밀번호를 입력해주세요.</h5>
	</div>
	<hr>
	<br>
	<div class="container">
	<form action="${pageContext.request.contextPath}/member.deleteUser" method="post" id="pwForm">
		<div class="center-block">
			<div class="form-group" style="width: 70%; margin-left: auto; margin-right: auto;">
				<label for="pw1">비밀번호 입력</label>
		    	<input type="password" style="margin-right: auto;" class="form-control" id="pw1" name="userPw" placeholder="비밀번호"/><br>
				<input type="password" style="margin-right: auto;" class="form-control" id="userPwConfirm" name="userPwConfirm"  placeholder="비밀번호 확인"/>
				<input type="hidden" name="userId" value="${param.userId}"/>
			</div>
			<div class="form-group" align="center">
		  	 	<input class="btn btn-default"  type="submit" value="회원 탈퇴"/>
			</div>
		</div>
	</form>
	</div>
	<div class="form-group" align="center">
		<input class="btn btn-default" type="button" value="메인으로 돌아가기" onclick="document.location.replace('${pageContext.request.contextPath}/main')"/>
	</div>
		
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/etc/jquery.validate.min.js"></script>
<script>
	
	$.validator.addMethod("regx", function(value, element, regexpr) {
		
		return regexpr.test(value);
		
	});
	
	$.validator.setDefaults({
		onkeyup: false
		, onclick: false
		, onfocusout: false
		, showErrors: function(errorMap, errorList) {
			if(errorList.length < 1)
				return;
					
			alert(errorList[0].message);
		}
	});	

	$(function(){
	    $("#pwForm").validate({
	    	
	    	rules: {
				userPw: {required: true, minlength: 8, maxlength: 16 , regx : /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/	},
				userPwConfirm: {required: true, equalTo:'#pw1'},
			},
			
			messages : {
    			userPw : {
    				required : '비밀번호를 입력해주세요.'
    				, minlength : $.validator.format('비밀번호는 {0}자 이상이어야 합니다.')
    				, maxlength : $.validator.format('비밀번호는 {0}자 이이어야 합니다.')
    				, regx : $.validator.format('비밀번호는 소문자,대문자,숫자,특수문자(!,@,#,$,%,^,&,+,=) 조합으로 8~16글자로 이루어져야 합니다.')
    			},
    			userPwConfirm : {
    				required : '비밀번호 확인을 입력해주세요.'
    				,  equalTo: "비밀번호가 일치하지 않습니다. 다시 확인해주세요." 
    			}
			}	
	    	
	    	
	    });
	})

</script>

</body>
</html>