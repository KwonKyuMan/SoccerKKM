<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
String uploadPath="C:\\jsp\\test\\src\\main\\webapp\\upload";
int size = 10*1024*1024;

request.setCharacterEncoding("utf-8");

MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());

String code = multi.getParameter("code");
String page_now = multi.getParameter("page_now");
String gongji = multi.getParameter("gongji");
String subject = multi.getParameter("subject");
String comment = multi.getParameter("comment");
//계층형 변수 2개
int fid = Integer.parseInt(multi.getParameter("fid"));
String thread=multi.getParameter("thread");

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

//thread 값 설정
//locate('AB' , 'ABA') = 1 :: 첫항의 'AB'가 두번째 항의 내용 중에 1번째 자리부터 매칭이 있는지 여부
String sql_fid = "select right(thread,1) as thread_right from "+code+" where fid = "+fid+" AND length(thread) = length('"+thread+"')+1 AND locate('"+thread+"',thread) = 1 ORDER BY thread DESC limit 1";

Connection conn_count=DriverManager.getConnection(url, user, password);
Statement stmt_count=conn_count.createStatement();
ResultSet rs_count=stmt_count.executeQuery(sql_fid);

String new_thread  = thread + "A";
if(rs_count.next()){ //형제 thread 추출
	String r_thread = rs_count.getString("thread_right");
	new_thread  = thread + (char)(r_thread.charAt(0) + 1);
}

//디비 입력
String sql = "INSERT INTO "+code+" (id, name, subject, comment, signdate, ref, gongji, file1, file1_o,fid,thread)";
	sql = sql + " VALUES ('"+session_id+"', '"+session_name+"', '"+subject+"', '"+comment+"', '"+signdate+"', 0, '"+gongji+"','"+file1_rename+"','"+file1_name+"',"+fid+",'"+new_thread+"')";

Connection conn=DriverManager.getConnection(url, user, password); 
Statement stmt=conn.createStatement();
stmt.executeUpdate(sql);

stmt.close();
conn.close();

response.sendRedirect("list.jsp?code="+code+"&page_now="+page_now);
%>












