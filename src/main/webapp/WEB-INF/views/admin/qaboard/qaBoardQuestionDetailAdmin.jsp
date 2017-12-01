<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/adminHeader.jsp" %>

				
			<!-- start: Content -->
			<div id="content" class="span10">
			
						
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="index.html">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li>
					<a href="#">문의 게시판</a>
					<i class="icon-angle-right"></i>
				</li>
				<li>
					<a href="#">답변</a>
				</li>
			</ul>
			
			<c:if test="${question != null }">
				<div class="row-fluid">
				<div class="box span12">
					<div class="box-header">
						<h2><i class="halflings-icon white question-sign"></i><span class="break"></span>Question</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
							<h3><small>제목</small></h3>
						  <div class="page-header">
						  		<h1>${question.title }</h1>
						  </div>     
						  <h3><small>내용</small></h3>
						 	<div class="row-fluid">            
							   	<div class="tooltip-demo well">
								  <p class="muted" style="margin-bottom: 0;">
								  ${question.content }
								  </p>
								</div>
								<c:choose>
									<c:when test="${question.condition == 1 && sessionScope.sessionPermission == 1 && question.condition != 3}">
										<div>
											<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qaBoard.listAdminOption'">목록</button>
											<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/qaBoard.questionModify?idx=${question.idx}&condition=${question.condition}'">질문 수정</button>
											<a class="btn btn-danger" href="${pageContext.request.contextPath}/qaBoard.questionDelete?idx=${question.idx}&condition=${question.condition}">
												<i class="halflings-icon white trash"></i> 
											</a>
										</div>
									</c:when>
									<c:when test="${sessionScope.sessionPermission == 0 && answer == null && question.condition != 3}">
										<div>
											<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qaBoard.listAdminOption'">목록</button>
											<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/qaBoard.answer?groupIdx=${question.qaGroup}'">답변 달기</button>
											<a class="btn btn-danger" href="${pageContext.request.contextPath}/qaBoard.questionDelete?idx=${question.idx}&condition=${question.condition}">
												<i class="halflings-icon white trash"></i> 
											</a>
										</div>
									</c:when>
									<c:when test="${sessionScope.sessionPermission == 0 && answer != null && question.condition != 3}">
										<div>
											<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qaBoard.listAdminOption'">목록</button>
											<a class="btn btn-danger" href="${pageContext.request.contextPath}/qaBoard.questionDelete?idx=${question.idx}&condition=${question.condition}">
												<i class="halflings-icon white trash"></i> 
											</a>
										</div>
									</c:when>
									<c:when test="${sessionScope.sessionPermission == 0 && question.condition == 3}">
										<div>
											<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qaBoard.listAdminOption'">목록</button>
										</div>
									</c:when>
									
								</c:choose>
							  
							</div>
							  
						  </div><!--/row -->                           

					  </div>
				</div><!--/span-->
			</c:if>
			

			<c:if test="${answer != null}">
			<div class="row-fluid">
				<div class="box span12">
					<div class="box-header">
						<h2><i class="halflings-icon white font"></i><span class="break"></span>Answer</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
							<h3><small>제목</small></h3>
						  <div class="page-header">
							  <h1>${answer.title }</h1>
						  </div>     
							  <h3><small>내용</small></h3>
						 	<div class="row-fluid">            
							  	<div class="tooltip-demo well">
								  <p class="muted" style="margin-bottom: 0;">
								  ${answer.content }
								  </p>
								</div>
								
								<c:choose>
									<c:when test="${answer != null && sessionScope.sessionPermission == 0}">
										<div>
											<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qaBoard.listAdminOption'">목록</button>
											<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/qaBoard.answerModify?idx=${answer.qaGroup}'">답변 수정</button>
											<a class="btn btn-danger" href="${pageContext.request.contextPath}/qaBoard.answerDelete?groupIdx=${answer.qaGroup}">
												<i class="halflings-icon white trash"></i> 
											</a>
										</div>
										
									</c:when>
									<c:when test="${answer == null && sessionScope.sessionPermission == 0 }">
										<div>
											<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qaBoard.listAdminOption'">목록</button>
											<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/qaBoard.answer?idx=${question.idx}'">답변 작성</button>
										</div>
									</c:when>
								</c:choose>  
							  
							</div>
							  
						  </div><!--/row -->                           

					  </div>
				</div><!--/span-->
			</c:if>
			
								
							
			
			</div><!--/row-->
    

	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		

			
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
			

	<script type="text/javascript">
	
	var range;
	var category;
	var pageNum;
	var condition;
	var searchOption;
	var keyword;
	var permission;
	
	function changeRange(){
		pageNum = ${paging.pageNum};
		permission = $("#permissionStatus").val();
		searchOption = $("#searchOption").val();
		keyword = $("#keyword").val();
		range = $("#contentRange").val();
		category = $("#categorySort").val();
		condition = $("#conditionStatus").val();
		location.href='${pageContext.request.contextPath}/qaBoard.listAdminOption?pageNum='+pageNum+'&range='+range+'&category='+category+'&condition='+condition+'&searchOption='+searchOption+'&keyword='+keyword+'&permission='+permission;
	}
	function changeSort(){
		permission = $("#permissionStatus").val();
		searchOption = $("#searchOption").val();
		keyword = $("#keyword").val();
		range = $("#contentRange").val();
		category = $("#categorySort").val();
		condition = $("#conditionStatus").val();
		location.href='${pageContext.request.contextPath}/qaBoard.listAdminOption?pageNum=1&range='+range+'&category='+category+'&condition='+condition+'&searchOption='+searchOption+'&keyword='+keyword+'&permission='+permission;
	}
	function changeCondition(){
		permission = $("#permissionStatus").val();
		searchOption = $("#searchOption").val();
		keyword = $("#keyword").val();
		range = $("#contentRange").val();
		category = $("#categorySort").val();
		condition = $("#conditionStatus").val();
		location.href='${pageContext.request.contextPath}/qaBoard.listAdminOption?pageNum=1&range='+range+'&category='+category+'&condition='+condition+'&searchOption='+searchOption+'&keyword='+keyword+'&permission='+permission;
	}
	function changePermission(){
		permission = $("#permissionStatus").val();
		searchOption = $("#searchOption").val();
		keyword = $("#keyword").val();
		range = $("#contentRange").val();
		category = $("#categorySort").val();
		condition = $("#conditionStatus").val();
		location.href='${pageContext.request.contextPath}/qaBoard.listAdminOption?pageNum=1&range='+range+'&category='+category+'&condition='+condition+'&searchOption='+searchOption+'&keyword='+keyword+'&permission='+permission;
	}
	
</script>
<%@ include file="../include/adminBottom.jsp" %>
</body>
</html>
