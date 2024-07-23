<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/include/dbconnection.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SoccerKKM</title>
<style>
	*{
		padding:0px;
		margin:0px;
	}
	table{
		width:100%;
		border-spacing:0px;	
	}
	button{
		cursor:pointer;
	}
	a{
		text-decoration-line: none;
		color:black;
	}
	.a{
		font-size:13px;
	}
	.b{
		border-bottom:1px solid blue;
		border-top:1px solid blue;
	}
	.c{
		 font-size:16px;
		 text-align:center; 
	}
	.d{
		font-size:12px;
	}
	.e{
		font-size:13px;
		border-bottom:1px solid #ccc;
		height:30px;
	}
	#wrap {
		width: 300px;
	}
	#wrap .page {
		width:300px;
		height:20px;
		text-align: right;
		margin-bottom: 10px;
	}
	#wrap .page .page_n {
		display: inline-block;
		margin-right: 10px;
	}
	#wrap .page button {
		border: none;
		background: #666;
		color: #fff;
		width: 20px;
		height: 20px;
		line-height: 1.5;
		overflow: hidden;
	}
	#wrap .vis {
		width: 300px;
		height: 300px;
		overflow: hidden;
		text-align: left;
	}
	.nanum-pen{
	  font-family: "Nanum Pen Script", cursive;
	  font-weight: 400;
	  font-style: normal;
	  font-size:50px;
}
	.dokdo-regular {
	  font-family: "Dokdo", system-ui;
	  font-weight: 400;
	  font-style: normal;
	  color : white;
	  font-size:40px;
	  text-decoration-line:none; 
	  }
	 .workbench {
		  font-family: "Workbench", sans-serif;
		  font-optical-sizing: auto;
		  font-weight: 400;
		  font-style: normal;
		  font-variation-settings:
		    "BLED" 0,
		    "SCAN" 0;
		}
		.bungee-spice-regular {
		  font-family: "Bungee Spice", sans-serif;
		  font-weight: 400;
		  font-style: normal;
		}
		.pacifico-regular {
		  font-family: "Pacifico", cursive;
		  font-weight: 400;
		  font-style: normal;
		}
</style>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script>

	$(document).ready(function() {
		var totalNum = $(".vis > div").length // 4
		var currentNum = 1;
		$(".page_n > span:first").text(currentNum);
		$(".page_n > span:last").text(totalNum);
		$(".next_b").click(function() {
			currentNum++;
			if (currentNum > totalNum) {
				currentNum = 1;
			}
			$(".vis div:first").insertAfter(".vis div:last");
			$(".page_n > span:first").text(currentNum);
		});
		$(".prev_b").click(function() {
			currentNum--;
			if (currentNum < 1) {
				currentNum = totalNum;
			}
			$(".vis div:last").insertBefore(".vis div:first");
			$(".page_n > span:first").text(currentNum);
		});
		setInterval(function() {
			
			if (currentNum > totalNum) {
				currentNum = 1;
			}
			
			$(".vis div:first").insertAfter(".vis div:last");
			$(".page_n > span:first").text(currentNum);
			console.log("==:"+currentNum);
			currentNum++;

			console.log(currentNum);
		}, 3000);
	});
</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Workbench&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Bungee+Spice&family=Workbench&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Bungee+Spice&family=Pacifico&family=Workbench&display=swap" rel="stylesheet">

</head>
<body>
<%
String session_id = (String)session.getAttribute("id");
String session_name = (String)session.getAttribute("name");
String session_level = (String)session.getAttribute("level");
%>
	<table border=0>
		<tr>
			<td height=50 style="border-bottom:1px solid #E0E2E5"></td>
			<td class=a style="border-bottom:1px solid #E0E2E5">
				<button style="background-color:white;border:0px solid"><span style="color:red">커뮤니티</span></button> | <button style="background-color:white;border:0px solid">쇼핑몰</button>
			</td>
			<td colspan="2" style="border-bottom:1px solid #E0E2E5"></td>
			<td class=a align=right style="border-bottom:1px solid #E0E2E5">
				<button style="background-color:white;border:0px solid">새글</button> | <button style="background-color:white;border:0px solid">접속자</button>
			</td>
			<td style="border-bottom:1px solid #E0E2E5"></td>
		</tr>
		<tr>
			<td height=30 colspan="6"></td>
		</tr>
		<tr>
			<td></td>
			<td width=300 style="font-style:oblique;font-weight:bold;font-size:25px"><img src="/img/1.png" style="width:50px;height:50px"><a href="/" style="text-decoration:none;color:black">SoccerKKM</a></td>
			<form action="/search/list.jsp">
			<td width=500 height=50>
					<input name="keyword"style="background-color:#D3FFFF;border-radius:10px 0 0 10px;border:0px;width:100%;height:100%;font-size:18px;padding-left:20px">
			</td>
			<td width=60 height=50>
				<button style="border:0px;background-color:#D3FFFF;border-radius:0 10px 10px 0;height:100%"><img style="width:40px;height:40px" src="/img/2.png"></button>
			</td>
			</form>
			<td width=300 align=right class=a>
				<button style="background:linear-gradient(45deg, blue, red);border:0px solid;width:130px;height:40px;border-radius:10px"><a href="/member/join.jsp" class="dokdo-regular">회원가입</a></button>
			</td>
			<td></td>
		</tr>
	</table><br><br>
	<table border=0>
		<tr>
			<td height=50></td>
			<td class=b width=216 align=center>
				<button style="width:100%;height:50px;background-color:white;border:0px solid white;font-size:18px;font-weight:bold"><img valign=middle src="/img/8_1.jpg" style="width:40px;height:40px"><a href="/champions.jsp">챔피언스리그</a></button>
			</td>
			<td class=b width=216 align=center>
				<a style="width:100%;height:50px;background-color:white;border:0px solid white;font-size:18px;font-weight:bold" href="/board/list.jsp?code=notice"><img valign=middle src="../img/3.PNG" style="width:40px;height:40px">공지사항</a>
			</td>
			<td class=b width=216 align=center>
				<a style="width:100%;height:50px;background-color:white;border:0px solid white;font-size:18px;font-weight:bold" href="/board2/list.jsp?code=free"><img valign=middle src="../img/4.PNG" style="width:40px;height:40px">자유게시판</a>
			</td>
			<td class=b width=216 align=center>
				<a style="width:100%;height:50px;background-color:white;border:0px solid white;font-size:18px;font-weight:bold" href="/board3/list.jsp?code=gallery"><img valign=middle src="../img/5.PNG" style="width:40px;height:40px">겔러리게시판</a>
			</td>
			<td class=b width=216 align=center>
				<a style="width:100%;height:50px;background-color:white;border:0px solid white;font-size:18px;font-weight:bold" href="/board4/list.jsp?code=qna"><img valign=middle src="../img/6.PNG" style="width:40px;height:40px">QNA</a>
			</td>
			<td class=b width=90 align=right>
				<button style="width:50px;height:50px;background-color:blue;border:0px solid white"><img style="width:40px;height:40px" src="/img/8.png"></button>
				</td>
			<td></td>
		</tr>
	</table><br>