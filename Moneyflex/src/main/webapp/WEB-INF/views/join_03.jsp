<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Money</title>
<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrap">
  <div class="hedaer_box">
  		<!-- 헤더 시작 -->
        <div id="header">
            <h1><a href="../moneyflex"><img src="<c:url value="/resources/images/logo.jpg" />" alt="머니플렉스 로고" title="머니플렉스 로고"></a></h1>
            <div class="nav">
            	<div class="util_menu">
                    <ul>
                    	<li><a href="mypage.html">MYPAGE</a></li>
                        <li><a href="login.html">LOGIN</a></li>
                        <li><a href="join_01.html">JOIN</a></li>  
                    </ul>
                </div>
                <div class="gnb">
                    <ul>
                    	<li><a href="../moneyflex#section_06">CONTACT</a></li>
                        <li><a href="../moneyflex#section_05">SOCIAL</a></li>
                        <li><a href="../moneyflex#section_04">SCHEDULE</a></li>
                        <li><a href="../moneyflex#section_03">NEWS</a></li>
                        <li><a href="../moneyflex#section_02">HISTORY</a></li>
                        <li><a href="../moneyflex#section_01">ABOUT</a></li>                 
                    </ul>
                </div>
            </div>
        </div>
        <!-- 헤더 끝 -->
    </div>
    <section>
   		<!-- 회원가입 섹션 시작 -->
    	<div class="sub_container">
        	<p class="sub_navi">HOME > <span class="navi_color">JOIN</span></p>
            <p class="sub_hdtitle">회원가입</p>
            <div class="finish_box">
            	<p class="text">회원가입이 완료되었습니다.</p><br><br><br>
                <div class="btn_area">
                    <a href="../moneyflex"><p class="member_btn01">메인으로</p></a>
                    <a href="login.do"><p class="member_btn02">로그인</p></a>
            	</div>
            </div>
        </div>
    	<!-- 회원가입 섹션 끝 -->
    </section>
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