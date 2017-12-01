<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="../storyboard/header.jsp" %>
     
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title><meta http-equiv="content-type" content="text/html;charset=UTF-8" />
</head>
<script src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>

<body>


	<div class="container">
	<div class="main-container">
			<div class="container-fluid no-left-padding no-right-padding page-content">
				<!-- container -->	
				<div class="container">
					<!-- Row -->
					<div class="row">
						<!-- Content Area -->
						<div class="col-sm-12 content-area" align="center">
							<div class="aboute-block">
							
								<h1 class="widget-title" style="font-size: 25px">신고하기</h1>
								<hr style="border: 0; height: 1px; background: #ccc;">

<form id="reportForm" method="post" action="${pageContext.request.contextPath}/photoBoard.commentReport" enctype="multipart/form-data">
<div id="editor_fram"></div>
	<input type="hidden" id="idx" name="idx" value="${param.comment_idx }" />
	<input type="hidden" id="board_idx" name="board_idx" value="${param.board_idx }" />
<table class="table table-striped"  style="border:1px solid #dddddd">
<thead>
<tr>
</tr>
</thead>
<tbody>

<tr><td style="text-align: center;">댓글 신고 [ ${param.content } ]</td></tr>
<tr><td><textarea id="content" class="form-control"  placeholder="신고사유" name="content" maxlength="500" style="height: 350px;"></textarea></td></tr>



</tbody>

</table>
<div align="right">

<input type="button" id="report" class="btn btn-default" value="확인"/> 
<input type="button"  class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/photoBoard.detail?idx=${param.board_idx }'" value="취소">
</div>
</form>


</div>
</div>
</div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('#report').on("click",function(e){		
		var content = $('#content').val();
		var id = "${sessionId}";
		if(id==""){
			alert("로그인을 해주세요.")
		}else{
			if(content==''){
				alert("내용을 입력하세요.");
			}else{
				var idx = $('#idx').val();
				checkReport(idx);
			}			
		}
	}); 
	
	
	
	
});

function checkReport(idx){
	$.ajax({
		type:"post",
		data:{"idx":idx},
		url:"${pageContext.request.contextPath}/photoBoard.checkCommentReport",
		success:function(result){
			if(result==0){
				alert("신고하였습니다.");
				$('#reportForm').submit();
			}else{
				alert("이미 신고한 댓글입니다.");
				
			}
		}
	});
}

</script>



<%@ include file="../storyboard/bottom.jsp" %>



</body>

</html>