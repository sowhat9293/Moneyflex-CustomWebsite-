<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
<script type="text/javascript">
jQuery.noConflict();
var jq$ = jQuery;
</script>
<script type="text/javascript">

var totalPageNum = 0;
var currentPageNum = 1;

$(document).ready(function()	{
	currentPageNum -= 1;
	to_nextNews();
	to_getTotalNum();
});

function to_getTotalNum()	{
	$.ajax( 
			{
				url:'/moneyflex/newsload.do',
				type:'POST',
				dataType:'json',
	                        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				success :function(resData){
					totalPageNum = Math.floor(resData.pnum/3);
					if(resData.pnum % 3 != 0)
						totalPageNum++;
				},
				error :function(hxr, status, error){ alert("로딩 에러:"+error); }
			}
		);
}


function to_nextNews(){
	ajax_nextNews();
}
function ajax_nextNews(){
	var usrPageNum = currentPageNum+1;
	$.ajax( 
		{
			url:'/moneyflex/news.do',
			type:'POST',
			data:{'pnum':usrPageNum},
			dataType:'json',
                        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success :function(resData){
				currentPageNum += 1;	
				var tStr = "";
				tStr += "<div class=\"news_area\"><p class=\"ph2\">News</p><p class=\"section_line\"></p><div>";
				if( currentPageNum == 1)
				{
					tStr += "<p class=\"news_lbtn\"><a href=\"#section_03\" onclick=\"to_prevNews()\"></a>";
				}
				else	{
					tStr += "<p class=\"news_lbtn\"><a href=\"#section_03\" onclick=\"to_prevNews()\"><img src=\"${pageContext.request.contextPath}/resources/images/left_arrow.gif\" /></a>";
				}
				tStr += "<div class=\"news_box\">";
				var newsSize = resData.length;
				for(i=0; i<newsSize; i++)	{
					var smNews = resData[i];
					tStr += "<div class=\"news_content\"><dl><dt><span class=\"news_color"+smNews[1] +"\">";
					var cate ="";
					switch(smNews[1]){
					case "1" :	cate = "공지사항"; break;
					case "2" :  cate = "파티소식"; break;
					case "3" : cate = "공연소식"; break;
					default : cate = "그 외"; break;
					}
					tStr += cate + "</span></dt><dd class=\"title\">"+smNews[3] +"</dd>";
					tStr += "<dd class=\"image\"><a href=\"#\"><img src=\"${pageContext.request.contextPath}/resources/images/news/" + smNews[2] + "\" /></a></dd>";
					tStr += "<dd class=\"text\">" + smNews[4] + "</dd>";
					tStr += "<dd class=\"date\">" + smNews[5] + "</dd>";
					tStr += "<dd class=\"more\"><a href=\"#\" class=\"news_more\">" + "MORE +" + "</a></dd><</dl></div>";
				}
				tStr += "</div>";
				if (currentPageNum == totalPageNum)	{
					tStr += "<p class=\"news_rbtn\"><a href=\"#section_03\" onclick=\"to_nextNews()\"></a>";
				}
				else	{
					tStr += "<p class=\"news_rbtn\"><a href=\"#section_03\" onclick=\"to_nextNews()\"><img src=\"${pageContext.request.contextPath}/resources/images/right_arrow.gif\" /></a>";
				}
				tStr += "</div></div>";			// 끝
				var v = document.getElementById("view2");
				v.innerHTML = tStr;
			},
			error :function(hxr, status, error){ alert("로딩 에러:"+error); }
		}
	);
}

function to_prevNews(){
	ajax_prevNews();
}
function ajax_prevNews(){
	var usrPageNum = currentPageNum-1;
	$.ajax( 
			{
				url:'/moneyflex/news.do',
				type:'POST',
				data:{'pnum':usrPageNum},
				dataType:'json',
	                        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				success :function(resData){
					currentPageNum -= 1;	
					var tStr = "";
					tStr += "<div class=\"news_area\"><p class=\"ph2\">News</p><p class=\"section_line\"></p><div>";
					if( currentPageNum == 1)
					{
						tStr += "<p class=\"news_lbtn\"><a href=\"#section_03\" onclick=\"to_prevNews()\"></a>";
					}
					else	{
						tStr += "<p class=\"news_lbtn\"><a href=\"#section_03\" onclick=\"to_prevNews()\"><img src=\"${pageContext.request.contextPath}/resources/images/left_arrow.gif\" /></a>";
					}
					tStr += "<div class=\"news_box\">";
					var newsSize = resData.length;
					for(i=0; i<newsSize; i++)	{
						var smNews = resData[i];
						tStr += "<div class=\"news_content\"><dl><dt><span class=\"news_color"+smNews[1] +"\">";
						var cate ="";
						switch(smNews[1]){
						case "1" :	cate = "공지사항"; break;
						case "2" :  cate = "파티소식"; break;
						case "3" : cate = "공연소식"; break;
						default : cate = "그 외"; break;
						}
						tStr += cate + "</span></dt><dd class=\"title\">"+smNews[3] +"</dd>";
						tStr += "<dd class=\"image\"><a href=\"#\"><img src=\"${pageContext.request.contextPath}/resources/images/news/" + smNews[2] + "\" /></a></dd>";
						tStr += "<dd class=\"text\">" + smNews[4] + "</dd>";
						tStr += "<dd class=\"date\">" + smNews[5] + "</dd>";
						tStr += "<dd class=\"more\"><a href=\"#\" class=\"news_more\">" + "MORE +" + "</a></dd><</dl></div>";
					}
					tStr += "</div>";
					if (currentPageNum == totalPageNum)	{
						tStr += "<p class=\"news_rbtn\"><a href=\"#section_03\" onclick=\"to_nextNews()\"></a>";
					}
					else	{
						tStr += "<p class=\"news_rbtn\"><a href=\"#section_03\" onclick=\"to_nextNews()\"><img src=\"${pageContext.request.contextPath}/resources/images/right_arrow.gif\" /></a>";
					}
					tStr += "</div></div>";			// 끝
					var v = document.getElementById("view2");
					v.innerHTML = tStr;
				},
				error :function(hxr, status, error){ alert("로딩 에러:"+error); }
			}
	);
}
</script>
</head>
<body>
<div id ="view2">
<!--  뉴스 들어가는 부분 -->

</div>
</body>
</html>