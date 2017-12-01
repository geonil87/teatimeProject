<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TEA :: TIME</title>
<script src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/customcss/boardCustom.css">
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
							<div class="aboute-block">
								<hr>
								
								<div class="block-title">
									<h3>게시판 목록</h3>
								</div>
								<hr>
	
<!-- UI Object -->
<table class="tbl_type" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
<caption>게시판 리스트</caption>
<colgroup>
<col width="30"><col width="80"><col>
<col width="115"><col width="85"><col width="60">
</colgroup>
<thead>
<tr>
<th scope="col">&nbsp;</th>
<th scope="col">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No</th>
<th scope="col" style="text-align: center;">제목</th>
<th scope="col">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;글쓴이</th>
<th scope="col">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;날짜</th>
<th scope="col">&nbsp;&nbsp;&nbsp;조회수</th>
</tr>
</thead>
<tbody>
<c:forEach items="${searchList }" var="searchList">
<tr>
<td class="frm"><input id="chk_sel" type="checkbox" value=""><label for="chk_sel">선택</label></td>
<td class="num">${searchList.idx}</td>
<td class="title"><a href="${pageContext.request.contextPath}/storyBoard.detail?idx=${searchList.idx}">${searchList.title}</a><b style="color: red">(${searchList.comment_count})</b></td>
<td><a href="#">${searchList.user_nick}</a></td>
<td class="date">${searchList.wdate}</td>
<td class="hit">${searchList.hit}</td>
</tr>
</c:forEach>
</tbody>
</table>
<ul>
</ul>
</div>
</div><!-- Content Area /- -->
</div><!-- Row /- -->
</div><!-- container /- -->
</div><!-- Aboute-me Section /- -->


	<div class="container-fluid no-left-padding no-right-padding footer-page">
		<!-- Footer Main -->
		<footer class="container-fluid no-left-padding no-right-padding footer-main footer-section1">
			<div class="container-fluid no-left-padding no-right-padding subscribe-block">
				<!-- Container -->
				<div class="container">
				
					<form class="newsletter" action="<%=request.getContextPath() %>/storyBoard.search">
						<div class="input-group">
										
	<select name="searchColumn" style="margin-right: 1px">
	<option value="모두">&nbsp;&nbsp;모두</option>
	<option value="제목">&nbsp;&nbsp;제목</option>
	<option value="내용">&nbsp;&nbsp;내용</option>
	<option value="작성자">&nbsp;&nbsp;작성자</option>
	</select>

							<input type="text" style="width:1000px" placeholder="검색어를 입력해주세요." name="keyword">
							<span class="input-group-btn">
								<button class="btn btn-secondary" type="submit" style="top: 0px">검색</button>
							</span>
						</div>
					</form>
				</div><!-- Container /- -->
<form action="storyBoard.insert" method="get">
<button type="button" class="btn btn-default" id="write" value="글쓰기">글쓰기</button>
</form>		
			</div>
			</footer>
			
	</div>
<div class="entry-footer">
	<nav class="navigation pagination">
								<h2 class="screen-reader-text">Posts navigation</h2>
								<div class="nav-links">
									<a class="prev page-numbers" id="prev">Previous</a>
									<c:forEach var="i" begin="1" end="${pageNumCount }">
										<input type="button" id="pageNum"  class="page-numbers" value="${i }" 
										onclick="location.href='<%=request.getContextPath()%>/storyBoard.search?searchColumn=${searchColumn}&keyword=${keyword }&pageNum=${i}'">
									</c:forEach>
									<a class="next page-numbers" id="next">Next</a>
									<input type="hidden" id="currentPageNum" value="${param.pageNum }">
									<input type="hidden" id="finalPageNum" value="${pageNumCount }">
								</div>
							</nav><!-- Pagination /- -->				
						</div><!-- Content Area /- -->
					</div>
				
</div>


<script type="text/javascript">
$(document).ready(function(){
	$('#write').on('click',function(e){	
		var id = "${sessionId}";
		if(id==""){		
			alert("로그인을 해주세요.");		
		}else{		
			location.href="${pageContext.request.contextPath}/storyBoard.insert";
		} 
	});
	$('#next').on('click',function(e){
		var searchColumn = "${searchColumn}";
		var keyword = "${keyword}";
		e.preventDefault();
		var currentPageNum = parseInt($('#currentPageNum').val());		
		if(isNaN(currentPageNum)){
			currentPageNum=1;
		}
		var finalPageNum = parseInt($('#finalPageNum').val());
		var pageNum = currentPageNum+1;		
		if(finalPageNum < pageNum){
			alert("마지막 페이지입니다.");
			pageNum= finalPageNum;
		}else{
			location.href="${pageContext.request.contextPath}/storyBoard.search?searchColumn="+searchColumn+"&keyword="+keyword+"&pageNum="+pageNum;
		}		
	});
	
	$('#prev').on('click',function(e){
		var searchColumn = "${searchColumn}";
		var keyword = "${keyword}";
		e.preventDefault();
		var currentPageNum = parseInt($('#currentPageNum').val());
		if(isNaN(currentPageNum)){
			currentPageNum=1;
		}		
		var pageNum = (currentPageNum-1);
		if(pageNum==0){
			alert("첫 페이지입니다.");
			pageNum=1;
		}else{
			location.href="${pageContext.request.contextPath}/storyBoard.search?searchColumn="+searchColumn+"&keyword="+keyword+"&pageNum="+pageNum; 
		}		
	});
});
</script>
	
	

 <%@ include file="bottom.jsp" %>	
</body>
</html>