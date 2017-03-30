<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Money</title>
<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
<script type="text/javascript">
function to_checkLogin(frm){
	if(document.log_form.id.value.length < 4 || document.log_form.password.value < 6 || document.log_form.password.value > 12)
	{
		alert("아이디 혹은 패스워드를 올바르게 입력하시오.");
		return false;
	}
	
	return ajax_checkLogin(frm);
}
function ajax_checkLogin(frm){
	var id = document.log_form.id.value;
	var password = document.log_form.password.value;
	$.ajax( 
		{
			url:'/moneyflex/checkLogin.do',
			type:'GET',
			data: "id=" + id +"&&password=" + password,
			dataType:'json',
                        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success :function(resData){
				if(resData)
				{
					alert("로그인 성공.");
					return true;
				}
				else	{
					alert("로그인 실패.");
					return false;
				}
			},
			error :function(hxr, status, error){ alert("로그인 오류."); return false;}
		}
	);
}
</script>
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
                    	<li><a href="#">MYPAGE</a></li>
                        <li><a href="/moneyflex/login.do">LOGIN</a></li>
                        <li><a href="/moneyflex/join_01.do">JOIN</a></li>  
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
   		<!-- 로그인 섹션 시작 -->
    	<div class="sub_container">
        	<p class="sub_navi">HOME > <span class="navi_color">LOGIN</span></p>
            <p class="sub_hdtitle">로그인</p>
            <div class="login_box">
            	<div class="login_form">
            	<form name=log_form>
                	<dl>
                        <dt style="padding-bottom:27px;">아이디</dt>
                        <dd style="padding-bottom:27px;"><input id="id" name="id" type="text" class="text_box01"></dd>
                        <p style="float:right;"><a href="#" onclick="return to_checkLogin(this.form)"><img src="<c:url value="/resources/images/btn_login.gif" />" alt="머니플렉스 로그인" title="머니플렉스 로그인" ></a></p>
                        <dt>비밀번호</dt>
                        <dd><input id="password" name="password" type="password" class="text_box01"></dd>    
                    </dl> 
                   </form>
                </div>
                <div class="search_form">
                	<dl>
                    	<dt>ID / PASSWORD</dt>
                        <dd>아이디나 비밀번호가 기억나지 않으세요?</dd>
                        <p><a href="#"><img src="<c:url value="/resources/images/btn_search.gif" />" alt="아이디/비밀번호 찾기" title="아이디/비밀번호 찾기"></a></p>
                    </dl>
                    <p class="line"></p>
                    <dl>
                    	<dt>MEMBERSHIP</dt>
                        <dd>머니플렉스 회원이 되시면 다양한 혜택이 있습니다.</dd>
                        <p><a href="join_01.do"><img src="<c:url value="/resources/images/btn_join.gif" />" alt="회원가입" title="회원가입"></a></p>
                    </dl>
                </div>
            </div>
            <div class="benefit_box">
            	<dt>머니플렉스 회원가입은 무료입니다. 머니플렉스 회원이 되시면 다양한 혜택을 누리실 수 있습니다. </dt>
                <dd>* 회원에 대한 혜택의 내용이 들어가는 첫번째 공간입니다.</dd>
                <dd>* 회원에 대한 혜택의 내용이 들어가는 두번째 공간입니다.</dd>
                <dd>* 회원에 대한 혜택의 내용이 들어가는 세번째 공간입니다.</dd>
            </div>
        </div>
    	<!-- 로그인 섹션 끝 -->
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