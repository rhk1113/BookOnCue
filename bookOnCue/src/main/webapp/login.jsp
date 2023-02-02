<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<form method="post" action="loginPro.jsp">
	<div class ="loginBox">
		<div id="ihead">ID	:</div><input type="text" id="id" name="id"> 
		<div id="phead">PW	:</div><input type="password" id="pw" name="pw"> 
		<div class="loginbtn"></div>
		<input type="submit" value="로그인"  class = "login">
	</div>
	</form>
	<jsp:include page="footer.jsp"/>
</body>
</html>