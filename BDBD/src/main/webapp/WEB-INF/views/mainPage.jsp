<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
</head>
<body>
	<div>${userName}님의 페이지 환영해요~!~!~!</div>
	<div>핸드폰 번호: ${userPhone }입니다</div>
	<input type="hidden" value="${userId }" name="userId"/>
</body>
</html>