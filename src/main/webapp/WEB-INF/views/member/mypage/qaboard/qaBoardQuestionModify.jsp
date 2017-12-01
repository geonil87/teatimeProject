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
		<h1> TEA::TIME 문의 게시판 - 문의 작성</h1>
	</div>
	<hr>
	<br>
	<div class="container">
		<form class="form-horizontal" id="modifyForm" action="${pageContext.request.contextPath}/qaBoard.questionModify" method="post">
			<fieldset>
				<div class="form-group">
					<label for="category">문의 카테고리 :</label>
			    	<select class="form-control" id="category" name="category">
						<option value="0" <c:out value="${question.category == '0'?'selected':''}"/> >문의 카테고리 선택</option>
						<option value="1" <c:out value="${question.category == '1'?'selected':''}"/> >계정 문의</option>
						<option value="2" <c:out value="${question.category == '2'?'selected':''}"/> >게시물 문의</option>
						<option value="10" <c:out value="${question.category == '10'?'selected':''}"/> >기타 문의</option>
					</select>
				</div>
				<div class="form-group">
					<label for="title">제목 :</label>
			    	<input type="text" class="form-control" name="title" id="title" value="${question.title}" placeholder="제목"/> 
				</div>
				<div class="form-group">
					<label for="summernote">내용 :</label>
					<textarea class="form-control" id="summernote" maxlength="1000" name="content">${question.content}</textarea>
				</div>
				<input type="hidden" id="idx" name="idx" value="${question.idx}" />
			</fieldset>
		</form>
		<br>
		
	</div>
	
	<div class="form-group" align="center">
		<input class="btn btn-default" type="button" value="질문 수정" onclick="questionModify()"/>
		<input class="btn btn-default" type="button" value="닫기" onclick="javascript:window.close()"/>
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
	function questionModify(){
		var category = $('#category').val();
		var title = $('#title').val();
		var content = $('#summernote').val();
		var idx = $('#idx').val();
		
		 $.ajax({
		    	url : "${pageContext.request.contextPath}/qaBoard.questionModify",
		    	type:"post",
		    	data : { 
		    		category : category, 
		    		title : title, 
		    		content : content,
		    		idx : idx
		    		},
		        success : function(data) {
		           	if (data == '0') {
		           		alert("수정 실패");
		            } else if (data == '1') {
		            	alert("수정 성공");
		           		opener.parent.location.reload();
		           		window.close();
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