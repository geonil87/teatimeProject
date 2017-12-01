<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TEA :: TIME</title>
<script src="${pageContext.request.contextPath }/resources/jquery-3.2.1.min.js"></script>
</head>

<!-- 언어 반응형 -->
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<!-- 언어 반응형 -->


	<!-- Standard Favicon -->
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/images/soso.png" />
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/assets/images/apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/assets/images/apple-touch-icon-72x72-precomposed.html">
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/assets/images/apple-touch-icon-57x57-precomposed.png">	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/revolution/css/settings.css">

    <link href="${pageContext.request.contextPath}/resources/assets/css/lib.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/rtl.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style.css">
	
<style type="text/css">
/* UI Object */
.tab_face{padding:0 0 35px 0}
.tab_face ul{position:relative;margin:0;padding:0;_padding:2px 0 0 0;border-bottom:2px solid #848484;font-family:Tahoma, Sans-serif;font-size:12px;list-style:none;*zoom:1}
.tab_face ul:after{display:block;clear:both;content:""}
.tab_face li{float:left;margin-right:1px;background:#D8D8D8}
.tab_face li a,
.tab_face li a span{position:relative;cursor:pointer}
.tab_face li a{float:left;text-decoration:none}
.tab_face li a span{display:inline-block;padding:6px 25px 6px 25px;color:#fff}
.tab_face li ul{display:none;overflow:hidden;position:absolute;top:40px;left:0;width:100%;margin:0;padding:0;border:0;white-space:nowrap;list-style:none;*zoom:1}
.tab_face li ul:after{display:block;clear:both;content:""}
.tab_face li li{overflow:visible;position:relative;left:-1px;padding:0 10px;border-left:1px solid #ddd;background:transparent}
.tab_face li li a{padding:0;margin:0;font-weight:normal;color:#666}
.tab_face.m1 .m1,
.tab_face.m2 .m2,
.tab_face.m3 .m3,
.tab_face.m4 .m4,
.tab_face.m5 .m5,
.tab_face.m6 .m6,
.tab_face.m7 .m7,
.tab_face.m8 .m8,
.tab_face.m9 .m9,
.tab_face.m10 .m10,
.tab_face.m11 .m11,
.tab_face.m12 .m12{margin-top:-1px;background-color:#1C1C1C}
.tab_face.m1 .m1 a span,
.tab_face.m2 .m2 a span,
.tab_face.m3 .m3 a span,
.tab_face.m4 .m4 a span,
.tab_face.m5 .m5 a span,
.tab_face.m6 .m6 a span,
.tab_face.m7 .m7 a span,
.tab_face.m8 .m8 a span,
.tab_face.m9 .m9 a span,
.tab_face.m10 .m10 a span,
.tab_face.m11 .m11 a span,
.tab_face.m12 .m12 a span{padding-top:7px;padding-bottom:7px;font-weight:bold;letter-spacing:-1px}
.tab_face.m1 .m1 ul,
.tab_face.m2 .m2 ul,
.tab_face.m3 .m3 ul,
.tab_face.m4 .m4 ul,
.tab_face.m5 .m5 ul,
.tab_face.m6 .m6 ul,
.tab_face.m7 .m7 ul,
.tab_face.m8 .m8 ul,
.tab_face.m9 .m9 ul,
.tab_face.m10 .m10 ul,
.tab_face.m11 .m11 ul,
.tab_face.m12 .m12 ul{display:block}
.tab_face li li a:hover,
.tab_face li li a:active,
.tab_face li li a:focus,
.tab_face.s1 .s1 a,
.tab_face.s2 .s2 a,
.tab_face.s3 .s3 a,
.tab_face.s4 .s4 a,
.tab_face.s5 .s5 a,
.tab_face.s6 .s6 a,
.tab_face.s7 .s7 a,
.tab_face.s8 .s8 a,
.tab_face.s9 .s9 a,
.tab_face.s10 .s10 a,
.tab_face.s11 .s11 a,
.tab_face.s12 .s12 a{font-weight:bold;color:#333;letter-spacing:-1px}
.tab_face.js_off{padding:0}
.tab_face.js_off ul{border:0}
.tab_face.js_off li{float:none}
.tab_face.js_off li a{float:none;font-weight:bold}
.tab_face.js_off li ul{display:block;position:static;left:0;top:0;padding:5px 0;background:#fff}
.tab_face.js_off li li{display:inline}
.tab_face.js_off li li a{font-weight:normal !important;color:#333;letter-spacing:normal}
.tab_face.js_off li li a:hover,
.tab_face.js_off li li a:active,
.tab_face.js_off li li a:focus{text-decoration:underline}
/* //UI Object */
/* UI Object */
.tbl_type1,.tbl_type1 th,.tbl_type1 td{border:0}
.tbl_type1{width:100%;border-bottom:1px solid #dddee2;font-family:'돋움',dotum;font-size:12px;table-layout:fixed}
.tbl_type1 caption{display:none}
.tbl_type1 th{padding:8px 0 5px 20px;border-top:1px solid #dddee2;background:#f1f1f3;color:#666;font-weight:bold;text-align:left;vertical-align:top}
.tbl_type1 td{padding:8px 5px 5px 12px;border-top:1px solid #dddee2;line-height:16px;vertical-align:top}


@media all and (max-width:992px){
	.tbl_type1,
	.tbl_type1 thead,
	.tbl_type1 tbody,
	.tbl_type1 tr,
	.tbl_type1 th,
	.tbl_type1 td {display:block}/* 테이블의 모든 요소를 block화 시킴*/
	.tbl_type1 {border-top:1px solid #000}
	.tbl_type1 tr:after {content:"";display:block;clear:both}/* th,td의 플롯해제 */
	.tbl_type1 th {position:relative;border-top:0 none;float:left;width:100%;border-right:0;box-sizing:border-box}/* ie9에서 float을 줘야함 */
	.tbl_type1 td {position:relative;border-top:0 none;float:left;width:100%;border-right:0;box-sizing:border-box}/* relative를 줘야 사파리에서 다시 키웠을때, 안깨짐*/
}

/* //UI Object */
/* UI Object */


.tbl_type,.tbl_type th,.tbl_type td{border:0;}
.tbl_type a{color:#383838;text-decoration:none}
.tbl_type{width:100%;border-bottom:1px solid #999;color:#666;font-size:12px;table-layout:fixed}
.tbl_type caption,.tbl_type .frm label{display:none}
.tbl_type th{padding:5px 0 4px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:18px;vertical-align:top}
.tbl_type td{padding:8px 0 5px;border-bottom:solid 1px #d2d2d2;text-align:center;}
.tbl_type .frm{padding:0;text-align:center}
.tbl_type .frm input{margin:0}
.tbl_type .num,.tbl_type .date,.tbl_type .hit{padding:0;font-family:Tahoma;font-size:11px;line-height:normal}
.tbl_type .title{text-align:left}
.tbl_type .title .pic,.tbl_type .title .new{margin:0 0 2px;vertical-align:middle}
.tbl_type tr.reply .title a{padding-left:12px;background:url(img/ic_reply.gif) 0 1px no-repeat}
.tbl_type tr.reply td a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
/* //UI Object */

@media all and (max-width:479px){
.tbl_type {width:100%;border-collapse:collapse;border-spacing:0;box-sizing:border-box;border-top:1px solid #aaa;border-left:1px solid #aaa}
.tbl_type caption {overflow:hidden;position:absolute;width:0;height:0;line-height:0;text-indent:-9999px}
.tbl_type th {padding:10px 0;border-right:1px solid #aaa;border-bottom:1px solid #aaa;background-color:#eee}
.tbl_type td {padding:10px 0 10px 10px;border-right:1px solid #aaa;border-bottom:1px solid #aaa}
}
@media all and (max-width:479px){
	.tbl_type .writer {display:none}
	.tbl_type .etc {display:none}
	.tbl_type .date {width:10% !important;}
	.tbl_type .subject {width:90% !important;}
}


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

<body data-offset="200" data-spy="scroll" data-target=".ownavigation">
	<!-- Loader -->
	<div id="site-loader" class="load-complete">
		<div class="loader">
			<div class="line-scale"><div></div><div></div><div></div><div></div><div></div></div>
		</div>
	</div><!-- Loader /- -->
	
	<!-- Header Section -->
	<header class="container-fluid no-left-padding no-right-padding header_s header-fix header_s1">
	
		<!-- SidePanel -->
		<div id="slidepanel-1" class="slidepanel">
			<!-- Top Header -->
			<div class="container-fluid no-right-padding no-left-padding top-header">
				<!-- Container -->
				<div class="container">	
					<div class="row">
						<div class="col-lg-4 col-6">
						</div>
						<div class="col-lg-4 logo-block">
							<a href="${pageContext.request.contextPath}/main" title="Logo">TEA :: TIME</a>
						</div>
						<div class="col-lg-4 col-6">
							<ul class="top-right user-info">
								
								<li class="dropdown">
									<a class="dropdown-toggle" href="#"><i class="pe-7s-user"></i></a>
									<ul class="dropdown-menu">
										<c:choose>
										<c:when test="${sessionScope.sessionPermission == null}">
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member.tos" title="회원가입">회원가입</a></li>
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member.login" title="로그인">로그인</a></li>
										</c:when>
										<c:when test="${sessionScope.sessionPermission == 1 || sessionScope.sessionPermission == 2}">
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member.checkModifyUserInfo" title="회원정보수정">회원정보수정</a></li>
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member.logout" title="로그아웃">로그아웃</a></li>
										</c:when>
										<c:when test="${sessionScope.sessionPermission == 0}">
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin" title="관리자">관리자</a></li>
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member.logout" title="로그아웃">로그아웃</a></li>
										</c:when>
										</c:choose>
									</ul>
									${sessionNick}
								</li>
							</ul>
						</div>
					</div>
				</div><!-- Container /- -->
			</div><!-- Top Header /- -->				
		</div><!-- SidePanel /- -->
		
		<!-- Menu Block -->
		<div class="container-fluid no-left-padding no-right-padding menu-block">
			<!-- Container -->
			<div class="container">				
				<nav class="navbar ownavigation navbar-expand-lg">
					<a class="navbar-brand" href="index.html">TEA :: TIME</a>
					<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar1" aria-controls="navbar1" aria-expanded="false" aria-label="Toggle navigation">
						<i class="fa fa-bars"></i>
					</button>
					<div class="collapse navbar-collapse" id="navbar1">
						<ul class="navbar-nav">							
							<li><a class="nav-link" title="home" href="${pageContext.request.contextPath }/main">home</a></li>
							<li><a class="nav-link" title="notices" href="${pageContext.request.contextPath }/noticesBoard.list">notices</a></li>
							<li><a class="nav-link" title="story" href="${pageContext.request.contextPath }/storyBoard.list">story</a></li>
							<li><a class="nav-link" title="photo" href="${pageContext.request.contextPath }/photoBoard.list">photo</a></li>
							<li><a class="nav-link" title="media" href="${pageContext.request.contextPath }/mediaBoard.list">media</a></li>
							<li><a class="nav-link" title="mypage" href="${pageContext.request.contextPath }/member.mycontent?board=story_board">mypage</a></li>
							
						</ul>
					</div>
					<div id="loginpanel-1" class="desktop-hide">
						<div class="right toggle" id="toggle-1">
							<a id="slideit-1" class="slideit" href="#slidepanel"><i class="fo-icons fa fa-inbox"></i></a>
							<a id="closeit-1" class="closeit" href="#slidepanel"><i class="fo-icons fa fa-close"></i></a>
						</div>
					</div>
				</nav>
			</div><!-- Container /- -->
		</div><!-- Menu Block /- -->
		<!-- Search Box -->
		<div class="search-box collapse" id="search-box">
			<div class="container">
			<form>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search..." required>
					<span class="input-group-btn">
						<button class="btn btn-secondary" type="submit"><i class="pe-7s-search"></i></button>
					</span>
				</div>
			</form>
			</div>
		</div><!-- Search Box /- -->
	</header><!-- Header Section /- -->
	
<div class="main-container">
	
		<main class="site-main">	
		
			<!-- Page Content -->
			<div class="container-fluid no-left-padding no-right-padding page-content">
				<!-- container -->	
				<div class="container">
				
	<div class="container">
	<div class="main-container">
			<div class="container-fluid no-left-padding no-right-padding page-content">
				<!-- container -->	
				<div class="container">
					<!-- Row -->
					<div class="row">
						<!-- Content Area -->
						<div class="col-sm-12 content-area">
							<div class="aboute-block" style="margin-top: -100px">
									<h1 class="widget-title" style="font-size: 25px;">공지사항</h1>
								<hr style="border: 0; height: 1px; background: #ccc;">
								</div>
							
							
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
<th scope="col">&nbsp;조회수</th>
</tr>
</thead>
<tbody>
	<c:forEach items="${importanceList }" var="importance">
		<tr style="background-color: #F8E6E0;">
		<td class="frm" ></td>
		<td class="num" >${importance.idx }</td>
		<td class="title" ><a href="${pageContext.request.contextPath}/noticesBoard.detail?idx=${importance.idx}" style="font-size:10pt; font-weight: bolder;">
		<c:choose>
			<c:when test="${importance.category==0}">
				[안내]
			</c:when>
			<c:when test="${importance.category==1}">
				[스토리게시판]
			</c:when>
			<c:when test="${importance.category==2}">
				[포토게시판]
			</c:when>
			<c:when test="${importance.category==3}">
				[미디어게시판]
			</c:when>
		</c:choose>
		${importance.title }</a></td>
		<td class="name" >${importance.user_nick }</td>
		<td class="date" >${importance.wdate }</td>
		<td class="hit" >${importance.hit }</td>
		</tr>
	</c:forEach>
	<c:forEach items="${notices }" var="notices">
		<tr>
		<td class="frm"></td>
		<td class="num">${notices.idx }</td>
		<td class="title"><a href="${pageContext.request.contextPath}/noticesBoard.detail?idx=${notices.idx}" style="font-size:10pt; font-weight: bolder;">
		<c:choose>
			<c:when test="${notices.category==0}">
				[안내]
			</c:when>
			<c:when test="${notices.category==1}">
				[스토리게시판]
			</c:when>
			<c:when test="${notices.category==2}">
				[포토게시판]
			</c:when>
			<c:when test="${notices.category==3}">
				[미디어게시판]
			</c:when>
		</c:choose>
		
		${notices.title }</a></td>
		<td><a>${notices.user_nick }</a></td>
		<td class="date">${notices.wdate }</td>
		<td class="hit">${notices.hit }</td>
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

<form action="noticeBoard.insert" method="get">
<c:choose>
										<c:when test="${sessionScope.sessionPermission == 0}">
<button type="button" class="btn btn-default" id="write" value="글쓰기">글쓰기</button>
</c:when>
</c:choose>
</form>									
								
</div>
<div class="entry-footer">
	<nav class="navigation pagination">
								<h2 class="screen-reader-text">Posts navigation</h2>
								<div class="nav-links">
									<a class="prev page-numbers" id="prev">Previous</a>
									<c:forEach var="i" begin="1" end="${pageNumCount }">
									<input type="button" id="pageNum" class="page-numbers" value="${i }" onclick="location.href='<%=request.getContextPath()%>/noticesBoard.list?pageNum=${i}'">
							</c:forEach>
									<a class="next page-numbers" id="next">Next</a>
									<input type="hidden" id="currentPageNum" value="${param.pageNum }">
									<input type="hidden" id="finalPageNum" value="${pageNumCount }">
								</div>
							</nav><!-- Pagination /- -->				
						</div><!-- Content Area /- -->
						</div><!-- Row /- -->
				</div><!-- container /- -->
			</div><!-- Aboute-me Section /- -->
		</main>

	
	
	<!-- JQuery v1.12.4 -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.12.4.min.js"></script>

	<!-- Library - Js -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/lib.js"></script>
	
	<!-- Library - Theme JS -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/functions.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
	$('#write').on('click',function(e){	
		var id = "${sessionId}";
		var permission = "${sessionPermission}";		
		if(id==""){		
			alert("로그인을 해주세요.");		
		}else if(permission=="0"){			
			location.href="${pageContext.request.contextPath}/noticesBoard.insert";
		}else{
			alert("권한이 없습니다.");
		} 
	});
	$('#next').on('click',function(e){
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
			location.href="${pageContext.request.contextPath}/noticesBoard.list?pageNum="+pageNum; 
		}		
	});
	
	$('#prev').on('click',function(e){
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
			location.href="${pageContext.request.contextPath}/noticesBoard.list?pageNum="+pageNum; 
		}		
	});
});
</script>

 <%@ include file="../storyboard/bottom.jsp" %>
</body>
</html>