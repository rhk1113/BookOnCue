<%@page import="bookOnCue.user.UserDto"%>
<%@page import="bookOnCue.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
String id = (String)session.getAttribute("id");
UserDao userDao = UserDao.getinstance();
UserDto userDto = userDao.readUserById(id);%>

	<button onclick="location.href='updateUser.jsp'">회원정보수정</button>


</body>
</html>