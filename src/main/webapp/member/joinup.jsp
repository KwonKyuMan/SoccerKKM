<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
String sql = "select * from member where id = '"+session_id+"'";

Connection conn=DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

if(rs.next()){

%>

<script>
var b =  /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#%^&*])[A-Za-z0-9!@#%^&*]{6,20}$/;

function joinup(){
	if(b.test(pass.value)==false){
		alert("비밀번호를 입력하세요\n(6~20자 사이로 입력해주세요/영어,숫자,특수문자)");
		pass.focus();
		return false;
	}
	if(pass.value != pass2.value){
		alert("비밀번호가 일치하지 않습니다. 다시 확인해 주세요.");
		pass.focus();
		return false;
	}
}
</script>

<table width="100%" height=50 border=0>
	<tr>
		<td align=center>
			<form action="join_update.jsp" method="post" onsubmit="return joinup()">
			<table border=0>
				<tr>
					<td rowspan=10 width=500 align=right><img style="width:350px;height:300px" src="/img/4_2.png"></td>
					<td colspan=2 align = center class="nanum-pen">○회원수정○</td>
					<td rowspan=10 width=500><img style="width:300px;height:300px" src="/img/4_1.png"></td>
				</tr>
				<tr>
					<td align =right width = 100 style="font-size:18px;font-weight:bold">아이디</td>
					<td align =left width = 200><input id="id" name="id" value="<%=rs.getString("id") %>" readonly></td>
				</tr>
				<tr>
					<td align =right style="font-size:18px;font-weight:bold">비밀번호 변경</td>
					<td align =left><input type="password" id="pass" name="pass"  value=""></td>
				</tr>
				<tr>
					<td align =right style="font-size:18px;font-weight:bold">비밀번호 확인</td>
					<td><input type="password" id="pass2" name="pass2"  value=""></td>
				</tr>
				<tr>
					<td align =right style="font-size:18px;font-weight:bold">이름</td>
					<td><input name="name" value="<%=rs.getString("name") %>"></td>
				</tr>
				<tr>
					<td></td>
					<td align = left>
						<input type="text" id="sample4_postcode" placeholder="우편번호" name="zipcode" value="<%=rs.getString("zc") %>">
						<input style="font-weight:bold" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="zipcode1" value="<%=rs.getString("zc1") %>">
						<span id="guide" style="color:#999;display:none"></span><br>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="zipcode3" value="<%=rs.getString("zc2") %>">
					</td>
				</tr>
				<tr height = 20></tr>
				<tr>
					<td colspan=2 align=center><button style="font-weight:bold">회원수정</button></td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
</table>
<%
}
rs.close();
stmt.close();
conn.close();
%>

<%@ include file="/include/footer.jsp" %>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>


