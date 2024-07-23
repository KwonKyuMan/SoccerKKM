<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>

<%
String code = request.getParameter("code"); //db : table 명
%>
<table  border=0>
	<tr>
		<td></td>
		<td width=890  valign=top>
			<table border=0 >
				<tr>
					<td style="font-size:18px;font-weight:bold;width:100%" colspan=4>자유게시판</td>
				</tr>
				<tr>
					<td height=25 colspan=4></td>
				</tr>
				<tr>
					<td style="font-size:13px" colspan=5>
					</td>
				</tr>
				<tr>
					<td height=10 colspan=4>
					</td>
				</tr>
				<tr>
					<td height=10 colspan=4 style="border-bottom:1px solid gray"></td>
				</tr>
				<tr>
					<td width=50 align=center style="padding-top:15px;padding-bottom:15px;font-size:13px;border-bottom:1px solid gray">번호</td>
					<td width=650 align=center style="font-size:13px;border-bottom:1px solid gray">제목</td>
					<td width=50 align=center style="font-size:13px;border-bottom:1px solid gray">글쓴이</td>
					<td width=50 align=center style="font-size:13px;border-bottom:1px solid gray">날짜</td>
				</tr>
				<tr>
					<td height=10 colspan=4></td>
				</tr>
				<tr> 
					<td class="e" align=center>1</td>
					<td class="e" style="font-weight:bold">가가가가가</td>
					<td class="e" align=center>1</td>
					<td class="e" align=center>1</td>
				</tr>
				<tr>
					<td class="e" align=center>2</td>
					<td class="e" style="font-weight:bold">나나나나나</td>
					<td class="e" align=center>2</td>
					<td class="e" align=center>2</td>
				</tr>
				<tr>
					<td class="e" align=center>3</td>
					<td class="e" style="font-weight:bold">다다다다다</td>
					<td class="e" align=center>3</td>
					<td class="e" align=center>3</td>
				</tr>
				<tr>
					<td class="e" align=center>4</td>
					<td class="e" style="font-weight:bold">라라라라라</td>
					<td class="e" align=center>4</td>
					<td class="e" align=center>4</td>
				</tr>
			</table>
			<table width="700" border="0">
				<tr>
					<td></td>
					<td align=right>
						<%if(session_id != null){ //로그인 후 %>
						<a href="/bbs/write.jsp?code=<%=code%>">[글쓰기]</a>
						<%}else{ %>
						[로그인 후 작성하실 수 있습니다.]
						<%} %>
					</td>
				</tr>
			</table>
			<br>
		</td>
		<td width=260  valign=top style="padding-left:20px">
				<br>
			<%@ include file="/member/login.jsp" %>
				<table style="border:2px solid black;border-radius:10px" border=0>
					<tr>
						<td width=50 height=40 align=center><img width=20 height=20 src="img/10.png"></td>
						<td width=70 align=center>날짜</td>
						<td id="ddd" style="text-align: right;padding-right:25px"></td>
					</tr>
					<tr>
						<td align=center style="border-top:3px solid Black"><img width=20 height=20 src="img/12.png"></td>
						<td style="border-top:3px solid Black" align=center>현재시간</td>
						<td height=40 style="border-top:3px solid Black;text-align: right;padding-right:40px">
							<span id="liveclock"></span>
							<script language='javascript'>
							function showDateTime(){
							  if (!document.layers&&!document.all&&!document.getElementById)
							  return
							
							  var Digital=new Date()
							  var Year=Digital.getYear()
							  var hours=Digital.getHours()
							  var minutes=Digital.getMinutes()
							  var seconds=Digital.getSeconds()
							
							  var dn="PM"
							  if (hours<12) dn="AM"
							
							  if (hours<=9)   hours='0'+hours
							  if (minutes<=9) minutes='0'+minutes
							  if (seconds<=9) seconds='0'+seconds
							  
							  myclock=""+ hours +" : "+ minutes +" : "+ seconds +""
							  
							
							  if (document.layers){
							    document.layers.liveclock.document.write(myclock)
							    document.layers.liveclock.document.close()
							  }
							  else if (document.all)
							    liveclock.innerHTML=myclock
							  else if (document.getElementById)
							    document.getElementById("liveclock").innerHTML=myclock
							    setTimeout("showDateTime()",1000)
							}
							showDateTime();
							//-->
							</script>
						</td>
					</tr>
				</table>
			</td>
			<td></td>
	</tr>
</table>
<%@ include file="/include/footer.jsp" %>