<%@page import="datas.user.UserDao"%>
<%@page import="datas.user.UserDto"%>
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
if(id==null){
%>
<button onClick="location.href='join.jsp'">회원가입</button>
<button onClick="location.href='login.jsp'">로그인</button>
<%}else{
	UserDao userDao = UserDao.getinstance();
	UserDto userDto = userDao.readUserById(id);
	String nickname=null;
	if(userDto.getNickname()==null)
	nickname=id;
	else
	nickname= userDto.getNickname();%>
	
	<span><b><%=nickname%></b>님 안녕하세요!</span>
    <button onclick="location.href='logoutPro.jsp'">로그아웃</button>
	<button onclick="location.href='myPage.jsp'">마이페이지</button>  	
<% }%>

Hello World
</body>
</html>