<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/dbconnection.jsp" %>

<%
request.setCharacterEncoding("utf-8"); //한글 깨짐 방지
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String zc = request.getParameter("zipcode");
String zc1 = request.getParameter("zipcode1");
String zc2 = request.getParameter("zipcode2");
String email = request.getParameter("email");
String birth = request.getParameter("birth");
String birth2 = request.getParameter("birth2");
String birth3 = request.getParameter("birth3");
String phone3 = request.getParameter("phone3");
String phone = request.getParameter("phone");
String phone2 = request.getParameter("phone2");
String s = "select count(*) from member where id = '"+id+"'";
Connection c = DriverManager.getConnection(url, user, password);
Statement st = c.createStatement();
ResultSet rs = st.executeQuery(s);

int num = 0;
if(rs.next()){
	num=rs.getInt(1);
}
rs.close();
st.close();
c.close();
if( num == 1){
%>
<script>
	alert("아이디가 존재합니다. \n다른 아이디를 이용하세요.")
	history.back();
</script>
<%
}else{
	String sql = "insert into member values ('"+id+"','"+pass+"','"+name+"','"+zc+"','"+zc1+"','"+zc2+"','"+email+"','"+birth+"','"+birth2+"','"+birth3+"','"+phone3+"','"+phone+"','"+phone2+"','1')";

	Connection conn = DriverManager.getConnection(url, user, password);
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	
	stmt.close();
	conn.close();

	
	response.sendRedirect("/");	
}
%>