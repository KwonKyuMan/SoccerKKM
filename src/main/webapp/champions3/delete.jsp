<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code");
String uid = request.getParameter("uid");

//작성자
String sql_id = "select * from "+code+" where uid="+uid;
Connection conn_id=DriverManager.getConnection(url, user, password); 
Statement stmt_id=conn_id.createStatement();
ResultSet rs_id = stmt_id.executeQuery(sql_id);

String bbs_id = ""; //작성자 아이디
if(rs_id.next()){
	bbs_id = rs_id.getString("id");
}

rs_id.close();
stmt_id.close();
conn_id.close();

if(session_level != null && (session_level.equals("10") || session_id.equals(bbs_id)) ){
	//디비 삭제
	String sql = "delete from "+code+" where uid="+uid;

	Connection conn=DriverManager.getConnection(url, user, password); 
	Statement stmt=conn.createStatement();
	stmt.executeUpdate(sql);

	stmt.close();
	conn.close();

	response.sendRedirect("list.jsp?code="+code);
}else{
%>
	<script>
		alert("작성자만 삭제 가능합니다.");
		history.back();
	</script>
<%
}
%>












