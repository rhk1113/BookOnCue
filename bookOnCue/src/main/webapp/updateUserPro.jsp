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
	UserDao userDao =UserDao.getinstance();
	request.setCharacterEncoding("utf-8");	
	UserDto userDto = null;
	int no = Integer.parseInt(request.getParameter("no"));
	String id = (String)session.getAttribute("id");
	userDto = userDao.readUserById(id);
	
	String password = request.getParameter("pw2");
	if(password!=null){
		userDto.setPassword(password);
	}
	
	String name = request.getParameter("name");
	if(name !=null){
		userDto.setName(name);
	}
	String nickname = request.getParameter("nickname");
	if(nickname !=null){
		userDto.setNickname(nickname);
	}
	String address = request.getParameter("address");
	if(address !=null){
		userDto.setAddress(address);
	}
	String phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
	if(phone!=null){
		userDto.setPhone(phone);
	}
	System.out.println(phone);
	userDao.UpdateUserById(userDto);
	response.sendRedirect("myPage.jsp");
	
%>
</body>
</html>