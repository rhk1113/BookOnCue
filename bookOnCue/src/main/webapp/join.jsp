
<%@page import="bookOnCue.user.UserDao"%>
<%@page import="java.util.ArrayList"%>

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
		<input type="hidden" id="no" name="no" value="<%=no%>" maxlength="50"
			readonly> ID:<input type="text" id="id" name="id" required>
		PW(생성):<input type="password" id="pw1" name="pw1" required>
		PW(확인):<input type="password" id="pw2" name="pw2" required>
		name:<input type="text" id="name" name="name" required> phone:<input
			type="text" id="phone1" name="phone1" maxlength="3" placeholder="000"
			style="color: #aaa" required>-<input type="text" id="phone2"
			name="phone2" maxlength="4" placeholder="0000" style="color: #aaa"
			required>-<input type="text" id="phone3" name="phone3"
			maxlength="4" placeholder="0000" style="color: #aaa" required>
		주소:<input type="text" id="address" name="address"> 닉네임:<input
			type="text" id="nickname" name="nickname"> <input
			type="submit" value="가입하기">
	</form>
</body>
</html>