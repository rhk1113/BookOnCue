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
UserDao userDao = UserDao.getinstance();
UserDto userDto = null;

request.setCharacterEncoding("UTF-8");
int no = Integer.parseInt(request.getParameter("no"));
String id = request.getParameter("id");
String password = request.getParameter("pw1");
String name = request.getParameter("name");
String nickname = request.getParameter("nickname");
String address = request.getParameter("address");
String phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
System.out.println(phone);
userDto = new UserDto (no, id, password, name, phone, address, nickname);
userDao.createUser(userDto);

response.sendRedirect("login.jsp");
%>

</body>
</html>