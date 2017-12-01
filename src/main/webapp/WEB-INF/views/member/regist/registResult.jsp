<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>TEA :: TIME</title>

<!-- 언어 반응형 -->
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<!-- 언어 반응형 -->
	
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/assets/images/soso.png" />
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/resources/assets/images/apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/resources/assets/images/apple-touch-icon-72x72-precomposed.html">
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/resources/assets/images/apple-touch-icon-57x57-precomposed.png">	
	<link href="${pageContext.request.contextPath }/resources/assets/css/lib.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/rtl.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/style.css">
	    	<!-- JQuery v1.12.4 -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/jquery-1.12.4.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/js/lib.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/js/functions.js"></script>
	

	
	
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	   <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
       <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
  
      <link href="${pageContext.request.contextPath}/resources/btstrap/js/bootstrap.js" rel="stylesheet"> 
      <link href="${pageContext.request.contextPath}/resources/btstrap/js/bootstrap.min.js" rel="stylesheet">
	
	<script type="text/javascript">
/* UI Pattern Script */
/* //UI Pattern Script */
</script>
</head>
<body class="singletemplate" data-offset="200" data-spy="scroll" data-target=".ownavigation">
	<!-- Loader -->

		
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
							<li><a class="nav-link" title="mypage" href="${pageContext.request.contextPath }/mypage">mypage</a></li>
						
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
	<br>
	
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
	
<div><img src="${pageContext.request.contextPath}/resources/customImage/cof.gif"></div><img src="${pageContext.request.contextPath}/resources/customImage/1111.PNG"><br>

<p><b><c:out value="${registResult.userName}"/></b>님의
아이디는<b><ins>[<c:out value="${registResult.userId}"/>]</ins></b>이며,
닉네임은<b><ins>[<c:out value="${registResult.userNick}"/>]</ins></b>입니다.</p><br>

<input type="button" value="메인으로" onclick="location.href='${pageContext.request.contextPath}/teatime.main'">
<input type="button" value="로그인 " onclick="location.href='${pageContext.request.contextPath}/member.login'">
	
									</div>
								</div>
							</div>
						</div><!-- Content Area /- -->
					</div><!-- Row /- -->
				</div><!-- container /- -->
			</div><!-- Aboute-me Section /- -->
<!-- Footer Main /- -->
<div class="padding-100"></div>
		<div class="padding-50"></div>
		
		<!-- Footer Main -->
		<footer class="container-fluid no-left-padding no-right-padding footer-main footer-section1">
			<!-- Container -->
			<div class="container">
				<ul class="ftr-social">
					<li><a href="#" title="Facebook"><i class="fa fa-facebook"></i>Facebook</a></li>
					<li><a href="#" title="Twitter"><i class="fa fa-twitter"></i>twitter</a></li>
					<li><a href="#" title="Instagram"><i class="fa fa-instagram"></i>Instagram</a></li>
					<li><a href="#" title="Google Plus"><i class="fa fa-google-plus"></i>Google plus</a></li>
					<li><a href="#" title="Pinterest"><i class="fa fa-pinterest-p"></i>pinterest</a></li>
					<li><a href="#" title="Youtube"><i class="fa fa-youtube"></i>youtube</a></li>
				</ul>
				<div class="copyright">
					<p>Copyright @ 2017 MINIBLOG</p>
				</div>
			</div><!-- Container /- -->
		</footer><!-- Footer Main /- -->
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
                scrollTop: '+=1300'
            }, 800);  // 탑 이동 스크롤 속도
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