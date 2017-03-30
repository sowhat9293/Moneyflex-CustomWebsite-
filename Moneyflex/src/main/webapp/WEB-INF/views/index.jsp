<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MONEYFLEX</title>
		<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="<c:url value="/resources/js/instafeed.min.js"/>"></script>
        <script type="text/javascript">
   			 var userFeed = new Instafeed({
      		  get: 'user',
      		  userId: 2694164,
      		  sortBy: "most-recent",
      		  limit: 20,
      		  template: '<a class="animation" href={{link}} target="_blank"><img src="{{image}}" /></a>',
     		   accessToken: '2694164.ff03e3b.d158f3fed692462082e8e39a1285ac65'
   			 });
   			 userFeed.run();
		</script>
</head>

<body>
<div id="wrap">
  <div class="hedaer_box">
  		<!-- 헤더 시작 -->
        <div id="header">
            <h1><a href="../moneyflex"><img src="<c:url value="/resources/images/logo.jpg"/>" alt="머니플렉스 로고" title="머니플렉스 로고"></a></h1>
            <div class="nav">
            	<div class="util_menu">
                    <ul>
                    	<li><a href="#">MYPAGE</a></li>
                        <li><a href="/moneyflex/login.do">LOGIN</a></li>
                        <li><a href="/moneyflex/join_01.do">JOIN</a></li>  
                    </ul>
                </div>
                <div class="gnb">
                    <ul>
                    	<li><a href="#section_06">CONTACT</a></li>
                        <li><a href="#section_05">SOCIAL</a></li>
                        <li><a href="#section_04">SCHEDULE</a></li>
                        <li><a href="#section_03">NEWS</a></li>
                        <li><a href="#section_02">HISTORY</a></li>
                        <li><a href="#section_01">ABOUT</a></li>               
                    </ul>
                </div>
            </div>
        </div>
        <!-- 헤더 끝 -->
    </div>
    <section>
    	<!-- 메인비쥬얼 시작 -->
    	<div class="main_visual">
			<section id="slider_wrapper">
			 	<jsp:include page="main_slider.jsp"></jsp:include>
			</section>
		</div>
        <!-- 메인비쥬얼 끝 -->
        <a name="section_01"></a>
        <!-- 어바웃 머니플렉스 시작 -->
        <div class="about">
        	<p class="ph2">About MoneyFlex</p>
            <p class="section_line"></p>
            <dl class="about_copy">
            	<dt>블랙뮤직 브랜드 Moneyflex(머니플렉스)는 힙합씬의 루키들과 현역들의 합동무대를 기획하여,</dt>
                <dd>공연을 주최함으로써 주목받는 신인들에게 큰 무대경험을 선사하고 자질을 확인해 보자는 모토의 공연을 주최하는 브랜드이다.</dd>
            </dl>
        </div>
        <!-- 어바웃 머니플렉스 끝 -->
        <a name="section_02"></a>
        <!-- 히스토리 시작 -->
        <div class="history">
        	<div class="history_area">
           	  <p class="ph2" style="color:#fff;">History</p>
              <p class="section_line"></p>
              <div class="poster_area">
              	<jsp:include page="history.jsp"></jsp:include>
              </div>
            </div>
        </div>
        <!-- 히스토리 끝 -->
        <a name="section_03"></a>
        <!-- 머니플렉스 뉴스 시작 -->
        <div class="news">
   			<jsp:include page="newsforjson.jsp"></jsp:include>
        </div>
        <!-- 머니플렉스 뉴스 끝 -->
        <a name="section_04"></a>
        <!-- 머니플렉스 스케쥴 시작 -->
  			<jsp:include page="calender.jsp"></jsp:include>
        <!-- 머니플렉스 스케쥴 끝 -->
        <a name="section_05"></a>
        <!-- 머니플렉스 SNS 시작 -->
        <div class="social">
        	<p class="ph2">Social</p>
            <p class="section_line"></p>
            <div class="facebook">
            <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.6&appId=253889848334261";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<div class="fb-page" data-href="https://www.facebook.com/moneyflexshow" data-tabs="timeline" data-width="350" data-height="500" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/moneyflexshow"><a href="https://www.facebook.com/moneyflexshow">머니플렉스 - Moneyflex</a></blockquote></div></div>
            </div>
            <div class="youtube">
            <iframe width="350" height="500" src="https://www.youtube.com/embed/TCs61b-b16E" frameborder="0" allowfullscreen></iframe>
            </div>
            <div class="instargram">
            <div id="instafeed"></div>
            </div>
        </div>
        <!-- 머니플렉스 SNS 끝 -->
    </section>
    <a name="section_06"></a>
    <!-- Footer 시작 -->
    <div id="footer">
    	<div class="fm_menu">
        	<ul>
            	<li class="text"><a href="#">이용약관</a></li>
                <li class="line"></li>
                <li class="text"><a href="#">개인정보취급방침</a></li>
                <li class="line"></li>
                <li class="text"><a href="#">사업자정보확인</a></li>
                <li class="line"></li>
                <li class="text"><a href="#">이메일무단수집거부</a></li>
                <li class="line"></li>
                <li class="text"><a href="#">예매내역 조회</a></li>
            </ul>
        </div>
        <div class="copyright">
        	<p>대표 : 최현광<span class="plr15"></span>Tel : 02.6959.4678<span class="plr15"></span>호스팅 서비스 사업자 : ㈜가비아<br>
            사업자등록번호 : 000-00-000000<span class="plr15"></span>계좌번호 : 농협 000-00-000000<Br>
            COPYRIGHT ⓒ 2016 MONEYFLEX. ALL RIGHTS RESERVED.</p>
            <p class="contact">Contact to : <a href="mailto:moneyflex92@gmail.net" class="contact_link">moneyflex92@gmail.net</a></p>
        </div>
    </div>
    <!-- Footer 끝 -->
</div>
</body>
</html>