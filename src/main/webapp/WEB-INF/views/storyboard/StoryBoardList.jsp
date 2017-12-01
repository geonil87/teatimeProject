<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TEA :: TIME</title>
<script src="resources/jquery-3.2.1.min.js"></script>


<!-- 언어 반응형 -->
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<!-- 언어 반응형 -->

	

	<!-- Standard Favicon -->
	<link rel="icon" type="image/x-icon" href="resources/assets/images/soso.png" />
	<link rel="apple-touch-icon-precomposed" href="resources/assets/images/apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="resources/assets/images/apple-touch-icon-72x72-precomposed.html">
	<link rel="apple-touch-icon-precomposed" href="resources/assets/images/apple-touch-icon-57x57-precomposed.png">	
	<link rel="stylesheet" type="text/css" href="resources/assets/revolution/css/settings.css">
<link rel="stylesheet" type="text/css" href="resources/customcss/boardCustom.css">

    <link href="resources/assets/css/lib.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/assets/css/rtl.css">
	<link rel="stylesheet" type="text/css" href="resources/style.css">
<style type="text/css">
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

<body class="singletemplate" data-offset="200" data-spy="scroll" data-target=".ownavigation">
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
<c:forEach items="${allstoryboardlist }" var="storyboardvo">
	<c:if test="${storyboardvo.available==0 }">
		<tr>
		<td class="frm"></td>
		<td class="num">${storyboardvo.idx}</td>
		<td class="title"><a href=${pageContext.request.contextPath}/storyBoard.detail?idx=${storyboardvo.idx}>${storyboardvo.title}</a><b style="color: red">(${storyboardvo.comment_count})</b></td>
		<td><a href="#">${storyboardvo.user_nick}</a></td>
		<td class="date">${storyboardvo.wdate}</td>
		<td class="hit">${storyboardvo.hit}</td>
		</tr>
	</c:if>
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
									<input type="button" id="pageNum" class="page-numbers" value="${i }" onclick="location.href='<%=request.getContextPath()%>/storyBoard.list?pageNum=${i}'">
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
			location.href="${pageContext.request.contextPath}/storyBoard.list?pageNum="+pageNum; 
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
			location.href="${pageContext.request.contextPath}/storyBoard.list?pageNum="+pageNum; 
		}		
	});
});
</script>
<!-- Footer Main /- -->
<div class="padding-100"></div>
		<div class="padding-50"></div>
		
		<!-- Footer Main -->
		<footer class="container-fluid no-left-padding no-right-padding footer-main footer-section1">
			<!-- Container -->
			<div class="container">
				<ul class="ftr-social">
					<li><a href="https://ko-kr.facebook.com/" title="Facebook"><i class="fa fa-facebook"></i>Facebook</a></li>
					<li><a href="https://twitter.com/?lang=ko" title="Twitter"><i class="fa fa-twitter"></i>twitter</a></li>
					<li><a href="https://www.instagram.com/?hl=" title="Instagram"><i class="fa fa-instagram"></i>Instagram</a></li>
					<li><a href="https://plus.google.com/?hl=ko" title="Google Plus"><i class="fa fa-google-plus"></i>Google plus</a></li>
					<li><a href="https://www.pinterest.co.kr/" title="Pinterest"><i class="fa fa-pinterest-p"></i>pinterest</a></li>
					<li><a href="https://www.youtube.com/?hl=ko&gl=KR‎" title="Youtube"><i class="fa fa-youtube"></i>youtube</a></li>
				</ul>
				<div class="copyright">
					<p>Copyright @ 2017 MINIBLOG</p>
				</div>
			</div><!-- Container /- -->
		</footer><!-- Footer Main /- -->
	
	<!-- JQuery v1.12.4 -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.12.4.min.js"></script>

	<!-- Library - Js -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/lib.js"></script>
	
	<!-- REVOLUTION JS FILES -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/jquery.themepunch.revolution.min.js"></script>

	<!-- SLIDER REVOLUTION 5.0 EXTENSIONS  (Load Extensions only on Local File Systems !  The following part can be removed on Server for On Demand Loading) -->	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.video.min.js"></script>
		
	<!-- Library - Theme JS -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/functions.js"></script>
	
<script type=text/javascript>
$(document).ready(function(){
        
    $(".return-top").hide(); // 탑 버튼 숨김
    $(function () {
                 
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
                $('.return-top').fadeIn();
            } else {
                $('.return-top').fadeOut();
            }
        });
                
        $('.return-top').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 800);  // 탑 이동 스크롤 속도
            return false;
        });
    });
 
});
</script>
<script type=text/javascript>
$(document).ready(function(){
    $(function () {
                 
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
                $('.return-bottom').fadeOut();
            } else {
                $('.return-bottom').fadeIn();
            }
        });
                
        $('.return-bottom').click(function () {
            $('body,html').animate({
                scrollTop: '+=3100'
            }, 1500);  // 탑 이동 스크롤 속도
            return false;
        });
    });
 
});
</script>

<!-- 스크롤 -->
<a class="return-bottom" href="#" style="right:15px; bottom:15px; position:fixed; z-index:9999;"><img src="${pageContext.request.contextPath}/resources/assets/images/down.png"></a><a class="return-top" href="#" style="right:15px; bottom:15px; position:fixed; z-index:9999;"><img src="${pageContext.request.contextPath}/resources/assets/images/scroll.png"></a>
<!-- 스크롤 -->
</body>
</html>