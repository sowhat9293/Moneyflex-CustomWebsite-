<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/resources/css/CSSreset.min.css" />" />
<link id="skin" rel="stylesheet" type="text/css" media="screen" href="<c:url value="/resources/css/divas_free_skin.css" />" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.divas-1.1.min.js"/>"></script>
<script type="text/javascript">
			$(document).ready(function()
			{
				$("#slider").divas({
					slideTransitionClass: "divas-slide-transition-left",
					titleTransitionClass: "divas-title-transition-left",
					titleTransitionParameter: "left",
					titleTransitionStartValue: "-999px",
					titleTransitionStopValue: "0px",
					wingsOverlayColor: "rgba(0,0,0,0.6)",
					mainImageWidth: "65%"
				});
			});
</script>
</head>
<body>
			<div id="slider" class="divas-slider">
				<ul class="divas-slide-container">
		           <li class="divas-slide"><img src="<c:url value="/resources/images/aa.jpg"/>" alt="" data-src="<c:url value="/resources/images/aa.jpg"/>"/></li>
		           <li class="divas-slide"><img src="<c:url value="/resources/images/bb.jpg"/>" alt="" data-src="<c:url value="/resources/images/bb.jpg"/>"/></li>
		           <li class="divas-slide"><img src="<c:url value="/resources/images/cc.jpg"/>" alt="" data-src="<c:url value="/resources/images/cc.jpg"/>"/></li>
			    </ul>
			    <div class="divas-navigation">
			        <span class="divas-prev"></span>
			        <span class="divas-next"></span>
			    </div>
                <div class="divas-controls">
                	<span class="divas-start"><i class="fa fa-play"></i></span>
			        <span class="divas-stop"><i class="fa fa-pause"></i></span>
                </div>
			</div>
			<script type="text/javascript" src="<c:url value="/resources/js/prism.js"/>"></script>
</body>
</html>