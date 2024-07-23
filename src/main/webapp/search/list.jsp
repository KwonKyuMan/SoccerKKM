<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
//검색
String keyword, sql_search;

if(request.getParameter("keyword") != null && !request.getParameter("keyword").equals("")){ //검색을 한다면
	keyword = request.getParameter("keyword");
	sql_search = " and ( subject like '%"+keyword+"%' or comment like '%"+keyword+"%' ) ";
}else{
	keyword = "";
	sql_search = "";
}

//게시판 이름
String[] bbs_name = new String[] {"notice","free","gallery","qna","winner","king","champions"};
%>

<%
//////////// 총 게시물 수 시작 ////////////
int total_record = 0;


for(int i=0; i<bbs_name.length; i++){
	String sql = "select count(*) from "+bbs_name[i]+ " where gongji != '1' "+sql_search;

	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);

	if(rs.next()){
		total_record += rs.getInt(1);
	}

	rs.close();
	stmt.close();
	con.close();
}
////////////총 게시물 수 끝 ////////////

%>
<table border=0>
	<tr>
		<td width=350></td>
		<td width=890>
			<table  border=0>
				<tr>
					<td></td>
					<td valign=top>
						<table border=0>
							<tr height=20>
							</tr>
							<tr>
								<td height=25 colspan=4></td>
							</tr>
							<tr>
								<td style="font-size:13px" colspan=5>
								</td>
							</tr>
							<tr>
								<td height=10>total : <%=total_record %></td>
							</tr>
							<tr>
								<td height=10 colspan=4 style="border-bottom:1px solid gray"></td>
							</tr>
							<tr>
								<td width=80 align=center style="padding-top:15px;padding-bottom:15px;font-size:13px;border-bottom:1px solid gray">게시판</td>
								<td width=610 align=center style="font-size:13px;border-bottom:1px solid gray">제목</td>
								<td width=50 align=center style="font-size:13px;border-bottom:1px solid gray">글쓴이</td>
								<td width=100 align=center style="font-size:13px;border-bottom:1px solid gray">날짜</td>
							</tr>
							<tr>
								<td height=10 colspan=4></td>
							</tr>
							<%
							for(int i=0; i<bbs_name.length; i++){
								String s = "select * from "+bbs_name[i]+" where gongji != '1' "+sql_search+ " order by uid desc";
				
								Connection c = DriverManager.getConnection(url, user, password);
								Statement st = c.createStatement();
								ResultSet rs2 = st.executeQuery(s);
								
								String table_name = "";
								
								if(bbs_name[i].equals("notice")) table_name = "board";
								if(bbs_name[i].equals("free")) table_name = "board2";
								if(bbs_name[i].equals("gallery")) table_name = "board3";
								if(bbs_name[i].equals("qna")) table_name = "board4";
								if(bbs_name[i].equals("winner")) table_name = "champions";
								if(bbs_name[i].equals("king")) table_name = "champions2";
								if(bbs_name[i].equals("champions")) table_name = "champions3";
								
								while(rs2.next()){
									//String signdate = rs2.getString("signdate").substring(0, 10);
									int uid = rs2.getInt("uid");
									String signdate = rs2.getString("signdate");
									signdate = signdate.substring(0, 10);
									String file1 = rs2.getString("file1");//rename 파일명
									String gongji = rs2.getString("gongji");
									String id = rs2.getString("id"); //작성자
									String subject = rs2.getString("subject");
									
									//제목 길이 ... 처리
									int len_num = subject.length();
									
									if(len_num > 30){
										subject = subject.substring(0,30) + "...";
									}else{
										subject = subject;
									}
									
									//2일전까지 최신글 처리
									java.util.Date signdate2, day2;
				
									java.util.Date today = new java.util.Date(); //현재 날짜
				
									java.util.Date day_22 = new java.util.Date(today.getTime() - (long)(1000*60*60*24*2)); //현재 날짜 - 2일
									SimpleDateFormat bbb = new SimpleDateFormat("yyyy-MM-dd"); //년-월-일 변경
									String day_2 = bbb.format(day_22); //2일전 날짜를 문자열 변수에 대입
				
									day2 = new SimpleDateFormat("yyyy-MM-dd").parse(day_2); //2일전
									signdate2 = new SimpleDateFormat("yyyy-MM-dd").parse(signdate); //작성일
								%>
								<tr> 
									<td class="e" align=center><%=bbs_name[i]%></td>
									<td class="e" style="font-size:15px">
											<%if( gongji.equals("3") ){//비밀글 %>
												<%if( session_level != null && (session_level.equals("10") || session_id.equals(id)) ){ %>
													<a href="/<%=table_name%>/view.jsp?code=<%=bbs_name[i]%>&uid=<%=uid%>"><%=subject %></a>
												<%}else{ %>
													<span onclick="alert('관리자 or 작성자만 보실 수 있습니다.')"><%=subject %></span>
												<%} %>
											<%}else{ //일반글 %>
												<a href="/<%=table_name%>/view.jsp?code=<%=bbs_name[i]%>&uid=<%=uid%>"><%=subject %></a>
											<%} %>			
								
											<%if(signdate2.getTime() >= day2.getTime()){%><img src="img/main_new.gif"><%}%>
											<%if(!file1.equals("")){%><img src="img/icon_file.gif"><%}%>
											<%if(gongji.equals("3")){//비밀글 %><img src="img/icon_secret.gif"><%} %>
									</td>
									<td class="e" align=center><%=rs2.getString("name") %></td>
									<td class="e" align=center><%=signdate %></td>
								</tr>
								<%
								}
								if(total_record == 0){
									out.print("<tr><td colspan=4 height=150 align=center>게시물이 없습니다.</td></tr>");
								}
							}
							%>
						</table>
					</td>
				</tr>
			</table>
		</td>
		<td valign=top>
			<table>
				<tr>
					<br>
					<td width = 45></td>
					<td><%@ include file="/member/login.jsp" %></td>
				</tr>
			</table>
		</td>
		<td width=350></td>
	</tr>
</table>
				
<%@ include file="/include/footer.jsp" %>