<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8"); //한글 깨짐 방지
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String pass2 = request.getParameter("name");
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

//회원수정 자리 부분
String sql = "update member set name='"+name+"',zc='"+zc+"',zc1='"+zc1+"',zc2='"+zc2+"',email='"+email+"',birth='"+birth+"',birth2='"+birth2+"',birth3='"+birth3+"',phone='"+phone+"',phone2='"+phone2+"',phone3='"+phone3+"' where id ='"+id+"'";
if(!pass.equals("")){//비밀번호 변경까지 포함
	sql = "update member set pass = '"+pass+"',pass2 = '"+pass2+"',name='"+name+"',zc='"+zc+"',zc1='"+zc1+"',zc2='"+zc2+"',email='"+email+"',birth='"+birth+"',birth2='"+birth2+"',birth3='"+birth3+"',phone='"+phone+"',phone2='"+phone2+"',phone3='"+phone3+"' where id ='"+id+"'";
}


Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
stmt.executeUpdate(sql);
response.sendRedirect("/");	//페이지 이동
%>



















