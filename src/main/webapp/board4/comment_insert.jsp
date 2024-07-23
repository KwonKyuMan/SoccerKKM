<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code"); //db : table 명
String uid = request.getParameter("uid");
String view_comment = request.getParameter("view_comment");

//오늘 날짜
Date today = new Date();
SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String signdate = cal.format(today);

String sql = "insert into comment values (null,'"+code+"',"+uid+",'"+session_id+"','"+session_name+"','"+view_comment+"','"+signdate+"')";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
stmt.executeUpdate(sql);
%>
<script>
	location.href="view.jsp?code=<%=code%>&uid=<%=uid%>";
</script>










