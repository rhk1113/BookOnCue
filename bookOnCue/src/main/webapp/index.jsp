<%@page import="bookOnCue.user.UserDto"%>
<%@page import="bookOnCue.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<form method="post" action="searchBook">
		<input type="text" id="searchbar" name="query" placeholder="오늘의 책은?">
		<input type="submit" value="검색">
	</form>
	
	<jsp:include page="footer.jsp"/>
	<script src="javaScript/searchBook.js"></script>
</body>
</html>