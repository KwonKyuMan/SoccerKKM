<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>champions</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
</head>
<style>
	.single-day-regular {
						  font-family: "Single Day", cursive;
						  font-weight: 400;
						  font-style: normal;
						}
	
</style>
<body style="background-image:url('/img/8_3.jpeg');background-size:cover">
	<table border = 0 width=1500 align=center>
		<tr>
			<td align=center><a href="/"><img style="border-radius:20px"height=200 src="/img/8_2.PNG"></a></td>
		</tr>
	</table>
	<br><br>
	<table border = 0 width=600 align=center>
		<tr>
			<td width=250 height=250 align=right>
				<a href="/champions/list.jsp?code=winner"><button style="width:250px;height:250px;font-size:45px;background-color:#A3D591;color:white;border:0px solid;border-radius:20px" class="single-day-regular">역대 챔피언스 리그 우승팀</button></a>
			</td>
			<td width=100></td>
			<td width=250>
				<a href="/champions2/list.jsp?code=king"><button style="width:250px;height:250px;font-size:45px;background-color:#A3D591;color:white;border:0px solid;border-radius:20px" class="single-day-regular">역대 챔피언스 리그 득점왕</button></a>
			</td>
		</tr>
		<tr height=100></tr>
		<tr>
			<td width=250 height=250 align=right>
				<a href="/league.jsp"><button style="width:250px;height:250px;font-size:45px;background-color:#A3D591;color:white;border:0px solid;border-radius:20px" class="single-day-regular">결과/일정</button></a>
			</td>
			<td width=100></td>
			<td width=250>
				<a href="/champions3/list.jsp?code=champions"><button style="width:250px;height:250px;font-size:45px;background-color:#A3D591;color:white;border:0px solid;border-radius:20px" class="single-day-regular">챔스 게시판</button></a>
			</td>
		</tr>
	</table>
</body>
</html>