<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ include file="../storyboard/writeHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
 <style type="text/css">
.hide-bullets {
list-style:none;
margin-left: -40px;
margin-top:20px;
}
</style> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($) {
	 
    $('#myCarousel').carousel({
            interval: 5000
    });

    $('#carousel-text').html($('#slide-content-0').html());

    //Handles the carousel thumbnails
   $('[id^=carousel-selector-]').click( function(){
        var id = this.id.substr(this.id.lastIndexOf("-") + 1);
        var id = parseInt(id);
        $('#myCarousel').carousel(id);
    });


    // When the carousel slides, auto update the text
    $('#myCarousel').on('slid.bs.carousel', function (e) {
             var id = $('.item.active').data('slide-number');
            $('#carousel-text').html($('#slide-content-'+id).html());
    });
});
</script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
			<!-- Slider Section -->
			<div class="container-fluid no-left-padding no-right-padding slider-section slider-section5">
<div class="container">
        <div id="main_area">
                <!-- Slider -->
                <div class="row">
                    <div class="col-xs-12" id="slider">
                        <!-- Top part of the slider -->
                        <div class="row">
                            <div class="col-sm-8" id="carousel-bounding-box" style="width: 770px; height: 460px;">
                                <div class="carousel slide" id="myCarousel">
                                    <!-- Carousel items -->
                                    <div class="carousel-inner" >
                                
                                    <c:forEach items="${photoindex}" var="photoindex" varStatus="status" >
									<c:if test="${status.index == 0}">
                                        <div class="active item" data-slide-number="${status.index}" style="width: 770px; height: 460px;">
                                        <img src="${photoindex}" class="img-responsive center-block" style="height: 100%; width: 100%" ></div>
									</c:if>
								
									<c:if test="${status.index != 0}">
                                        <div class="item" data-slide-number="${status.index}" style="width: 770px; height: 460px;">
                                        <img src="${photoindex}" class="img-responsive center-block" style="height: 100%; width: 100%"></div>
									</c:if>      
                                    </c:forEach>
                                    
                                    </div><!-- Carousel nav -->
                                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>                                       
                                    </a>
                                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>                                       
                                    </a>                                
                                    </div>
                            </div>

                            <div class="col-sm-4" id="carousel-text"></div>

                            <div id="slide-content" style="display: none;">
                                <div id="slide-content-0">
                                    <h5>${sumnail.title}</h5>
                                    <hr>
                                    <p>${sumnail.user_nick}</p>
                                    <hr>
                                    <p class="sub-text">${sumnail.wdate} <br>
                                    <hr>
                                    <a href="${pageContext.request.contextPath}/mediaBoard.detail?idx=${detail}">원본보기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--/Slider-->
<hr>
                <div class="row hidden-xs" id="slider-thumbs">
                        <!-- Bottom switcher of slider -->
                        <ul class="hide-bullets">
                    
                            <c:forEach items="${photoindex}" var="photoindex" varStatus="status">
				
										
								<c:if test="${status.index == 0}">
	                            <c:if test="${status.last == true }">
		                            <a class="thumbnail" id="carousel-selector-${status.index}"><img src="${photoindex}" style="height: 100px; width: 170px"></a>
		                        </c:if>
	                            <c:if test="${status.last == false}">
	                            	<li class="col-sm-2">
		                                <a class="thumbnail" id="carousel-selector-${status.index}"><img src="${photoindex}" style="height: 100px; width: 170px"></a>
		                            </li>
		                        </c:if>
	       						</c:if>
	       								
	                            <c:if test="${status.index != 0}">
	                            <li class="col-sm-2">
	                                <a class="thumbnail" id="carousel-selector-${status.index}"><img src="${photoindex}" style="height: 100px; width: 170px"></a>
	                            </li>
								</c:if>
              				</c:forEach>             
                        </ul>                 
                </div>
        </div>
</div>
</div>

	<%@ include file="../storyboard/bottom.jsp" %>

</body>
</html>