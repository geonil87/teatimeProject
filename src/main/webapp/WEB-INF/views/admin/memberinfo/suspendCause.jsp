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


</head>
<body onload='resizeWindow(this)'>
	<div class="container-fluid">
	<hr>
	<div class="row" align="center">
		<h1> 정지 사유 입력</h1>
	</div>
	<hr>
	<br>
	<div class="container">
		<form class="form" id="suspendCauseForm" action="${pageContext.request.contextPath}/management.suspendCause" method="post">
			<fieldset>
				
				<div class="form-group">
					<label for="summernote"></label>
					<textarea class="form-control" id="summernote" maxlength="1000" name="content" ></textarea>
				</div>
				
			</fieldset>
		</form>
		<br>
		
	</div>
	
	<div class="form-group" align="center">
		<input class="btn btn-primary" type="button" value="저장" onclick="suspendCauseSubmit()"/>
		<input class="btn btn-danger" type="button" value="취소" onclick="javascript:window.close()"/>
	</div>
		
</div>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// onImageUpload callback
	$('#summernote').summernote({
		height: 350,
		lang : 'ko-KR',
	 	callbacks:{
			onImageUpload : function(files, editor, welEditable) {
	    	sendFile(files[0], editor, welEditable);
	   	 }
	 	}
	});

	function sendFile(file, editor, welEditable) {
	    data = new FormData();
	    data.append("uploadFile", file);
	    $.ajax({
	        data : data,
	        type : "POST",
	        url : "${pageContext.request.contextPath}/qaBoard.imageUpload",
	        cache : false,
	        contentType : false,
	        processData : false,
	        success : function(url) {
	        	$('#summernote').summernote('insertImage', url);
	        }
	    });
	}
	
});
	function suspendCauseSubmit(){
		var suspendCause = $('#summernote').val();
		var userId ="<c:out value='${param.userId}'/>";
		var memberStatus="<c:out value='${param.memberStatus}'/>";
		
		
		 $.ajax({
		    	url : "${pageContext.request.contextPath}/management.suspendCause",
		    	type:"post",
		    	data : { 
		    		suspendCause : suspendCause,
		    		userId : userId,
		    		memberStatus : memberStatus
		    		},
		        success : function(data) {
		           	if (data) {
		           		alert("상태 변경 완료");
		           		opener.parent.location.reload();
		           		window.close();
		            } else {
		           		alert("상태 변경 실패");
		            } 
		        }
		    });
			
	}
	
	
	function resizeWindow(win){
		var wid = win.document.body.offsetWidth + 40;
		var hei = win.document.body.offsetHeight + 480;
		win.resizeTo(wid,hei);
	}
	
</script>

</body>
</html>