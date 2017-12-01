<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>TEA :: TIME</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/btstrap/js/bootstrap.min.js"></script>

</head>
<body onload='resizeWindow(this)'>

	<div class="container-fluid">
	<hr>
	<div class="row" align="center">
		<h1> TEA::TIME 이메일 인증 페이지</h1>
	</div>
	<hr>
	<br>
	<div class="container" align="center">
		<form class="form-inline" id="emailForm">
			<fieldset>
				<div class="form-group">
			    	<input type="text" class="form-control" name="userEmail" id="email" placeholder="Email"/>
			    	<input class="btn btn-default" type="button" value="인증 메일 발송" onclick="sendAuthEmail()"/>
				</div>
			</fieldset>
		</form>
		<br>
		<form class="form-inline">
			<fieldset>
				<div class="form-group">
			    	<input type="text" class="form-control" name="authText" id="authText" placeholder="인증번호"/>
			  	 	<input class="btn btn-default" type="button" value="인증" onclick="checkAuthText()" />
				</div>
			</fieldset>
		</form>
		<br>
	</div>
	
	<div class="form-group" align="center">
		<input class="btn btn-default" type="button" value="닫기" onclick="javascript:window.close()"/>
	</div>
		
</div>


<script type="text/javascript">

	document.getElementById("email").value = opener.document.getElementById("email").value;
	  	
	
	/* 발송실패에 대해서 리턴값 다시생각해봐야됨 */
	function sendAuthEmail() {
		var inputed = $('#email').val();
			$.ajax({
				url : "${pageContext.request.contextPath}/member.sendAuthEmail",
				type:"post",
				data : { userEmail : inputed },
				success : function(data) {
					if (data) {
						alert("인증 메일 발송 성공")
					} else if (!data) {
						alert("인증 메일 발송 실패")
					} 
				}
			});
		}
	
	function checkAuthText(){
		var authText = $('#authText').val();
		var email = $('#email').val();
			$.ajax({
				url : "${pageContext.request.contextPath}/member.checkAuthText",
				type:"post",
				data : { auth : authText, userEmail : email },
				success : function(data) {
					if (data) {
						alert("인증 성공")
						opener.document.getElementById("email").value = document.getElementById("email").value;
						close();
					} else if (!data) {
						alert("인증 실패")
					} 
				}
			});
		}
	
	function resizeWindow(win)    {

		var wid = win.document.body.offsetWidth + 80;
	
		var hei = win.document.body.offsetHeight + 90;
	
		win.resizeTo(wid,hei);
	
		}

</script>

</body>
</html>