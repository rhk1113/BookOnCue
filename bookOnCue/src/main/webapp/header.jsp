<%@page import="bookOnCue.user.UserDto"%>
<%@page import="bookOnCue.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<!-- favicon image -->
	<link rel="shortcut icon" href="https://s3.amazonaws.com/files.d20.io/images/315914032/Yf_AwBRrFhq8PkJ9vayR-g/max.png">

	<meta property="og:title" content="Book on Cue">
	<meta property="og:description" content="대중 참여형 북 큐레이팅 사이트">
	<meta property="og:image" content="https://s3.amazonaws.com/files.d20.io/images/315913990/wtCAkZs58J5u4KO67FxBUA/max.png">
<meta charset="UTF-8">
<title>Book on Cue</title>
 <link rel="stylesheet" href="css/grid.css"> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<div class = "header">
	<a href='index' class="logo"><img src="https://s3.amazonaws.com/files.d20.io/images/315913990/wtCAkZs58J5u4KO67FxBUA/max.png" style="width:200px"></a>

	<%
request.setCharacterEncoding("utf-8");
	String query = request.getParameter("query");
	System.out.println(query);
response.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
if(id==null){
%>
	<div class = "logins">
	<button onClick="location.href='join'">회원가입</button> <span>|</span>
	<button onClick="location.href='login'">로그인</button>
	</div>
	<%}else{
	UserDao userDao = UserDao.getinstance();
	UserDto  userDto = userDao.readUserById(id);
	String nickname=null;
	if(userDto.getNickname()==null)
	nickname=id;
	else
	nickname= userDto.getNickname();%>
	<div class = "loggined">
	<button onclick="location.href='logoutPro'">로그아웃</button> <span>|</span>
	<button onclick="location.href='myPage'">마이페이지</button>
	<br><span><b><%=nickname%></b>님 안녕하세요!</span>
	</div>
	<% }%>
	<div class="search">
	<form method="post" action="searchBook" >
		<input type="text" id="searchbar" name="query" placeholder="오늘의 책은?" value="<%=query == null ? "" : query%>">
		<input type="submit" value="검색" class="bookbutton">
	</form>
		<div class ="navbutton">
		<button class="navbutton" onclick="location.href='BoardWrite'">글쓰러가기</button>
		<button class="navbutton" onClick="location.href='boardList'">커뮤니티</button>
	</div>
	</div>
</div>
	<script src="javaScript/searchBook.js"></script>
</body>
</html>