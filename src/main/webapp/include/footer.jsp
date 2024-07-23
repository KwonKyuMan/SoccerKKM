<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<table border=0><br><br>
		<tr>
			<td height=70 width=350></td>
			<td width=600 style="border-top:1px solid gray;font-weight:bold" colspan=2 align=center>게시판</td>
			<td width=600 style="border-top:1px solid gray;font-weight:bold" colspan=2 align=center>대표</td>
			<td width=350></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<table>
					<tr>
						<td class="a" align=center width=170><a style="text-decoration-line:none;color:black" href="/board/list.jsp?code=notice">공지사항</a></td>
					</tr>
					<tr>
						<td class="a" align=center><a style="text-decoration-line:none;color:black" href="/board2/list.jsp?code=free">자유게시판</a></button></td>
					</tr>
				</table>
			</td>
			<td>
				<table>
					<tr>
						<td class="a" align=center width=170><a style="text-decoration-line:none;color:black" href="/board3/list.jsp?code=gallery">갤러리게시판</a></td>
					</tr>
					<tr>
						<td class="a" align=center><a style="text-decoration-line:none;color:black" href="/board4/list.jsp?code=qna">QnA게시판</a></td>
					</tr>
				</table>
			</td>
			<td>
				<table>
					<tr>
						<td class="a" width=170>대표 : 권규만</td>
					</tr>
					<tr>
						<td class="a">주소 : 부산광역시 북구 의성로 47번길 42</td>
					</tr>
				</table>
			</td>
			<td>
				<table>
					<tr>
						<td class="a" width=170>메일 : rbaks1461@naver.com</td>
					</tr>
					<tr>
						<td class="a">번호 : 010-2462-1461</td>
					</tr>
					</tr>
				</table>
			</td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td height=20 colspan="4" style="border-bottom:1px solid gray"></td>
			<td></td>
		</tr>
		<tr>
			<td height=20 colspan="6">
		</tr>
		<tr>
			<td colspan="6" align=center style="font-size:10px">Copyright © SoccerKKM . All rights reserved.</td>
		</tr>
	</table>
</body>
<script>
	var today = new Date();
	const days = ["일","월","화","수","목","금","토"];
	var year = today.getFullYear(); 
	var month = today.getMonth() + 1
	var date = today.getDate(); // 일
	var day = days[today.getDay()];
	
	document.getElementById('ddd').innerHTML = year + '-' + month + '-' + date + " ("+day+")";
</script>
</html>