<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>TEA :: TIME</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">

<style type="text/css">
  .btn-default{
     text-shadow: 0 1px 0 #fff;
    background-image: linear-gradient(to bottom,#fff 0,#e0e0e0 100%);
	background-repeat: repeat-x;
    border-color: #ccc;
	box-shadow: inset 0 1px 0 rgba(255,255,255,.15), 0 1px 1px rgba(0,0,0,.075);
	color: #333;
	background-color: #fff;
  }
</style>
</head>
<body onload='resizeWindow(this)'>
	<div class="container-fluid">
	<hr>
	<div class="row" align="center">
		<h1> 게시물 원본</h1>
	</div>
	<hr>
	<br>
		<div class="container" >
			<div class="term">
				<div class="row" align="center">
					
				</div>
				<table class="table table-bordered" style="border: 1px solid black;">
					<tbody class="termTable" style="text-align: center; vertical-align: middle;">
						<tr>
							<th style="text-align: center; vertical-align: middle;" width="100px">제목</th>
							<td>${reportTarget.title}</td>
						</tr>
						<tr>
							<th style="text-align:center; vertical-align: middle;" height="300px" width="100px">내용</th>
							<td style="text-align: left;" height="300px">${reportTarget.content}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<c:if test="${answer != null}">
			
		<div class="container">
		<h1 class="widget-title" style="font-size: 25px;text-align: center;">문의 결과</h1>
								<hr style="border: 0; height: 1px; background: #ccc;">
			<div class="term">
				<div class="row" align="center">
					
				</div>
				<table class="table table-bordered" style="border: 1px solid #ccc;">
					<tbody class="termTable" style="text-align: center; vertical-align: middle; border: 1px solid #ccc;">
						<tr>
							<th style="text-align: center; vertical-align: middle; border: 1px solid #ccc;" width="100px">답변 내용</th>
						</tr>
						<tr>
							<td style="text-align: left; border: 1px solid #ccc;" height="100px" >${answer.content }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		</c:if>
		<hr>	
	
	<div class="form-group" align="center">
		<c:choose>
			<c:when test="${question.condition == 1 && sessionScope.sessionPermission == 1}">
				<input class="btn btn-default" type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/qaBoard.questionModify?idx=${question.idx}&condition=${question.condition}'"/>
				<input class="btn btn-default" type="button" value="삭제" onclick="questionDelete()"/>
			</c:when>
		</c:choose>
		<input class="btn btn-default" type="button" value="닫기" onclick="javascript:window.close()"/>
	</div>
</div>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript">
	function resizeWindow(win){
		var wid = win.document.body.offsetWidth + 30;
		var hei = win.document.body.offsetHeight + 66;
		win.resizeTo(wid,hei);
		}
	
	function questionDelete(){
		var idx = "<c:out value='${param.idx}'/>";
		
		$.ajax({
		    	url : "${pageContext.request.contextPath}/qaBoard.questionDelete",
		    	type:"post",
		    	data : {idx : idx},
		        success : function(data) {
		           	if (data == '0') {
		           		alert("삭제 실패");
		            } else if (data == '1') {
		            	alert("삭제 성공");
		           		opener.parent.location.reload();
		           		window.close();
		            } 
		        }
		    });
	}
</script>

</body>
</html>