<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
String uploadPath="C:\\jsp\\test\\src\\main\\webapp\\upload";
int size = 10*1024*1024;

request.setCharacterEncoding("utf-8");

MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());

String code = multi.getParameter("code");
String gongji = multi.getParameter("gongji");
String subject = multi.getParameter("subject");
String comment = multi.getParameter("comment");

subject = subject.replaceAll("'", "''" ); //좌측의 값을 우측의 값으로 치환
comment = comment.replaceAll("'", "''" );

Enumeration files=multi.getFileNames();

//첨부파일1
String file1=(String)files.nextElement(); //첨부파일1 존재한다면
String file1_name=multi.getOriginalFileName(file1); //사용자가 올린 파일명
String file1_rename=multi.getFilesystemName(file1); //중복된 파일명을 새로운 파일명으로 변경

if(file1_name == null){ //첨부파일1 없다면
	file1_name = ""; //null 값이 아닌 비어있는 값으로 대체
	file1_rename = ""; //null 값이 아닌 비어있는 값으로 대체
}

//오늘 날짜
Date today = new Date();
SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String signdate = cal.format(today);

//답변 fid 값 설정
String sql_fid = "select max(fid) as fid_max from "+code+" ";

Connection conn_fid=DriverManager.getConnection(url, user, password);
Statement stmt_fid=conn_fid.createStatement();
ResultSet rs_fid=stmt_fid.executeQuery(sql_fid);

int fid = 1; //default = 1 처리

if(rs_fid.next()){
	if(rs_fid.getInt("fid_max") > 0){
		fid = rs_fid.getInt("fid_max") + 1;
	}
}

rs_fid.close();
stmt_fid.close();
conn_fid.close();

//디비 입력
String sql = "INSERT INTO "+code+" (id, name, subject, comment, signdate, ref, gongji, file1, file1_o,fid,thread)";
	sql = sql + " VALUES ('"+session_id+"', '"+session_name+"', '"+subject+"', '"+comment+"', '"+signdate+"', 0, '"+gongji+"','"+file1_rename+"','"+file1_name+"',"+fid+",'A')";

Connection conn=DriverManager.getConnection(url, user, password); 
Statement stmt=conn.createStatement();
stmt.executeUpdate(sql);

stmt.close();
conn.close();

response.sendRedirect("list.jsp?code="+code);
%>












