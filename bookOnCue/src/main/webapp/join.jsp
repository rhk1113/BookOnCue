
<%@page import="bookOnCue.user.UserDao"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<%
request.setCharacterEncoding("utf-8");

UserDao userDao = UserDao.getinstance();
int no = userDao.getMaxId();
ArrayList<String> ids = new ArrayList<>();
ids = userDao.getAllId();
System.out.println(ids);
ArrayList<String> nicknames=new ArrayList<>();
nicknames = userDao.getAllNickName();
%>
	<form method="post" action="JoinPro.jsp">
		<input type="hidden" id="no" name="no" value="<%=no%>" maxlength="50" readonly> 
		ID:<input type="text" id="id" name="id" required><br>
		PW(생성):<input type="password" id="pw1" name="pw1" required><br>
		PW(확인):<input type="password" id="pw2" name="pw2" required><br>
		name:<input type="text" id="name" name="name" required> <br>
		phone:<input type="text" id="phone" name="phone" class="phone" maxlength="11" ><br>
		주소:<input type="text" id="address" name="address"> <br>
		닉네임:<input type="text" id="nickname" name="nickname"> <br>
		<input type="submit" value="가입하기">
	</form>
<script src = "javaScript/join.js"></script>
</body>
</html>