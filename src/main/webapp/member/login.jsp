<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<%
String session_id1 = (String)session.getAttribute("id");
String session_name1 = (String)session.getAttribute("name");
%>
<table style="border:2px solid black;border-radius:10px">
	<%
	if(session_id1 != null){//로그인 후 
	%>
	<tr>
		<td height=30 colspan="4"></td>
	</tr>
	<tr>
		<td width=30 height=50></td>
		<td width=100 align=center colspan=2 valign=bottom style="color:black;font-size:20px;font-weight:bold"><span><%=session_name1%>님<br></span>환영합니다!</td>
		<td width=30></td>
	</tr>
	<tr>
		<td height=30 colspan="4"></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2" align=center style="width:200px;height:30px;background-color:#7CB6FA;;border:1px solid black;border-radius:10px 10px 0 0;"><a style="text-decoration-line:none;color:white" href="/member/joinup.jsp">회원수정</a></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2" align=center style="width:200px;height:30px;background-color:#3A8AFD;border:1px solid black;border-radius:0 0 10px 10px;"><a style="color:white;text-decoration-line:none " href="/member/logout.jsp">로그아웃</a></td>
		<td></td>
	</tr>
	
	<%
	}else{//로그인 전
	%>
	<form action="/member/login_update.jsp" method="post">
	<tr>
		<td width=30 height=50></td>
		<td width=100 align=center colspan=2 valign=bottom style="color:black;font-size:20px;font-weight:bold">로그인</td>
		<td width=30></td>
	</tr>
	<tr>
		<td height=30 colspan="4"></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2"><input name="id" placeholder="아이디" style="width:200px;height:30px"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2"><input name="pass" placeholder="비밀번호" style="width:200px;height:30px" type="password"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2"><button style="width:204px;height:30px;background-color:#3A8AFD;color:white">로그인</button></td>
		<td></td>
	</tr>
	</form>
	<%			
	}
	%>
	</tr>
	<tr>
		<td height=20 colspan=4></td>
	</tr>
</table><br>

<table style="border:2px solid black;border-radius:10px" border=0>
					<tr>
						<td width=50 height=40 align=center><img width=20 height=20 src="/img/10.png"></td>
						<td width=70 align=center>날짜</td>
						<td id="ddd" style="text-align: right;padding-right:25px"></td>
					</tr>
					<tr>
						<td align=center style="border-top:3px solid Black"><img width=20 height=20 src="/img/12.png"></td>
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
