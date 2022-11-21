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
	UserDao userDao =UserDao.getinstance();
	request.setCharacterEncoding("utf-8");	
	String id = (String)session.getAttribute("id");
	userDao.deleteUser(id);
	response.sendRedirect("logoutPro.jsp");
%>
</body>
</html>