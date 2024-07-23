<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
String uploadPath="C:\\jsp\\test\\src\\main\\webapp\\upload";
int size = 10*1024*1024;

request.setCharacterEncoding("utf-8");

MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());

String code = multi.getParameter("code");
String uid = multi.getParameter("uid");
String page_now = multi.getParameter("page_now");
String gongji = multi.getParameter("gongji");
String subject = multi.getParameter("subject");
String comment = multi.getParameter("comment");

//이스케이프 처리
subject = subject.replaceAll("'", "''" ); //좌측의 값을 우측의 값으로 치환
comment = comment.replaceAll("'", "''" );

//오늘 날짜
Date today = new Date();
SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String signdate = cal.format(today);

//첨부파일1
Enumeration files=multi.getFileNames();

String file1=(String)files.nextElement(); //첨부파일1 존재한다면
String file1_name=multi.getOriginalFileName(file1); //사용자가 올린 파일명
String file1_rename=multi.getFilesystemName(file1); //중복된 파일명을 새로운 파일명으로 변경
String file1_thumb=multi.getFilesystemName(file1);

if(file1_name == null){ //첨부파일1 없다면
	file1_name = ""; //null 값이 아닌 비어있는 값으로 대체
	file1_rename = ""; //null 값이 아닌 비어있는 값으로 대체
}

//디비 입력
String sql;
if(file1_name != null && file1_name != ""){ //첨부파일 존재
	sql = "update "+code+" set subject='"+subject+"',comment='"+comment+"',gongji='"+gongji+"',file1='"+file1_rename+"',file1_o='"+file1_name+"',file1_s='"+file1_thumb+"' where uid="+uid;
}else{
	sql = "update "+code+" set subject='"+subject+"',comment='"+comment+"',gongji='"+gongji+"' where uid="+uid;
}

Connection conn=DriverManager.getConnection(url, user, password); 
Statement stmt=conn.createStatement();
stmt.executeUpdate(sql);

stmt.close();
conn.close();

response.sendRedirect("list.jsp?code="+code+"&page_now="+page_now);
%>












