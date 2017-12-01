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
<body onload='resizeWindow(this)'>

	<div class="container-fluid">
		<hr>
		<div class="row" align="center">
			<h1> TEA::TIME 비밀번호 찾기</h1>
		</div>
		<hr>
	  <div class="row" align="center">
	 	 <h5> 아이디와 이메일을 입력해주세요.</h5>
	  </div>
	  <hr>
	  
			<div class="form-group" align="center">
			
		
				<input type="text" style="width: 70%;" class="form-control" name="userId" id="userId" placeholder="아이디" /> <br>
				<input type="text" style="width: 70%;" class="form-control" name="userEmail" id="userEmail" placeholder="ex) teatime@teatime.com"/>
				<br>
		  	 	<input class="btn btn-default" type="button" value="인증 메일 발송" onclick="sendFindPwEmail()"/>
			</div>
			<hr>
			<div class="form-group" align="center">
				<input type="text" style="width: 40%;" class="form-control"  name="authText" id="authText" placeholder="인증번호" />
				<br>
				<input class="btn btn-default" type="button" value="인증" onclick="checkFindPwAuthText()"/>  <input class="btn btn-default" type="button" value="닫기" onclick="javascript:window.close()"/>
			</div>
	
	</div>

<script type="text/javascript">
	  	
	function sendFindPwEmail() {
		var inputEmail = $('#userEmail').val();
		var inputId = $('#userId').val(); 
			$.ajax({
				url : "${pageContext.request.contextPath}/member.findPw",
				type:"post",
				data : { userEmail : inputEmail, userId : inputId},
				success : function(data) {
					if (data) {
						alert("인증 메일 발송 성공")
					} else if (!data) {
						alert("인증 메일 발송 실패")
					} 
				}
			});
		}
	
	function checkFindPwAuthText(){
		var userId = $('#userId').val();
		var authText = $('#authText').val();
			$.ajax({
				url : "${pageContext.request.contextPath}/member.checkFindPwAuthText",
				type:"post",
				data : { auth : authText },
				success : function(data) {
					if (data) {
						alert("인증 성공")
						location.href='${pageContext.request.contextPath}/member.changePw?userId='+userId;
					} else if (!data) {
						alert("인증 실패")
					} 
				}
			});
		}
	
	function resizeWindow(win)    {

		var wid = win.document.body.offsetWidth + 30;

		var hei = win.document.body.offsetHeight + 66;

		win.resizeTo(wid,hei);

		}
	
</script>
</body>
</html>