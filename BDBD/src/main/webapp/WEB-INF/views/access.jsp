<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href = "resources/css/access.css" rel = "stylesheet" type = "text/css"/>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src = "resources/js/access.js"></script>

<title>로그인</title>
</head>
<!-- <body onLoad="message('${message }')"> -->

<body onLoad = "getAjax('https://api.ipify.org','format=json','setPublicIp')">

<div id="main">
<div id="bigBox">
<div id="logo">ONE
<div class="logo2">로그인</div></div>

<div id="id">아이디</div>
<div><input type="text" id="idBox" class="box" name="userId"  placeholder="아이디를 입력해주세요." onkeyup="enterId()">
</div>
<div id="pass">비밀번호</div>
<div><input type="password" id="passBox" class="box" name="userPass" placeholder="비밀번호를 입력해주세요." onkeyup="enterPwd()"></div>
<div id="idForget">아이디를 잊으셨나요?</div>
<div id="idForget">비밀번호를 잊으셨나요?</div>
<div id="text">toy project Bandong Bandong</div>

<div><div id="signUp"><a href="joinForm" style="text-decoration:none; color:#5191ce;">회원가입</a>
<input type="button" id="button2" class="button" name="subMit" value="로그인" onClick="logInInfo()">

<div id="naver_id_login"></div>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("iZnxNzk8eUn4gUYk4XTQ", "localhost/");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>
</div></div>



</div>
</div>

</body>
</html>