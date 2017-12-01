<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="../storyboard/header.jsp" %>
<!DOCTYPE html>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>

</head>
<body>
	<div class="container">
	<div class="main-container">
			<div class="container-fluid no-left-padding no-right-padding page-content">
				<!-- container -->	
				<div class="container">
					<!-- Row -->
					<div class="row">
						<!-- Content Area -->
						<div class="col-sm-12 content-area">
							<div class="aboute-block" align="center">
								<hr>
								<div class="block-title" >
									<h3>${detail.title}</h3>
								</div>
								<p style="text-align: right;margin-top: -30px" > 조회수 ${detail.hit}</p>
								<hr>
								<p>${detail.content}</p>
								<ul>
									
								</ul>
							</div>
						</div><!-- Content Area /- -->
					</div><!-- Row /- -->
				</div><!-- container /- -->
			</div><!-- Aboute-me Section /- -->
			

<hr>
							
<!-- About Author -->
<div class="about-author-box">
<h4><i class="fa fa-user-o" aria-hidden="true"></i> by 작성자 ${detail.user_nick}</h4>
<div class="post-meta">
<span class="byline"><a title="Indesign">작성시간</a></span>
<span class="post-date">${detail.wdate }</span>
</div>
<hr>




<button type="button"  class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/noticesBoard.list'" value="목록">목록</button>
<c:choose>
<c:when test="${sessionScope.sessionPermission == 0}">
<button type="button" id="modify" class="btn btn-default"  value="수정">수정</button>
<button type="button" id="delete" class="btn btn-default" value="삭제">삭제</button>
</c:when>
</c:choose>

						
							
							
						
						</div><!-- Content Area /- -->
					</div>
				</div><!-- Container /- -->


<script type="text/javascript">
$(document).ready(function(){
	var idx = ${detail.idx};
		
	$('#modify').on('click',function(){
		var id = "${sessionId}";
		var permission = "${sessionPermission}";
		var locationPath="${pageContext.request.contextPath}/noticesBoard.modify?idx=${param.idx}";
		if(id==""){		
			alert("로그인을 해주세요");			
		}else if(permission=="0"){		
			location.href=locationPath;
		}else{
			alert("권한이 없습니다.");
		} 
	});
	
	$('#delete').on('click',function(){
		var id = "${sessionId}";
		var locationPath = "${pageContext.request.contextPath}/noticesBoard.delete?idx=${param.idx}";
		var permission = "${sessionPermission}";
		if(id==""){		
			alert("로그인을 해주세요");			
		}else if(permission=="0"){		
			location.href=locationPath;
		}else{
			alert("권한이 없습니다.");
		} 
	});
	
});





</script>

	
	
<%@ include file="../storyboard/bottom.jsp" %>

</body>
</html>