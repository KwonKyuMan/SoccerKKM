<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>

<%
String code = request.getParameter("code"); //db : table 명

String bbs_title = ""; //게시판 이름
if(code.equals("notice")){
	bbs_title = "공지사항";
}else if(code.equals("free")){
	bbs_title = "자유게시판";
}else if(code.equals("gallery")){
	bbs_title = "갤러리게시판";
}else if(code.equals("qna")){
	bbs_title = "Q&A게시판";
}
%>

<style>
input , textarea {
	border:1px solid #e9e9e9;
	background:#f7f7f7;
}
</style>
	<table  border=0>
	<tr>
		<td></td>
		<td width=890  valign=top align=center>
			<table width=100% height=50 border=0>
				<tr>
					<td align=center style="color:#777;font-size:14px;font-weight:bold;">[<%=bbs_title %>]_글쓰기</td>
				</tr>
			</table>
			<form method="post" action="insert.jsp" ENCTYPE="multipart/form-data">
			<input type="hidden" name="code" value="<%=code%>">
			<table width="700" border="0" cellpadding="0" cellspacing="0">
				<tr><td colspan=3 height=1 width=100% bgcolor=#d1dee2></td></tr>
				<tr>
					<td height=26>옵션</td>
					<td>
						<%if(session_level != null && session_level.equals("10")){ %>
						<input type="radio" name="gongji" value="1">공지 
						<%} %>
						<input type="radio" name="gongji" value="2" checked>일반 
						<input type="radio" name="gongji" value="3">비밀 
					</td>
				</tr>
				<tr><td colspan=3 height=1 width=100% bgcolor=#d1dee2></td></tr>
				<tr>
					<td height=26>제목</td>
					<td><input name="subject" style="height:20px;width:99%;"></td>
				</tr>
				<tr><td colspan=3 height=1 width=100% bgcolor=#d1dee2></td></tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="comment" style="height:92px;width:99%;"></textarea>
					</td>
				</tr>
				<tr><td colspan=3 height=1 width=100% bgcolor=#d1dee2></td></tr>
				<tr>
					<td>첨부</td>
					<td>
						<input type="file" name="file1">
					</td>
				</tr>
				<tr><td colspan=3 height=1 width=100% bgcolor=#d1dee2></td></tr>
			</table>
			<br>
			<table width="700" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center"><button>작성완료</button></td>
				</tr>
			</table>
			<br>
			</form>
			<br>
		</td>
		<td width=260  valign=top style="padding-left:20px">
				<br>
		<%@ include file="/member/login.jsp" %>
		</td>
		<td></td>
	</tr>
</table>
<%@ include file="/include/footer.jsp" %>