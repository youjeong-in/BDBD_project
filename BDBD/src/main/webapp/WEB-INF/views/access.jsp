<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link href = "resources/css/access.css" rel = "stylesheet" type = "text/css"/>

<script src = "resources/js/js.js"></script> 

<title>로그인</title>
</head>


<body >

<div id="main">
<div id="bigBox">
<div id="logo">반동반동
<div class="logo2">로그인</div></div>

<div id="id">아이디</div>
<div><input type="text" id="idBox" class="box" name="userId"  placeholder="아이디를 입력해주세요." onkeyup="enterId()">
</div>
<div id="pass">비밀번호</div>
<div><input type="password" id="passBox" class="box" name="userPass" placeholder="비밀번호를 입력해주세요." onkeyup="enterPwd()"></div>
<div id="idForget">아이디를 잊으셨나요?</div>
<div id="text">BAN DONG BAN DONG TOY PROJECT</div>

<div><div id="signUp"><a href="joinForm" style="text-decoration:none; color:#5191ce;">회원가입</a>
<input type="button" class="button" name="next" value="다음" onClick="sendUserId()" />
<input type="button" id="button2" class="button" name="subMit" value="로그인" onClick="logInInfo()" style="display:none;" />

</div></div>



</div>
</div>

</body>
</html>