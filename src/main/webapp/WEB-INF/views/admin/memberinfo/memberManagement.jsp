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
				<li><a href="#">회원 관리</a></li>
			</ul>
			
						
							
			<div class="row-fluid">
			
				<div class="box span12">
					<div class="box-header">
						<h2><i class="halflings-icon white align-justify"></i><span class="break"></span>회원 관리</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
						<br>
						<table class="table table-bordered table-condensed">
							  <thead>
								  <tr>
									  <th style="text-align: center;" width="30px">번호</th>
									  <th style="text-align: center;">아이디</th>
									  <th style="text-align: center;">닉네임</th>
									  <th style="text-align: center;">이름</th>
									  <th style="text-align: center;" width="100px">회원 상태</th>                                        
								  </tr>
							  </thead>   
							  <tbody>
							  <c:forEach items="${memberList}" var="memberList">
									<tr>
									
										<td style="text-align: center;" width="30px">${memberList.idx}</td>
										<td style="text-align: center;"><a href='${pageContext.request.contextPath}/management.memberInfo?&userId=${memberList.userId}'>${memberList.userId}</a></td>
										<td style="text-align: center;"><a href='${pageContext.request.contextPath}/management.memberInfo?&userId=${memberList.userId}'>${memberList.userNick}</a></td>
										<td style="text-align: center;"><a href='${pageContext.request.contextPath}/management.memberInfo?&userId=${memberList.userId}'>${memberList.userName}</a></td>
										<td style="text-align: center;">
											<c:choose>
												<c:when test="${memberList.userPermission==1}"><a href='${pageContext.request.contextPath}/management.memberInfo?&userId=${memberList.userId}'><span class="label label-success">정상</span></a></c:when>
												<c:when test="${memberList.userPermission==2}"><a href='${pageContext.request.contextPath}/management.memberInfo?&userId=${memberList.userId}'><span class="label label-warning">정지</span></a></c:when>
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
									<option value="" <c:out value="${searchOption == ''?'selected':''}"/> >전체</option>
									<option value="userId" <c:out value="${searchOption == 'userId'?'selected':''}"/> >아이디</option>
									<option value="userNick" <c:out value="${searchOption == 'userNick'?'selected':''}"/> >닉네임</option>
									<option value="userName" <c:out value="${searchOption == 'userName'?'selected':''}"/> >이름</option>
								</select>
							 	<div class="input-append">
									<form action="${pageContext.request.contextPath}/management.memberList" method="get" id="search">
											<input type="hidden" id="pageNum" name="pageNum" value="${paging.pageNum}">
											<input type="text" id="keyword" name="keyword" value="${keyword}">
											<input class="btn btn-small btn-primary" type="submit" value="검색">
									</form>
							 	</div>
						 	</div>
						 </div>
						 <div class="pagination pagination-centered">
						  <ul>
						  	<li><a href='${pageContext.request.contextPath}/management.memberList?pageNum=1&searchOption=${searchOption}&keyword=${keyword}'>맨앞</a></li>
							<li><a href='${pageContext.request.contextPath}/management.memberList?pageNum=${paging.startPage-5}&searchOption=${searchOption}&keyword=${keyword}'>이전</a></li>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" varStatus="i">
								<c:choose>
									<c:when test="${paging.pageNum == i.index && i.index != 0}">
										<li class="active"><a href='${pageContext.request.contextPath}/management.memberList?pageNum=${i.index}&searchOption=${searchOption}&keyword=${keyword}'>${i.index}</a></li>
									</c:when>
									<c:when test="${paging.pagNum != i.index && i.index != 0}">
										<li><a href='${pageContext.request.contextPath}/management.memberList?pageNum=${i.index}&searchOption=${searchOption}&keyword=${keyword}'>${i.index}</a></li>	
									</c:when>
								</c:choose>
							</c:forEach>
							<li><a href='${pageContext.request.contextPath}/management.memberList?pageNum=${paging.startPage+5}&searchOption=${searchOption}&keyword=${keyword}'>다음</a></li>
							<li><a href='${pageContext.request.contextPath}/management.memberList?pageNum=${paging.totalPage}&searchOption=${searchOption}&keyword=${keyword}'>맨뒤</a></li>
						  </ul>
						  
						</div>
					</div>
				</div><!--/span-->
				
					
 

	</div><!--/.fluid-container-->
	
			<!-- end: Content -->

			
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
			
	
<%@ include file="../include/adminBottom.jsp" %>
</body>
</html>
