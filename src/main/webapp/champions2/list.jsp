<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
String code = request.getParameter("code"); //db : table 명

//검색
String field, search, sql_search;

if(request.getParameter("search") != null && !request.getParameter("search").equals("")){ //검색을 한다면
	field = request.getParameter("field");
	search = request.getParameter("search");
	sql_search = " and "+field+" like '%"+search+"%'";
}else{
	field = "";
	search = "";
	sql_search = "";
}

//게시판 이름
String bbs_title = ""; 
if(code.equals("notice")){
	bbs_title = "공지사항";
}else if(code.equals("free")){
	bbs_title = "자유게시판";
}else if(code.equals("gallery")){
	bbs_title = "갤러리게시판";
}else if(code.equals("qna")){
	bbs_title = "Q&A게시판";
}else if(code.equals("winner")){
	bbs_title = "우승팀";
}else if(code.equals("king")){
	bbs_title = "득점왕";
}
%>

<%
//////////// 총 게시물 수 시작 ////////////
String sql = "select count(*) from "+code+ " where gongji != '1'"+sql_search;

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

int total_record = 0; 
if(rs.next()){
	total_record = rs.getInt(1);
}

rs.close();
stmt.close();
con.close();
////////////총 게시물 수 끝 ////////////

//페이징 관련
int page_now = 1;

if(request.getParameter("page_now") != null){
	page_now = Integer.parseInt(request.getParameter("page_now")); //현재 페이징 수
}


int num_per_page = 8; //한 페이지당 출력 게시물 수
int page_per_block = 10; //한 블럭당 출력 링크 수
int total_page = (int)Math.ceil(total_record / (double)num_per_page); //총 페이지 수
int first = num_per_page * (page_now - 1); //limit 시작 값
%>

<table  border=0>
	<tr>
		<td></td>
		<td width=890  valign=top>
			<table border=0>
				<tr height=20>
				</tr>
				<tr>
					<td style="font-size:18px;font-weight:bold;width:100%" colspan=4><%=bbs_title%></td>
				</tr>
				<tr>
					<td height=25 colspan=4></td>
				</tr>
				<tr>
					<td style="font-size:13px" colspan=4>
					</td>
				</tr>
				<tr>
					<td height=10>total : <%=total_record %>
					</td>
					<td align="right" colspan=3>
						<form action="list.jsp" method="get">
						<input type="hidden" name="code" value="<%=code%>">
						<select name="field" style="height:20px;">
							<option value='subject' <%if(field.equals("subject")){%>selected<%}%>>제목</option>
							<option value='comment' <%if(field.equals("comment")){%>selected<%}%>>내용</option>
							<option value='name' <%if(field.equals("name")){%>selected<%}%>>글쓴이</option>
						</select> 
						<input name="search" value="<%=search %>" style="height:16px;width:150px"> 
						<button>검색</button>
						</form>
					</td>
				</tr>
				<tr>
					<td height=10 colspan=4 style="border-bottom:1px solid gray"></td>
				</tr>
				<tr>
					<td align=center style="padding-top:15px;padding-bottom:15px;font-size:18px;border-bottom:1px solid gray;font-weight:bold" colspan=4>시즌 별 득점왕</td>
				</tr>
				<tr>
					<td height=10 colspan=4></td>
				</tr>
				<%
				//공지글
				String sql_notice = "select * from "+code+" where gongji='1'";
				
				Connection con_notice = DriverManager.getConnection(url, user, password);
				Statement stmt_notice = con_notice.createStatement();
				ResultSet rs_notice = stmt_notice.executeQuery(sql_notice);
				
				while(rs_notice.next()){
					//String signdate = rs2.getString("signdate").substring(0, 10);
					int uid = rs_notice.getInt("uid");
					String signdate = rs_notice.getString("signdate");
					signdate = signdate.substring(0, 10);
					String file1 = rs_notice.getString("file1");//rename 파일명
					String subject = rs_notice.getString("subject");
					
					//제목 길이 ... 처리
					int len_num = subject.length();	
					if(len_num > 30){
						subject = subject.substring(0,30) + "...";
					}
				%>
					<tr height=22 bgcolor="white" style="font-size:16px">
						<td class="e" align=center style="color:red">[공지]</td>
						<td class="e" colspan=2>
							1111<a style="color:pink;font-weight:bold;font-size:16px" href="view.jsp?code=<%=code%>&uid=<%=uid%>&page_now=<%=page_now%>"><%=subject %></a>
							<%if(!file1.equals("")){%><img src="img/icon_file.gif"><%}%>
						</td>
						<td class="e" align=center>관리자</td>
						<td class="e" align=center><%=signdate%></td>
					</tr>
				<%
				}
				%>
				<%
				String s = "select * from "+code+" where gongji != '1' "+sql_search+" order by uid desc limit "+first+","+num_per_page;

				Connection c = DriverManager.getConnection(url, user, password);
				Statement st = c.createStatement();
				ResultSet rs2 = st.executeQuery(s);
				
				int num = total_record - ((page_now - 1) * num_per_page); //넘버링 처리
				int i = 0; //tr 태그 열고 닫기
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
					//썸네일 파일명
					String file1_s = rs2.getString("file1_s");
					%>
					<%if(i % 4 == 0){ %>
					<tr height=210>
					<%} %>
						<td width=175>
							<table width=100%>
								<tr>
									<td align=center><a href="view.jsp?code=<%=code%>&uid=<%=uid%>&page_now=<%=page_now%>"><img src="/upload/<%=file1_s%>" width=200 height=200></a></td>
								</tr>
							</table>
							<table>
								<tr>
									<td align =center><a href="view.jsp?code=<%=code%>&uid=<%=uid%>&page_now=<%=page_now%>" style="color:red;font-weight:bold;font-size:16px"><%=subject %></a></td>
								</tr>
								<tr height=30></tr>
							</table>
						</td>
					<%if(i % 4 == 3){ %>
					</tr>
					<tr><td colspan=5 style="border-top:1px solid #e5ecef"></td></tr>
					<%} %>	
				<%
					num--;
					i++;
				}
				
				if(i % 4 == 1){
					out.print("<td width=175></td><td width=175></td><td width=175></td></tr>");
					out.print("<tr><td colspan=5 style='border-top:1px solid #e5ecef'></td></tr>");
				}
				if(i % 4 == 2){
					out.print("<td width=175></td><td width=175></td></tr>");
					out.print("<tr><td colspan=5 style='border-top:1px solid #e5ecef'></td></tr>");
				}
				if(i % 4 == 3){
					out.print("<td width=175></td></tr>");
					out.print("<tr><td colspan=5 style='border-top:1px solid #e5ecef'></td></tr>");
				}
				%>
				
				<%
				if(total_record == 0){
					out.print("<tr><td colspan=4 height=150 align=center>게시물이 없습니다.</td></tr>");
				}
				%>
			</table>
			<br>
			<table width="700" border="0">
				<tr>
					<td width=20></td>
					<td width=450>
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
						<style>
							.page_on {
								padding:0px 10px;
								color:red;
								border:1px solid red;
								font-weight:bold;
							}
							.page_off {
								padding:0px 10px;
								color:black;
								border:1px solid black;
							}
						</style>
						
						<%
						// 페이징 처리 시작 /////////////////////////////
						int total_block = 0;
						int block = 0;
						int first_page = 0;
						int last_page = 0;
						int direct_page = 0;
						int my_page = 0;
						
						total_block = (int)Math.ceil(total_page / (double)page_per_block); //총 블럭 수
						block = (int)Math.ceil(page_now / (double)page_per_block); //현재 블럭
						first_page = (block - 1) * page_per_block; //블럭내 시작하는 수
						last_page = block * page_per_block; //블럭내 끝나는 수
						
						if(total_block <= block) { //마지막 블럭일 때
							last_page = total_page; //반복문 변수 처리
						}
						
						
						// 이전 블럭 처리			
						if(block != 1){ //첫 블럭이 아니라면
						%>
							<a href="list.jsp?code=<%=code%>&field=<%=field%>&search=<%=search%>&page_now=<%=first_page%>"><img src="img/btn_left.gif"></a>&nbsp;&nbsp;
						<%
						}
						
						// 블럭내 페이지 수 출력 
						for(direct_page = first_page + 1; direct_page <= last_page; direct_page++){
							if(page_now == direct_page){
						%>
								<span class="page_on"><%=direct_page%></span>&nbsp;
						<%
							}else{
						%>
								<span class="page_off"><a href="list.jsp?code=<%=code%>&field=<%=field%>&search=<%=search%>&page_now=<%=direct_page%>"><%=direct_page%></a></span>&nbsp;
						<%
							}
						}
							
						// 다음 블럭 처리
						if(block < total_block) { //다음 블럭 존재
						%>
							&nbsp;<a href="list.jsp?code=<%=code%>&field=<%=field%>&search=<%=search%>&page_now=<%=last_page + 1%>"><img src="img/btn_right.gif"></a>
						<%
						}
						//페이징 처리 끝 /////////////////////////////			
						%>
								
								</td>
							</tr>
						</table>
					</td>
					<td align=right width=200>
						<%if(session_id != null && session_level.equals("10")){ //로그인 후 %>
						<a href="/champions2/write.jsp?code=<%=code%>">[글쓰기]</a>
						<%}else{ %>
						[관리자만 작성하실 수 있습니다.]
						<%} %>
					</td>
				</tr>
			</table>
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