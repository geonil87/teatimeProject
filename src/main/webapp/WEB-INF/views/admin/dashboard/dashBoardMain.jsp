<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/adminHeader.jsp" %>
			
			<!-- start: Content -->
			<div id="content" class="span10">
			
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="index.html">관리자 메인페이지</a> 
				</li>
				
			</ul>

			<div class="row-fluid">
				
				<div class="span3 statbox purple" onTablet="span6" onDesktop="span3" style="background-color:  gray;">
<!-- 					<div class="boxchart">5,6,7,2,0,4,2,4,8,2,3,3,2</div> -->
					<div class="number">${userTotalCount}<i class="icon-arrow-up"></i></div>
					<div class="title">전체 누적 방문자 수</div>
				</div>
				<div class="span3 statbox green" onTablet="span6" onDesktop="span3">
					<div class="boxchart"><c:forEach items="${userMonthGRF}" var="board" varStatus="status">${board.count} <c:if test="${status.last=='false'}">,</c:if></c:forEach></div>
					<div class="number">${userMonthCount}<i class="icon-arrow-up"></i></div>
					<div class="title">이번달 방문자 수</div>
				</div>
				<div class="span3 statbox blue noMargin" onTablet="span6" onDesktop="span3">
					<div class="boxchart"><c:forEach items="${userWeekGRF}" var="board" varStatus="status">${board.count} <c:if test="${status.last=='false'}">,</c:if></c:forEach></div>
					<div class="number">${userWeekCount}<i class="icon-arrow-up"></i></div>
					<div class="title">이번주 방문자 수</div>
				</div>
				<div class="span3 statbox yellow" onTablet="span6" onDesktop="span3">
					<div class="boxchart"><c:forEach items="${userDayGRF}" var="board" varStatus="status">${board.count} <c:if test="${status.last=='false'}">,</c:if></c:forEach></div>
					<div class="number">${userDayCount}<i class="icon-arrow-down"></i></div>
					<div class="title">금일 방문자 수</div>
				</div>	
				
			</div>	
			<div class="row-fluid">
				
				<div class="span3 statbox purple" onTablet="span6" onDesktop="span3">
<!-- 					<div class="boxchart">5,6,7,2,0,4,2,4,8,2,3,3,2</div> -->
					<div class="number">${storyTotalCount}<i class="icon-arrow-up"></i></div>
					<div class="title">스토리 전체 글 수</div>
				</div>
				<div class="span3 statbox green" onTablet="span6" onDesktop="span3">
					<div class="boxchart"><c:forEach items="${storyMonthGRF}" var="board" varStatus="status">${board.count} <c:if test="${status.last=='false'}">,</c:if></c:forEach></div>
					<div class="number">${storyMonthCount}<i class="icon-arrow-up"></i></div>
					<div class="title">스토리 이번 달 글 수</div>
				</div>
				<div class="span3 statbox blue noMargin" onTablet="span6" onDesktop="span3">
					<div class="boxchart"><c:forEach items="${storyWeekGRF}" var="board" varStatus="status">${board.count} <c:if test="${status.last=='false'}">,</c:if></c:forEach></div>
					<div class="number">${storyWeekCount}<i class="icon-arrow-up"></i></div>
					<div class="title">스토리 이번 주 글 수</div>
				</div>
				<div class="span3 statbox yellow" onTablet="span6" onDesktop="span3">
					<div class="boxchart"><c:forEach items="${storyDayGRF}" var="board" varStatus="status">${board.count} <c:if test="${status.last=='false'}">,</c:if></c:forEach></div>
					<div class="number">${storyDayCount}<i class="icon-arrow-down"></i></div>
					<div class="title">스토리 금일 글 수</div>
				</div>	
				
			</div>	
			
			
			<div class="row-fluid">
				
				<div class="span3 statbox purple" onTablet="span6" onDesktop="span3">
<!-- 					<div class="boxchart">5,6,7,2,0,4,2,4,8,2,3,3,2</div> -->
					<div class="number">${photoTotalCount}<i class="icon-arrow-up"></i></div>
					<div class="title">포토 전체 글 수</div>
				</div>
				<div class="span3 statbox green" onTablet="span6" onDesktop="span3">
					<div class="boxchart"><c:forEach items="${photoMonthGRF}" var="board" varStatus="status">${board.count} <c:if test="${status.last=='false'}">,</c:if></c:forEach></div>
					<div class="number">${photoMonthCount}<i class="icon-arrow-up"></i></div>
					<div class="title">포토 이번 달 글 수</div>
				</div>
				<div class="span3 statbox blue noMargin" onTablet="span6" onDesktop="span3">
					<div class="boxchart"><c:forEach items="${photoWeekGRF}" var="board" varStatus="status">${board.count} <c:if test="${status.last=='false'}">,</c:if></c:forEach></div>
					<div class="number">${photoWeekCount}<i class="icon-arrow-up"></i></div>
					<div class="title">포토 이번 주 글 수</div>
				</div>
				<div class="span3 statbox yellow" onTablet="span6" onDesktop="span3">
					<div class="boxchart"><c:forEach items="${photoDayGRF}" var="board" varStatus="status">${board.count} <c:if test="${status.last=='false'}">,</c:if></c:forEach></div>
					<div class="number">${photoDayCount}<i class="icon-arrow-down"></i></div>
					<div class="title">포토 금일 글 수</div>
				</div>	
				
			</div>
			
			
						<div class="row-fluid">
				
				<div class="span3 statbox purple" onTablet="span6" onDesktop="span3">
<!-- 					<div class="boxchart">5,6,7,2,0,4,2,4,8,2,3,3,2</div> -->
					<div class="number">0<i class="icon-arrow-up"></i></div>
					<div class="title">동영상 전체 글 수</div>
				</div>
				<div class="span3 statbox green" onTablet="span6" onDesktop="span3">
					<div class="boxchart"></div>
					<div class="number">0<i class="icon-arrow-up"></i></div>
					<div class="title">동영상 이번 달 글 수</div>
				</div>
				<div class="span3 statbox blue noMargin" onTablet="span6" onDesktop="span3">
					<div class="boxchart"></div>
					<div class="number">0<i class="icon-arrow-up"></i></div>
					<div class="title">동영상 이번 주 글 수</div>
				</div>
				<div class="span3 statbox yellow" onTablet="span6" onDesktop="span3">
					<div class="boxchart"></div>
					<div class="number">0<i class="icon-arrow-down"></i></div>
					<div class="title">동영상 금일 글 수</div>
				</div>	
				
			</div>

			<div class="row-fluid hideInIE8 circleStats">
				
				
				
				<div class="clearfix"></div>
								
			</div><!--/row-->
			
       

	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
<%@ include file="../include/adminBottom.jsp" %>	

	
</body>
</html>
