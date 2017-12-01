<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TEA :: TIME</title>
</head>
<body>




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
					<p>Copyright @ 2017 TEATIME</p>
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