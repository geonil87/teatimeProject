<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/adminHeader.jsp" %>


					
			<!-- start: Content -->
			<div id="content" class="span10" >
			
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="index.html">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="#">문의 게시판(답변)</a></li>
			</ul>
			
				

			<div class="row-fluid">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white user"></i><span class="break"></span>문의게시판(관리자)</h2>
					</div>
					<div class="box-content">
				
						<div class="row-fluid">	
							<span style="display: table; margin-left: auto; margin-right: auto;">
								<select id="contentRange" onchange="changeRange()">
									<option value="1" <c:out value="${range == '1'?'selected':''}"/> >날짜순</option>
									<option value="2" <c:out value="${range == '2'?'selected':''}"/> >최신순</option>
								</select>
								
								<select id="categorySort" onchange="changeSort()">
									<option value="0" <c:out value="${category == '0'?'selected':''}"/> >카테고리 전체</option>
									<option value="1" <c:out value="${category == '1'?'selected':''}"/> >계정 문의</option>
									<option value="2" <c:out value="${category == '2'?'selected':''}"/> >게시물 문의</option>
									<option value="10" <c:out value="${category == '10'?'selected':''}"/> >기타 문의</option>
								</select>
								
								<select id="conditionStatus" onchange="changeCondition()">
									<option value="0" <c:out value="${condition == '0'?'selected':''}"/> >답변 전체</option>
									<option value="1" <c:out value="${condition == '1'?'selected':''}"/> >답변 대기</option>
									<option value="2" <c:out value="${condition == '2'?'selected':''}"/> >답변 완료</option>
									<option value="3" <c:out value="${condition == '3'?'selected':''}"/> >삭제</option>
								</select>
								
								<select id="permissionStatus" onchange="changePermission()">
									<option value="" <c:out value="${permission == ''?'selected':''}"/> >사용자 전체</option>
									<option value="0" <c:out value="${permission == '0'?'selected':''}"/> >관리자</option>
									<option value="1" <c:out value="${permission == '1'?'selected':''}"/> >유저</option>
								</select>
							</span>
						</div>
				
				
						<table class="table table-bordered table-striped table-condensed">
						  <thead>
							  <tr>
								  <th style="text-align: center;" width="40px">번호</th>
								  <th style="text-align: center;" width="100px">카테고리</th>
								  <th style="text-align: center;" width="400px">제목</th>
								  <th style="text-align: center;" width="100px">작성자</th>
								  <th style="text-align: center;" width="200px">작성시간</th>
								  <th style="text-align: center;" width="60px">답변상태</th>
							  </tr>
						  </thead>   
						  <tbody>
								<c:forEach items="${qaBoardList}" var="qaBoardList">
									<tr>
										<td style="text-align: center;" width="30px">${qaBoardList.viewIdx}</td>
										<td style="text-align: center;">
											<c:choose>
												<c:when test="${qaBoardList.category==1}">계정 문의</c:when>
												<c:when test="${qaBoardList.category==2}">게시물 문의</c:when>
												<c:when test="${qaBoardList.category==10}">기타 문의</c:when>
											</c:choose>
										</td>
										<td style="text-align: center;">
											<a href='${pageContext.request.contextPath}/qaBoard.adminDetail?idx=${qaBoardList.idx}&permission=${qaBoardList.permission}'>${qaBoardList.title}</a>
										</td>
										<td style="text-align: center;">${qaBoardList.userNick}</td>
										<td	style="text-align: center;">${qaBoardList.wdate}</td>
										<td style="text-align: center;">
											<c:choose>
												<c:when test="${qaBoardList.condition==1}"><span class="label label-warning">답변 대기</span></c:when>
												<c:when test="${qaBoardList.condition==2}"><span class="label label-success">답변 완료</span></c:when>
												<c:when test="${qaBoardList.condition==3}"><span class="label label-important">삭제</span></c:when>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
						  </tbody>
					  </table> 
					  
					  <div class="pagination pagination-centered">
						 	<!-- 닉네임 검색 -->
						 	<div class="input-append">
								<select id="searchOption" name="searchOption" form="search" style="width: 100px;">
									<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
									<%-- <option value="" <c:out value="${searchOption == ''?'selected':''}"/> >전체</option>
									<option value="userId" <c:out value="${searchOption == 'userId'?'selected':''}"/> >아이디</option> --%>
									<option value="userNick" <c:out value="${searchOption == 'userNick'?'selected':''}"/> >닉네임</option>
									<%-- <option value="userName" <c:out value="${searchOption == 'userName'?'selected':''}"/> >이름</option> --%>
								</select>
							 	<div class="input-append">
									<form action="${pageContext.request.contextPath}/qaBoard.listAdminOption" method="get" id="search">
											<input type="hidden" id="pageNum" name="pageNum" value="${paging.pageNum}">
											<input type="text" id="keyword" name="keyword" value="${keyword}">
											<input class="btn btn-small btn-primary" type="submit" value="검색">
									</form>
							 	</div>
						 	</div>
						 </div>
						 <div class="pagination pagination-centered">
						  <ul>
						  	<li><a href='${pageContext.request.contextPath}/qaBoard.listAdminOption?pageNum=1&searchOption=${searchOption}&keyword=${keyword}&category=${category}&range=${range}&condition=${condition}&permission=${permission}'>맨앞</a></li>
							<li><a href='${pageContext.request.contextPath}/qaBoard.listAdminOption?pageNum=${paging.startPage-5}&searchOption=${searchOption}&keyword=${keyword}&category=${category}&range=${range}&condition=${condition}&permission=${permission}'>이전</a></li>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" varStatus="i">
								<c:choose>
									<c:when test="${paging.pageNum == i.index && i.index != 0}">
										<li class="active"><a href='${pageContext.request.contextPath}/qaBoard.listAdminOption?pageNum=${i.index}&searchOption=${searchOption}&keyword=${keyword}&category=${category}&range=${range}&condition=${condition}&permission=${permission}'>${i.index}</a></li>
									</c:when>
									<c:when test="${paging.pagNum != i.index && i.index != 0}">
										<li><a href='${pageContext.request.contextPath}/qaBoard.listAdminOption?pageNum=${i.index}&searchOption=${searchOption}&keyword=${keyword}&category=${category}&range=${range}&condition=${condition}&permission=${permission}'>${i.index}</a></li>	
									</c:when>
								</c:choose>
							</c:forEach>
							<li><a href='${pageContext.request.contextPath}/qaBoard.listAdminOption?pageNum=${paging.startPage+5}&searchOption=${searchOption}&keyword=${keyword}&category=${category}&range=${range}&condition=${condition}&permission=${permission}'>다음</a></li>
							<li><a href='${pageContext.request.contextPath}/qaBoard.listAdminOption?pageNum=${paging.totalPage}&searchOption=${searchOption}&keyword=${keyword}&category=${category}&range=${range}&condition=${condition}&permission=${permission}'>맨뒤</a></li>
						  </ul>
						  
						</div>
					  
					             
					</div>
				</div><!--/span-->
			
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
