<%@page import="bookOnCue.user.UserDto"%>
<%@page import="bookOnCue.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
response.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
if(id==null){
%>
<button onClick="location.href='join.jsp'">회원가입</button>
<button onClick="location.href='login.jsp'">로그인</button>
<%}else{
	UserDao userDao = UserDao.getinstance();
	UserDto  userDto = userDao.readUserById(id);
	String nickname=null;
	if(userDto.getNickname()==null)
	nickname=id;
	else
	nickname= userDto.getNickname();%>
	
	<span><b><%=nickname%></b>님 안녕하세요!</span>
    <button onclick="location.href='logoutPro.jsp'">로그아웃</button>
	<button onclick="location.href='myPage.jsp'">마이페이지</button> 
	<button onclick="location.href='BoardWrite.jsp'">글쓰러가기</button> 
<% }%>

<form method="post" action = "searchBook.jsp">
<input type="text" id = "searchbar" name = "query" placeholder="오늘의 책은?">
<input type="submit" value = "검색">
</form>

Hello World
    <script src="javaScript/searchBook.js"></script>
</body>
</html>