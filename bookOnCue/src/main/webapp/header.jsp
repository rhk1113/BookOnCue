<%@page import="bookOnCue.user.UserDto"%>
<%@page import="bookOnCue.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
	<!-- favicon image
	<link rel="shortcut icon" href="파비콘이미지.png">

	<meta property="og:title" content="링크타이틀">
	<meta property="og:description" content="링크에대한설명">
	<meta property="og:image" content="이미지주소">  -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button onClick="location.href='index'">메인</button>
	<%
response.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
if(id==null){
%>
	<button onClick="location.href='join'">회원가입</button>
	<button onClick="location.href='login'">로그인</button>
	<%}else{
	UserDao userDao = UserDao.getinstance();
	UserDto  userDto = userDao.readUserById(id);
	String nickname=null;
	if(userDto.getNickname()==null)
	nickname=id;
	else
	nickname= userDto.getNickname();%>

	<span><b><%=nickname%></b>님 안녕하세요!</span>
	<button onclick="location.href='logoutPro'">로그아웃</button>
	<button onclick="location.href='myPage'">마이페이지</button>
	<button onclick="location.href='BoardWrite'">글쓰러가기</button>
	<% }%>

</body>
</html>