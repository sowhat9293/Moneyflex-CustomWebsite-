<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/jquery.gridder.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/history_slider.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.gridder.js"/>"></script>
<script>
            jQuery(document).ready(function ($) {

                // Call Gridder
                $(".gridder").gridderExpander({
                    scrollOffset: 60,
                    scrollTo: "panel", // "panel" or "listitem"
                    animationSpeed: 400,
                    animationEasing: "easeInOutExpo",
                    onStart: function () {
                        console.log("Gridder Inititialized");
                    },
                    onExpanded: function (object) {
                        console.log("Gridder Expanded");
                        $(".carousel").carousel();
                    },
                    onChanged: function (object) {
                        console.log("Gridder Changed");
                    },
                    onClosed: function () {
                        console.log("Gridder Closed");
                    }
                });
            });
</script>
</head>
<body>
<div class="container">
			
					<ul class="gridder">
                <li class="gridder-list" data-griddercontent="#gridder-content-1" style="float:none;">
                    <img src="<c:url value="/resources/images/poster_01.jpg"/>" class="img-responsive" />
                </li><!--
                --><li class="gridder-list" data-griddercontent="#gridder-content-2" style="float:none;">
                    <img src="<c:url value="/resources/images/poster_02.jpg"/>" class="img-responsive" />
                </li><!--
                --><li class="gridder-list" data-griddercontent="#gridder-content-3" style="float:none;">
                    <img src="<c:url value="/resources/images/poster_03.jpg"/>" class="img-responsive" />
                </li><!--
                --><li class="gridder-list" data-griddercontent="#gridder-content-4" style="float:none;">
                    <img src="<c:url value="/resources/images/poster_04.jpg"/>" class="img-responsive" />
                </li><!--
                --><li class="gridder-list" data-griddercontent="#gridder-content-5" style="float:none;">
                    <img src="<c:url value="/resources/images/poster_05.jpg"/>" class="img-responsive" />
                </li><!--
                --><li class="gridder-list" data-griddercontent="#gridder-content-6" style="float:none;">
                    <img src="<c:url value="/resources/images/poster_06.jpg"/>" class="img-responsive" />
                </li><!--
                --><li class="gridder-list" data-griddercontent="#gridder-content-7" style="float:none;">
                    <img src="<c:url value="/resources/images/poster_07.jpg"/>" class="img-responsive" />
                </li><!--
                --><li class="gridder-list" data-griddercontent="#gridder-content-8" style="float:none;">
                    <img src="<c:url value="/resources/images/poster_08.jpg"/>" class="img-responsive" />
                </li>
            </ul>


            <div id="gridder-content-1" class="gridder-content">
                <div class="row">
                    <div class="col-sm-6">
                        <img src="<c:url value="/resources/images/poster_01.jpg"/>" class="img-responsive" />
                    </div>
                    <div class="col-sm-6">
                        <h2>머니플렉스 쇼</h2>
							<p>머니플렉스 2015년 첫번째 정기 공연</p>
                    </div>
                </div>
            </div>
            <div id="gridder-content-2" class="gridder-content">
                <div class="row">
                    <div class="col-sm-6">
                        <img src="<c:url value="/resources/images/poster_02.jpg"/>" class="img-responsive" />
                    </div>
                    <div class="col-sm-6">
                        <h2>로꼬 초빙 파티</h2>
                       		<p>모티에서 개최한 로꼬 초빙 파티</p>
                    </div>
                </div>
            </div>
            <div id="gridder-content-3" class="gridder-content">
                <div class="row">
                    <div class="col-sm-6">
                        <img src="<c:url value="/resources/images/poster_03.jpg"/>"class="img-responsive" />
                    </div>
                    <div class="col-sm-6">
                         <h2>오케이션 초빙 파티</h2>
                       		<p>모티에서 개최한 오케이션 초빙 파티</p>
                    </div>
                </div>
            </div>
            <div id="gridder-content-4" class="gridder-content">
                <div class="row">
                    <div class="col-sm-6">
                        <img src="<c:url value="/resources/images/poster_04.jpg"/>" class="img-responsive" />
                    </div>
                    <div class="col-sm-6">
                        <h2>비와이 초빙 파티</h2>
                       		<p>모티에서 개최한 비와이 초빙 파티</p>
                       </div>
                </div>
            </div>
            <div id="gridder-content-5" class="gridder-content">
                <div class="row">
                    <div class="col-sm-6">
                        <img src="<c:url value="/resources/images/poster_05.jpg"/>" class="img-responsive" />
                    </div>
                    <div class="col-sm-6">
                        <h2>그 외 포스터1</h2>
							<p>공연 포스터 1</p>
					</div>
                </div>
            </div>
            <div id="gridder-content-6" class="gridder-content">
                <div class="row">
                    <div class="col-sm-6">
                        <img src="<c:url value="/resources/images/poster_06.jpg"/>" class="img-responsive" />
                    </div>
                    <div class="col-sm-6">
                        <h2>Item 6</h2>
                           <h2>그 외 포스터2</h2>
							<p>공연 포스터 2</p>
					</div>
                </div>
            </div> 
            <div id="gridder-content-7" class="gridder-content">
                <div class="row">
                    <div class="col-sm-6">
                        <img src="<c:url value="/resources/images/poster_07.jpg"/>" class="img-responsive" />
                    </div>
                    <div class="col-sm-6">
                        <h2>그 외 포스터3</h2>
							<p>공연 포스터 3</p>
					</div>
                </div>
            </div>
            <div id="gridder-content-8" class="gridder-content">
                <div class="row">
                    <div class="col-sm-6">
                        <img src="<c:url value="/resources/images/poster_08.jpg"/>" class="img-responsive" />
                    </div>
                    <div class="col-sm-6">
						 <h2>그 외 포스터4</h2>
							<p>공연 포스터 4</p>
					</div>
					 </div>
					</div>
          

				</div>
</body>
</html>