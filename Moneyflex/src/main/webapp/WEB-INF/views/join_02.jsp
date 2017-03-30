<%@page import="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MONEY</title>
<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
<script type="text/javascript">

var isValidId = false;
var inputId = "";

// 전송되는 변수
var send_name = "";
var send_id = "";
var send_passwd = "";
var send_Bday = "";
var send_gender = "";
var send_mail = "";
var send_address = "";
var send_num = ""; // 집전화
var send_Pnum = ""; // 휴대폰
var send_option1 = ""; // 회원가입경로
var send_option2 = ""; // 좋아하는 뮤지션
var send_option3 = ""; // 이용하는 힙합 커뮤니티

function to_checkID(){
	var id = document.getElementById("id").value;
	if(id.length > 3)
		ajax_checkID(id);
	else
		alert("4자리 이상의 문자로 조합된 아이디를 입력하시오.")
}
function ajax_checkID(id){

	$.ajax( 
		{
			url:'/moneyflex/checkID.do',
			type:'GET',
			data: "id=" + id,
			dataType:'json',
                        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success :function(resData){
				if(resData)
				{
					document.getElementById("id").value="";
					isValidId = false;
					inputId = "";
					alert("이미 존재하는 아이디입니다.");
				}
				else	{
					inputId = document.getElementById("id").value;
					isValidId = true;
					alert("사용 가능한 아이디입니다.");
				}
			},
			error :function(hxr, status, error){ alert("영문자로 된 ID를 입력하시오."); document.getElementById("id").value="";}
		}
	);
}

function changeEmailHost(host)
{
	var hostarea = document.getElementById("email_host");
	if( host == "직접입력")
		hostarea.value = "";
	else
		hostarea.value = host;
}

function isNum(textarea)
{
	var val = textarea.value;
	if(isNaN(val) && val.length != 0)
	{
		alert("숫자를 입력하시오.");
		textarea.value = "";
	}
		
}

function checkValidPwd()
{
	var pwd = document.getElementById("password").value;
	if ( pwd.length < 6 || !(isNaN(pwd))  || pwd.length > 12)		// 길이 제한과, 전부 숫자라면
	{
		alert("6~12자의 영문과 숫자 조합으로 작성하시오.");
		document.getElementById("password").value = "";
	}
	else
	{
		var num=0;
		for( var i = 0; i < pwd.length; i++)
		{
				if(!isNaN(pwd[i]))
					num++;
		}
		if(num == 0)	{	// 문자 조합 중 숫자가 하나도 없었다면
			alert("6~12자의 영문과 숫자 조합으로 작성하시오.");
			document.getElementById("password").value = "";
		}	
	}
}

function checkRePwd()
{
	var rePwd = document.getElementById("re_password").value;
	var originPwd = document.getElementById("password").value;
	if ( rePwd == originPwd)
		document.getElementById("passwdtext").innerHTML = "<font color=blue>비밀번호가 일치합니다.</font>";
	else
		document.getElementById("passwdtext").innerHTML = "<font color=red>비밀번호가 일치하지 않습니다.</font>";
}

function checkAllData()
{
	if( document.getElementById("name").value.length == 0 )	{
		alert("이름을 입력하시오.");
		return false;
	}
	if( document.getElementById("id").value.length == 0)	{
		alert("ID를 입력하시오.");
		return false;
	}
	if( document.getElementById("id").value != inputId || !isValidId)	{
		alert("ID 중복확인을 하십시오.");
		return false;
	}
	if( document.getElementById("password").value.length == 0 || document.getElementById("re_password").value.length == 0)	{
		alert("패스워드를 입력하시오.");
		return false;
	}
	if( document.getElementById("password").value != document.getElementById("re_password").value)	{
		alert("동일한 비밀번호를 입력하시오.");
		return false;
	}
	if( isNaN(document.bday_form.y_type.options[document.bday_form.y_type.selectedIndex].value) || isNaN(document.bday_form.m_type.options[document.bday_form.m_type.selectedIndex].value)||  isNaN(document.bday_form.d_type.options[document.bday_form.d_type.selectedIndex].value) )	{
		alert("올바른 생년월일을 선택하시오.");
		return false;
	}
	if( !document.gender_form.gender_man.checked && !document.gender_form.gender_woman.checked)	{
		alert("성별을 체크하시오.");
		return false;
	}
	if(!document.mail_form.mail_ok.checked && !document.mail_form.mail_no.checked)	{
		alert("이메일 수신 여부를 체크하십시오.");
		return false;
	}
	if((document.mail_form.email_id.value == "" || document.mail_form.email_host.value == "") && document.mail_form.mail_ok.checked)	{
		alert("이메일을 입력하시오.");
		return false;

	}

	
	send_name = document.getElementById("name").value;
	send_id = document.getElementById("id").value;
	send_passwd = document.getElementById("password").value;
	send_Bday = document.bday_form.y_type.options[document.bday_form.y_type.selectedIndex].value + "-" + document.bday_form.m_type.options[document.bday_form.m_type.selectedIndex].value + "-" + document.bday_form.d_type.options[document.bday_form.d_type.selectedIndex].value;
	send_gender = document.gender_form.gender_man.checked ? 1 : 2 ;
	send_mail = document.mail_form.mail_ok.checked ? document.mail_form.email_id.value + "@" + document.mail_form.email_host.value : "";
	send_address = document.address_form.sample4_postcode.value + "," + document.address_form.sample4_roadAddress.value + "," + document.address_form.sample4_jibunAddress.value;
	send_num = document.num_form.sms_ok.checked ? document.num_form.pnum_01.value + "-" + document.num_form.pnum_02.value +"-" +document.num_form.pnum_03.value : "";
	send_Pnum = document.num_form.sms_ok.checked ? document.num_form.spnum_01.value + "-" + document.num_form.spnum_02.value +"-"+ document.num_form.spnum_03.value : "";
	send_option1 = document.survey_form.q_01.value.length > 0 ? document.survey_form.q_01.value : "";
	send_option2 = document.survey_form.q_02.value.length > 0 ? document.survey_form.q_02.value : "";
	send_option3 = document.survey_form.q_03.value.length > 0 ? document.survey_form.q_03.value : "";
	to_send_data();
	//alert(send_name + "<br>" +send_id + "<br>" +send_passwd + "<br>" +send_Bday + "<br>" +send_gender + "<br>" +send_mail+ "<br>" +send_address + "<br>" +send_num + "<br>" +send_Pnum + "<br>" +send_option1 + "<br>" +send_option2 + "<br>" +send_option3 + "<br>");
	return true;
}

function notCall_mail(){
	if(document.mail_form.mail_ok.checked)	{
		document.mail_form.email_id.disabled = false;
		document.mail_form.email_host.disabled = false;
		document.mail_form.email_select.disabled = false;
	}	
	else if (document.mail_form.mail_no.checked)	{
		document.mail_form.email_id.value = "";
		document.mail_form.email_host.value ="";
		document.mail_form.email_id.disabled = true;
		document.mail_form.email_host.disabled = true;
		document.mail_form.email_select.disabled = true;
	}
}

function notCall_sms()	{
	if (document.num_form.sms_ok.checked)	{
		document.num_form.pnum_01.disabled = false;
		document.num_form.pnum_02.disabled = false;
		document.num_form.pnum_03.disabled = false;
		document.num_form.spnum_01.disabled = false;
		document.num_form.spnum_02.disabled = false;
		document.num_form.spnum_03.disabled = false;
	}
	else if (document.num_form.sms_no.checked)	{
		document.num_form.pnum_01.disabled = true;
		document.num_form.pnum_02.disabled = true;
		document.num_form.pnum_03.disabled = true;
		document.num_form.spnum_01.disabled = true;
		document.num_form.spnum_02.disabled = true;
		document.num_form.spnum_03.disabled = true;
		
		document.num_form.pnum_01.value = "";
		document.num_form.pnum_02.value = "";
		document.num_form.pnum_03.value = "";
		document.num_form.spnum_01.value = "";
		document.num_form.spnum_02.value = "";
		document.num_form.spnum_03.value = "";
	}
}

function to_send_data()	{
	ajax_send_data();
}

function ajax_send_data()	{
	$.ajax( 
			{
				url:'/moneyflex/send_new_member_data.do',
				type:'POST',
				data:{'name':send_name, 'id':send_id, 'pwd':send_passwd, 'bDay':send_Bday, 'gender':send_gender, 'email':send_mail, 'address':send_address, 'num':send_num, 'pNum':send_Pnum, 'qust_01':send_option1, 'qust_02':send_option2, 'qust_03':send_option3},

	            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				error :function(hxr, status, error){ alert("회원가입 정보 전송 에러:"+error); }
			}
		);
}

</script>
</head>
<body>
<% String str = "테스트"; %>
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
                        <li><a href="../moneyflex/join_01.do">JOIN</a></li>  
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
            <div class="join_box">
                <p>기본정보(필수입력사항)</p>
                <dl>
                    <dt>이름</dt>
                    <dd class="form01"><input id="name" name="이름" type="text" class="text_box02"></dd>          
                </dl>
                <dl>
                    <dt>아이디</dt>
                    <dd class="form02"><input id="id" name="id" type="text" class="text_box02"></dd>
                    <dd class="btn"><img src="<c:url value="/resources/images/btn_idcheck.gif"/>" alt="중복확인" title="중복확인" onclick="to_checkID()"></dd>
                </dl>
                <dl>
                    <dt>비밀번호</dt>
                    <dd class="form01"><input id="password" name="pwd" type="password" class="text_box02" onchange="checkValidPwd()"> <span style="padding-left:5px;">* 6~12자의 영문과 숫자의 조합</span></dd>
                </dl>
                <dl>
                    <dt>비밀번호 확인</dt>
                    <dd class="form01"><input id="re_password" name="비밀번호 확인" type="password" class="text_box02" onchange="checkRePwd()"> <span style="padding-left:5px;" id="passwdtext">* 위의 비밀번호를 한번 더 입력해주세요.</span></dd>
                </dl>
                <form name="bday_form"><dl>
                    <dt>생년월일</dt>
                    <dd class="form03"><select id="y_type" name="y_type" class="text_box03">
      <option value="select" selected="selected">년도</option>
      <%
      for(int i = 2016 ; i > 1950; i--){
             out.print("<option value='" + i + "'>");
             out.print(i);
             out.println("</option>");
      }
         %>
      </select> - <select id="m_type" name="m_type" class="text_box03">
      <option value="select" selected="selected">월</option>
      <%
      for(int i = 1 ; i < 13; i++){
             out.print("<option value='" + i + "'>");
             out.print(i);
             out.println("</option>");
      }
         %>
      </select> - <select id="d_type" name="d_type" class="text_box03">
      <option value="select" selected="selected">일</option>
      <%
      for(int i = 1 ; i < 32; i++){
             out.print("<option value='" + i + "'>");
             out.print(i);
             out.println("</option>");
      }
         %>
      </select></dd>
                    <dd class="radio pr10"></dd>
                    <dd class="radio_last"></dd>
                </dl></form>
                <form name="gender_form"><dl>
                    <dt>성별</dt>
                    <dd class="radio pl20"><input name="성별" type="radio" value="성별" id="gender_man" class="radio_box01"></dd>
                    <dd class="radio pr10">남성</dd>
                    <dd class="radio"><input name="성별" type="radio" value="성별" id="gender_woman" class="radio_box01"></dd>
                    <dd class="radio_last">여성</dd>
                </dl></form>
                <form name="mail_form" ><dl>
                    <dt>이메일</dt>
                    <dd class="form03"><input id="email_id" name="이메일1" type="text" class="text_box03" > @ <input id="email_host" name="이메일2" type="text" class="text_box03"> 
                    <select id="email_select" name="선택메뉴" onchange="changeEmailHost(this.value)" class="text_box03" style="height:32px;">
                    	<option>직접입력</option>
                        <option>naver.com</option>
                        <option>nate.com</option>
                        <option>google.com</option>
                    </select> </dd>
                    <dd class="radio"><input name="메일수신" type="radio" value="메일수신" id="mail_ok" class="radio_box01" onchange="notCall_mail()"></dd>
                    <dd class="radio pr10" style="width:50px;">메일수신</dd>
                    <dd class="radio"><input name="메일수신" type="radio" value="메일수신" id="mail_no" class="radio_box01" onchange="notCall_mail()"></dd>
                    <dd class="radio_last">메일수신안함</dd>
                </dl></form>
                <form name="address_form"><dl>
                    <dt style="height:65px;">주소</dt>
                    <dd class="form02"><input name="우편번호" type="text" class="text_box02" id="sample4_postcode" placeholder="우편번호"></dd>
                    <dd class="btn"><img src="<c:url value="/resources/images/btn_address.gif"/>" alt="우편번호 찾기" title="우편번호 찾기" onclick="sample4_execDaumPostcode()"></dd>
                    <dd style="padding-left:20px; padding-top:14px; float:left;"><input name="도로명주소" type="text" class="text_box04" id="sample4_roadAddress" placeholder="도로명주소"> - <input name="지번주소" type="text" class="text_box04" id="sample4_jibunAddress" placeholder="지번주소"></dd>
                	<span id="guide" style="color:#999"></span>
                </dl></form>
<!-- 우편번호 소스-->
                
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<!-- 우편번호 소스 끝-->
<form name="num_form">
                <dl>
                    <dt>전화번호</dt>
                    <dd class="form01"><input id="pnum_01" name="전화번호1" type="text" class="text_box03" onchange="isNum(this)"> - <input id="pnum_02" name="전화번호2" type="text" class="text_box03" onchange="isNum(this)"> - <input id="pnum_03" name="전화번호3" type="text" class="text_box03" onchange="isNum(this)"> </dd>
                </dl>
                <dl style="border-bottom:#e0e0e0 1px solid;">
                    <dt>휴대폰번호</dt>
                    <dd class="form03"><input id="spnum_01" name="휴대폰번호1" type="text" class="text_box03" onchange="isNum(this)"> - <input id="spnum_02" name="휴대폰번호2" type="text" class="text_box03" onchange="isNum(this)"> - <input id="spnum_03" name="휴대폰번호3" type="text" class="text_box03" onchange="isNum(this)"> </dd>
                     <dd class="radio"><input name="SMS수신" type="radio" id="sms_ok" class="radio_box01" onchange="notCall_sms()"></dd>
                    <dd class="radio pr10" style="width:56px;">SMS 수신</dd>
                    <dd class="radio"><input name="SMS수신" type="radio" id="sms_no" class="radio_box01" onchange="notCall_sms()"></dd>
                    <dd class="radio_last">SMS 수신안함</dd>
                </dl></form>
            </div>
            <form name="survey_form">
            <div class="join_box2">
                <p>추가정보(서비스제공)</p>
                <dl>
                    <dt>회원가입경로</dt>
                    <dd><input name="가입경로" type="text" class="text_box04" id="q_01"></dd>          
                </dl>
                <dl>
                    <dt>좋아하는 뮤지션</dt>
                    <dd><input name="뮤지션" type="text" class="text_box04" id ="q_02"></dd>          
                </dl>
                <dl style="border-bottom:#e0e0e0 1px solid;">
                    <dt>이용하는 힙합 커뮤니티</dt>
                    <dd><input name="커뮤니티" type="text" class="text_box04" id = "q_03"></dd>          
                </dl>
            </div>
            </form>
            <div class="btn_area">
            	<a href="join_03.do" onclick="return checkAllData()"><p class="member_btn01">회원가입</p></a>
                <a href="../moneyflex"><p class="member_btn02">취소</p></a>
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