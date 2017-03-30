<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
<script type="text/javascript">
jQuery.noConflict();
var jq$ = jQuery;
</script>
<script type="text/javascript">

var time = new Date();							// 동적 날짜 받아오기.
var year=time.getFullYear();						// 동적 년도 전역변수
var month=time.getMonth()+1;				// 동적 달 전역변수
var totalDaysOfMonth = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30 ,31, 30, 31];
totalDaysOfMonth[2] = ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) ? 29 : 28;

$(document).ready(function()	{
	year = month==12? year+1 : year ;
	month = month==12? 1 : month+1;
	to_prev();
});

// Next 버튼 함수 영역
function to_next(){
	ajax_next();
}
function ajax_next(){
	var usrYear = year;
	var usrMonth = month;
	usrYear = usrMonth==12? usrYear+1 : usrYear ;
	usrMonth = usrMonth==12? 1 : usrMonth+1;
	$.ajax( 
		{
			url:'/moneyflex/calender.do',
			type:'POST',
			data:{'year':usrYear, 'month':usrMonth},
			dataType:'json',
                        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success :function(resData){
				year = usrYear;;
				month = usrMonth;
				totalDaysOfMonth[2] = ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) ? 29 : 28;

				var tagStr="";
				var count=0;
				var week=0;
				var totalWeek=0;
				var days=1;			//1일부터 시작
				
				tagStr += "<div class=\"schedule\">";
				tagStr += "<p class=\"ph2\">" + "Schedule" + "</p>";
				tagStr += "<p class=\"section_line\"></p>";
				tagStr += "<div class=\"date_control\">";
				tagStr += "<ol><li><a href=\"#section_04\" onclick=\"to_prev()\"><img src=\"${pageContext.request.contextPath}/resources/images/btn_prev.gif\" alt=\"스케줄 이전 버튼\" title=\"스케줄 이전 버튼\" /></a></li>";
				tagStr += "<li class=\"date\">" + year + "년 " + month+"월" + "</li>"; 
				tagStr += "<li><a href=\"#section_04\" onclick=\"to_next()\"><img src=\"${pageContext.request.contextPath}/resources/images/btn_next.gif\" alt=\"스케줄 다음 버튼\" title=\"스케줄 다음 버튼\" /></a></li></ol></div>";
				tagStr += "<table width=\"100%\" border=\"0\" cellspacing\"1\" cellpadding=\"0\" class=\"table_schedule\">";
				tagStr += "<tr><th><span class=\"sun_color\">일요일</span></th>";
				tagStr += "<th>월요일</th><th>화요일</th><th>수요일</th><th>목요일</th><th>금요일</th><th>토요일</th></tr>";
					
				for(i=0; i<year; i++)
				{
					if((i%4==0 && i%100!=0) || (i % 400 == 0))
					{
						if(i!=0)	//0년은 윤년에서 제외한다.
						count++;
					}
				}
				var totalDays=365*year + count;
				for(i=1; i<month; i++)
				{
					totalDays += totalDaysOfMonth[i];
				}
				var blankBack = totalDays%7;
				tagStr += "<tr>";		// 달력 출력 시작
				for(i=1; i<=blankBack; i++)
				{
					tagStr += "<td><table class=\"td_table\"><tr><td class=\"past\">" + (totalDaysOfMonth[month-1] - blankBack + i) + "</td></tr></table></td>";
					week++;
				}			// 저번 달 출력
				for(i=0; i<resData.length; i++)		// 1일 ~ 마지막 날
				{
					if(week == 7)	{
						tagStr += "</tr><tr>";		// 개행
						week = 0;
						totalWeek++;
					}
					tagStr += "<td><table class=\"td_table\"><tr><td class=\"day\">" + days +"</td></tr>"
					tagStr += "<tr><td class=\"task\">";
					var smList = resData[i];
					var smSize = smList.length;
					for(j=0; j<smSize; j++)	{
						tagStr += smList[j] + "<br>";		//일정 하나 출력 후 개행
					}
					tagStr += "</td></tr></table></td>";
					week++;
					days++;
				}

				var total_days_print = week > 0 ? (totalWeek+1) * 7 : totalWeek*7;
				for(i=1; i <= (total_days_print - (blankBack + totalDaysOfMonth[month])); i++)
				{
							tagStr += "<td><table class=\"td_table\"><tr><td class=\"past\">" + i + "</td></tr></table></td>";
							if ( i == (total_days_print - (blankBack + totalDaysOfMonth[month])))
							{
								tagStr += "</tr>";		
							}
				}		// 다음 달 출력
				tagStr += "</table></div>"		//끝
				var v = document.getElementById("view");
				v.innerHTML = tagStr;
				
			},
			error :function(hxr, status, error){ alert("달력 로딩 에러:"+error); }
		}
	);
}
//Prev 버튼 함수 영역
function to_prev(){
	ajax_prev();
}
function ajax_prev(){
	var usrYear = year;
	var usrMonth = month;
	usrYear = usrMonth==1? usrYear-1 : usrYear ;
	usrMonth = usrMonth==1? 12 : usrMonth-1;
	$.ajax( 
		{
			url:'/moneyflex/calender.do',
			type:'POST',
			data:{'year':usrYear, 'month':usrMonth},
			dataType:'json',
                        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success :function(resData){
				year = usrYear;;
				month = usrMonth;
				totalDaysOfMonth[2] = ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) ? 29 : 28;
				var tagStr="";
				var count=0;
				var week=0;
				var totalWeek=0;
				var days=1;			//1일부터 시작
				
				tagStr += "<div class=\"schedule\">";
				tagStr += "<p class=\"ph2\">" + "Schedule" + "</p>";
				tagStr += "<p class=\"section_line\"></p>";
				tagStr += "<div class=\"date_control\">";
				tagStr += "<ol><li><a href=\"#section_04\" onclick=\"to_prev()\"><img src=\"${pageContext.request.contextPath}/resources/images/btn_prev.gif\" alt=\"스케줄 이전 버튼\" title=\"스케줄 이전 버튼\" /></a></li>";
				tagStr += "<li class=\"date\">" + year + "년 " + month+"월" + "</li>"; 
				tagStr += "<li><a href=\"#section_04\" onclick=\"to_next()\"><img src=\"${pageContext.request.contextPath}/resources/images/btn_next.gif\" alt=\"스케줄 다음 버튼\" title=\"스케줄 다음 버튼\" /></a></li></ol></div>";
				tagStr += "<table width=\"100%\" border=\"0\" cellspacing\"1\" cellpadding=\"0\" class=\"table_schedule\">";
				tagStr += "<tr><th><span class=\"sun_color\">일요일</span></th>";
				tagStr += "<th>월요일</th><th>화요일</th><th>수요일</th><th>목요일</th><th>금요일</th><th>토요일</th></tr>";
						
				for(i=0; i<year; i++)
				{
					if((i%4==0 && i%100!=0) || (i % 400 == 0))
					{
						if(i!=0)	//0년은 윤년에서 제외한다.
						count++;
					}
				}
				var totalDays=365*year + count;
				for(i=1; i<month; i++)
				{
					totalDays += totalDaysOfMonth[i];
				}
				var blankBack = totalDays%7;
				tagStr += "<tr>";		// 달력 출력 시작
				for(i=1; i<=blankBack; i++)
				{
					tagStr += "<td><table class=\"td_table\"><tr><td class=\"past\">" + (totalDaysOfMonth[month-1] - blankBack + i) + "</td></tr></table></td>";
					week++;
				}			// 저번 달 출력
				for(i=0; i<resData.length; i++)		// 1일 ~ 마지막 날
				{
					if(week == 7)	{
						tagStr += "</tr><tr>";		// 개행
						week = 0;
						totalWeek++;
					}
					tagStr += "<td><table class=\"td_table\"><tr><td class=\"day\">" + days +"</td></tr>"
					tagStr += "<tr><td class=\"task\">";
					var smList = resData[i];
					var smSize = smList.length;
					for(j=0; j<smSize; j++)	{
						tagStr += smList[j] + "<br>";		//일정 하나 출력 후 개행
					}
					tagStr += "</td></tr></table></td>";
					week++;
					days++;
				}

				var total_days_print = week > 0 ? (totalWeek+1) * 7 : totalWeek*7;
				for(i=1; i <= (total_days_print - (blankBack + totalDaysOfMonth[month])); i++)
				{
							tagStr += "<td><table class=\"td_table\"><tr><td class=\"past\">" + i + "</td></tr></table></td>";
							if ( i == (total_days_print - (blankBack + totalDaysOfMonth[month])))
							{
								tagStr += "</tr>";		
							}
				}		// 다음 달 출력
				tagStr += "</table></div>"		//끝
				var v = document.getElementById("view");
				v.innerHTML = tagStr;
			},
			error :function(hxr, status, error){ alert("달력 로딩 에러:"+error); }
		}
	);
}
</script>
</head>
<body>
<div id="view">
<!--  달력 들어가는 부분 -->
</div>
</body>
</html>