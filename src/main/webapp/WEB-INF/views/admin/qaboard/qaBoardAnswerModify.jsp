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
							</div>
						  </div><!--/row -->                           
					  </div>
				</div><!--/span-->
			
			
				<div class="row-fluid">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white edit"></i><span class="break"></span>답변</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
						<form class="form-horizontal" action="${pageContext.request.contextPath}/qaBoard.answerModify" method="post">
							<fieldset>
								<div class="control-group">
									<label class="control-label" for="category">문의 카테고리</label>
									<div class="controls">
										<select id="category" name="category">
											<option value="0">문의 카테고리 선택</option>
											<option value="1" <c:out value="${question.category == '1'?'selected':''}"/> >계정 문의</option>
											<option value="2" <c:out value="${question.category == '2'?'selected':''}"/> >게시물 문의</option>
											<option value="10"<c:out value="${question.category == '10'?'selected':''}"/>  >기타 문의</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">작성자</label>
									<div class="controls">
										<span class="input-xlarge uneditable-input">${answer.userNick}</span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">내용</label>
									<div class="controls">
										<span class="input uneditable-input" style="width: 800px;">${answer.title}</span>
									</div>
								</div>
								<div class="control-group hidden-phone">
									<label class="control-label" for="content">내용</label>
							  			<div class="controls">
											<textarea class="cleditor" id="content" name="content">${answer.content}</textarea>
										</div>
							  	</div>
									<input type="hidden" name="idx" value="${answer.idx}" /> 
									<input type="hidden" name="title" value="${answer.title}" /> 
									<input type="hidden" name="qaGroup" value="${answer.qaGroup}" /> 
							  <div class="form-actions">
								<button type="submit" class="btn btn-primary">답변 수정</button>
								<button type="button" class="btn" onclick="javaScript:history.back()">취소</button>
							  </div>
							</fieldset>
						  </form>
					
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
								
							
			
			</div><!--/row-->
    

		</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		

			
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->

		

<%@ include file="../include/adminBottom.jsp" %>
</body>
</html>
