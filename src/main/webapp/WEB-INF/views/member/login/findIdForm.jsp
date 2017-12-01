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
		<h1> TEA::TIME 아이디 찾기</h1>
	</div>
	<hr>
  <div class="row" align="center">
 	 <h5> 회원가입시 입력 했던 이메일로 아이디를 전송합니다.</h5>
  </div>
  <hr>

		<div class="form-group" align="center">
			
	    	<input type="email" style="width: 70%;" class="form-control" name="userEmail" id="userEmail" placeholder="ex) teatime@teatime.com">
			<br>
	  	 	<input class="btn btn-default" type="button" value="인증 메일 발송" onclick="sendFindIdEmail()"/>
		</div>
  <br>
	<div class="form-group" align="center">
		<input class="btn btn-default" type="button" value="닫기" onclick="javascript:window.close()"/>
	</div>
</div>

<script type="text/javascript">
	  	
	function sendFindIdEmail() {
		var inputed = $('#userEmail').val();
			$.ajax({
				type:"post",
				url : "${pageContext.request.contextPath}/member.findId",
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
	
	function resizeWindow(win)    {

		var wid = win.document.body.offsetWidth + 30;

		var hei = win.document.body.offsetHeight + 66;

		win.resizeTo(wid,hei);

		}
	
</script>

</body>
</html>