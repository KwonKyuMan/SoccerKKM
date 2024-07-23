<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code"); //db : table 명
String uid = request.getParameter("uid");
String mem_uid = request.getParameter("mem_uid"); //삭제할 자기 자신 primary key 값

String sql = "delete from comment where uid="+mem_uid;

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
stmt.executeUpdate(sql);
%>
<script>
	location.href="view.jsp?code=<%=code%>&uid=<%=uid%>";
</script>










