<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
   rel="stylesheet">
<link href = "resources/css/join.css" rel = "stylesheet" type = "text/css"/>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/join.js"></script>
<script>
   //중복체크
   
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
<title>회원가입</title>
</head>
<!-- <body onLoad="message('${message }')"> -->

<body>

   <div id="main">
      <div id="bigBox">
         <div id="logo">
            반동반동
            <div class="logo2">회원가입</div>
         </div>
         <div id="id">아이디</div>
         <div>
            <input type="text" id="idBox" class="box" name="userId"
               placeholder="*아이디를 입력해주세요." onkeyup="korCheck(this, event)" onblur = "isDupCheck()"/>
            <div id="dupId"></div>
         </div>
         <div id="pass"></div>
         <div>
            <input type="password" id="passBox" class="box" name="userPass"
               placeholder="비밀번호를 입력해주세요." onBlur="pwdCh(this)"/>
         </div>
         <div>
            <input type="password" id="passBox2" class="box" name="userPass"
               placeholder="비밀번호를 다시 입력해주세요." onBlur="pwdCh2(this)"/>
         </div>

         <div id="Phone">전화번호</div>
         <div>
            <input type="text" class="box" id="userPhone" name="userPhone"
               placeholder="-빼고 입력해주세요.">
         </div>

         <div class="name">
            <div>
               <input type="text" id="name" class="box" name="userName"
                  placeholder="이름">
            </div>
            <div><select id="sex" name="sex">
            <option value="M">남성</option>
            <option value="F">여성</option></select></div>
         </div>
            <input type="date" name="birthDay" class="box" />

         
         <div>
            <input type="email" class="box" id="userMail" name="userMail"
               placeholder="이메일">&nbsp;@ <select class="mailbox"
               name="mailAdd">
               <option value="">직접입력</option>
               <option value="@naver.com">naver.com</option>
               <option value="@gmail.com">gmail.com</option>
               <option value="@daum.net">daum.net</option>
            </select>
         </div>
         
<input type="text" class="postbox" id="sample4_postcode" name="adress" placeholder="우편번호">
<input type="button" class="sbutton" onclick="sample4_execDaumPostcode()" value="검색"><br>
<input type="text" class="box" id="sample4_roadAddress" name="adress2" placeholder="도로명주소">
<span id="guide" style="color:#999;display:none"></span>
<input type="text" class="box" id="sample4_detailAddress" name="adress3" placeholder="상세주소">


         <div>
            <div id="signUp">
               <a href="accessForm" style="text-decoration: none; color: #5191ce;">로그인</a>
               <input type="button" class="button" name="userpass" value="가입하기" onClick="joinInfo()">
            </div>
         </div>

      </div>
   </div>

</body>
</html>