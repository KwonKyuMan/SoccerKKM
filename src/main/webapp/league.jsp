<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<%@ page import="org.json.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    // API에서 데이터를 가져오기 위한 URL
    String apiUrl = "https://api.football-data.org/v4/competitions/CL/matches";
    int itemsPerPage = 10; // 한 페이지에 표시할 항목 수
    int pageNum = 1; // 기본 페이지
    
    // 페이지 매개변수 확인
    String pageParam = request.getParameter("page");
    if (pageParam != null && !pageParam.isEmpty()) {
        pageNum = Integer.parseInt(pageParam);
    }
    
    // API에 요청을 보내고 응답 받기
    java.net.URL url_1 = new java.net.URL(apiUrl + "?page=" + pageNum);
    java.net.HttpURLConnection conn = (java.net.HttpURLConnection) url_1.openConnection();
    conn.setRequestMethod("GET");
    conn.setRequestProperty("X-Auth-Token", "731b93c98f47406496f845ddca7ae683"); // 여기에 본인의 API 키를 넣어주세요
    conn.setRequestProperty("Accept", "application/json");
    java.io.BufferedReader br = new java.io.BufferedReader(new java.io.InputStreamReader(conn.getInputStream()));

    // 응답 내용 읽기
    StringBuilder responseBuilder = new StringBuilder();
    String line;
    while ((line = br.readLine()) != null) {
        responseBuilder.append(line);
    }
    br.close();

    // JSON 형태의 응답 내용을 파싱하여 화면에 출력
    JSONObject jsonResponse = new JSONObject(responseBuilder.toString());
    JSONArray matches = jsonResponse.getJSONArray("matches");
%>
<table border = 0 width=100%>
    <tr>
        <td witdh=500></td>
        <td width=910>
            <table border = width=950 style="border-radius:10px">
                <tr>
                    <td align=center class="pacifico-regular" style="border-radius:10px 0 0 0">DATE</td>
                    <td colspan=2 align=center style="background-color:#F29898" class="pacifico-regular">HOME_TEAM</td>
                    <td colspan=3 align=center class="pacifico-regular">SCORE</td>
                    <td colspan=2 align=center style="background-color:#D1E7F1;border-radius:0 10px 0 0" class="pacifico-regular">AWAY_TEAM</td>
                </tr>
                <%
    int start = (pageNum - 1) * itemsPerPage;
    int end = Math.min(start + itemsPerPage, matches.length());
    for (int i = start; i < end; i++) {
        JSONObject match = matches.getJSONObject(i);
        String homeTeam = match.getJSONObject("homeTeam").optString("name", "");
        String homeTeamCrest = match.getJSONObject("homeTeam").optString("crest", "");
        String awayTeam = match.getJSONObject("awayTeam").optString("name", "");
        String awayTeamCrest = match.getJSONObject("awayTeam").optString("crest", "");
        String status = match.optString("status", "");
        String time_1 = match.optString("utcDate", "");
        String winner = match.getJSONObject("score").optString("winner", "TIMED");
        String home_score = match.getJSONObject("score").getJSONObject("fullTime").optString("home", "");
        String away_score = match.getJSONObject("score").getJSONObject("fullTime").optString("away", "");
        // ISO 8601 형식을 파싱하여 Instant 객체로 변환
        Instant instant = Instant.parse(time_1);
        
        // Instant 객체를 ZonedDateTime 객체로 변환하고 한국 표준시로 변환
        ZonedDateTime seoulTime = instant.atZone(ZoneId.of("Asia/Seoul"));
        
        // 포맷 지정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd HH:mm");
        
        // 포맷에 맞추어 문자열로 변환
        String formattedTime = seoulTime.format(formatter);
%>
                <tr>
                    <td width=100 align=center>
                        <div style="width:100px" class="pacifico-regular"><%=formattedTime%></div>
                    </td>
                    <td width=180 align= center>                   
                        <img style="width:30px;height:30px" src="<%=homeTeamCrest%>">
                    </td>
                    <td width=200 height=50 align= center>
                        <div style="width:200px" class="workbench"><%=homeTeam%></div>
                    </td>
                    <td width=50 align=center class="pacifico-regular"><%=home_score%></td>
                    <td width=150 align= center>
                        <div style="width:150px" class="bungee-spice-regular"><%=winner%></div>
                    </td>
                    <td width=50 align=center class="pacifico-regular"><%=away_score%></td>
                    <td align= center>
                        <div style="width:200px" class="workbench"><%=awayTeam%></div>
                    </td>
                    <td width=180 align= center>
                        <img style="width:30px;height:30px" src="<%=awayTeamCrest%>">
                    </td>
                </tr>
                <%} %>
            </table>
            <%-- 페이징 링크 --%>
            <div style="text-align: center;">
                <% if (pageNum > 1) { %>
                    <a href="?page=<%= pageNum - 1 %>"><img style="width:30px;height:30px"src="/img/9_1.png"></a>
                <% } %>
                <% if (matches.length() > end) { %>
                    <a href="?page=<%= pageNum + 1 %>"><img style="width:30px;height:30px" src="/img/9_2.png"></a>
                <% } %>
            </div>
        </td>
        <td width=10></td>
        <td width=250 valign=top>
        <%@ include file="/member/login.jsp" %>
        </td>
        <td witdh=500></td>
    </tr>
</table>
<%@ include file="/include/footer.jsp" %>
