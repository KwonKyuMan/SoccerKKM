<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/dbconnection.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script>
	var a = /^(?=.*[a-z])(?=.*[0-9])[A-Za-z0-9]{4,20}$/;
	var b =  /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#%^&*])[A-Za-z0-9!@#%^&*]{6,20}$/;
	var c = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	var d = /^[가-힣]{1,20}$/;
	var e = /^[0-9]{3,4}$/;
	function aaa(){
		if(a.test(id.value) == false){
			alert("아이디를 입력하세요\n(4~20자 사이로 입력해주세요/소문자 영어,숫자)");
			id.focus();
			return false;
		}else if(b.test(pass.value)==false){
			alert("비밀번호를 입력하세요\n(6~20자 사이로 입력해주세요/영어,숫자,특수문자)");
			pass.focus();
			return false;
		}else if(pass2.value==""){
			alert("비밀번호 확인을 입력하세요");
			pass2.focus();
			return false;
		}else if(pass.value!=pass2.value){
			alert("비밀번호를 다시 확인해주세요.");
			pass.focus();
			return false;
		}else if(sample4_postcode.value==""){
			alert("우편번호를 입력하세요");
			sample4_postcode.focus();
			return false;
		}else if(sample4_roadAddress.value==""){
			alert("도로면주소를 입력하세요");
			sample4_roadAddress.focus();
			return false;
		}else if(c.test(email.value)==false){
			alert("이메일을 입력하세요\n이메일 형식을 지켜주세요");
			email.focus();
			return false;
		}else if(d.test(m_name.value)==false){
			alert("이름을 입력하세요");
			m_name.focus();
			return false;
		}else if(birth.value==""){
			alert("생일를 입력하세요");
			birth.focus();
			return false;
		}else if(birth2.value==""){
			alert("생일을 입력하세요");
			birth2.focus();
			return false;
		}else if(birth3.value==""){
			alert("생일를 입력하세요");
			birth3.focus();
			return false;
		}else if(phone3.value==""){
			alert("번호를 선택하세요");
			phone3.focus();
			return false;
		}else if(e.test(phone.value)==false){
			alert("번호를 입력하세요");
			phone.focus();
			return false;
		}else if(e.test(phone2.value)==false){
			alert("번호를 입력하세요");
			phone2.focus();
			return false;
		}
	}
</script>
</head>
<body style="background-image:url('/img/2-2.jpg');background-size:cover ">
	<table width=100% border=0>
		<tr>
			<td></td>
			<td width=500 height=800>
				<form action="insert.jsp" method="post" onsubmit="return aaa()">
				<table border=0 style="border-radius:20px;background-color:white">
					<tr>
						<td width=500 height=300 align=center colspan=2><a href="/"><img src="/img/2-1.png"></a></td>
					</tr>
					<tr>
						<td width=110 height=40 style="padding-left:30px">아이디</td>
						<td><input style="width:300px;border:0px;border-bottom:1px solid gray" id="id" name="id" value=""></td>
					</tr>
					<tr>
						<td height=40 style="padding-left:30px">비밀번호</td>
						<td><input type="password" style="width:300px;border:0px;border-bottom:1px solid gray" id="pass" name="pass" value=""></td>
					</tr>
					<tr>
						<td height=40 style="padding-left:30px">비밀번호 확인</td>
						<td><input type="password" style="width:300px;border:0px;border-bottom:1px solid gray" id="pass2" name="pass2" value=""></td>
					</tr>
					<tr>
						<td height=40 style="padding-left:30px">주소</td>
						<td>
							<input type="text" id="sample4_postcode" placeholder="우편번호" name="zipcode">
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width:124px;height:21px;font-size:13px;vertical-align:bottom"><br>
							<input type="text" id="sample4_roadAddress" placeholder="도로명주소" style="width:300px"  id="address2" name="zipcode1">
							<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" style="width:300px">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="sample4_detailAddress" placeholder="상세주소" style="width:300px" name="zipcode2">
							<input type="hidden" id="sample4_extraAddress" placeholder="참고항목" style="width:300px">
						</td>
					</tr>
					<tr>
						<td height=40 style="padding-left:30px">이메일주소</td>
						<td><input style="width:300px;border:0px;border-bottom:1px solid gray" id="email"  name="email" value=""></td>
					</tr>
					<tr>
						<td height=40 style="padding-left:30px">이름</td>
						<td><input style="width:300px;border:0px;border-bottom:1px solid gray" id="m_name" name="name" value=""></td>
					</tr>
					<tr>
						<td height=40 style="padding-left:30px">생년월일</td>
						<td>
							<select style="width:99px;text-align:center" id="birth"  name="birth" value="">
								<option value="">년도</option>
								<%
								for(int i=1;i<=100;i++){
									out.print("<option value='"+(2025-i)+"'>"+(2025-i)+"년</option>");
								}
								%>
							</select>
							<select style="width:99px;text-align:center" id="birth2" name="birth2" value="">
								<option value="">월</option>
								<%
								for(int i=1;i<=12;i++){
									out.print("<option value='"+i+"'>"+i+"월</option>");
								}
								%>
							</select>
							<select style="width:99px;text-align:center" id="birth3"  name="birth3" value="">
								<option value="">일</option>
								<%
								for(int i=1;i<=31;i++){
									out.print("<option value='"+i+"'>"+i+"일</option>");
								}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td height=40 style="padding-left:30px">휴대번호</td>
						<td>
							<select style="width:85px;height:22px;text-align:center" id="phone3"  name="phone3" value="">
								<option value="">=선택=</option>
								<option value="010">010</option>
							</select> - 
							<input style="width:85px"  id="phone" name="phone" value=""> - <input style="width:85px" id="phone2" name="phone2" value="">
						</td>
					</tr>
					<tr>
						<td colspan=2 align=center>
						<button style="width:100px;height:30px;font-size:18px;font-weight:bold;background-color:#7CB6FA;border:0px;border-radius:10px" type="submit">회원가입</button>
						</td>
					</tr>
					<tr>
						<td height=10></td>
					</tr>
				</table>
				</form>
			</td>
			<td></td>
		</tr>
	</table>
	
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
</body>
</html>