<%@page import="datas.user.UserDto"%>
<%@page import="datas.user.UserDao"%>
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
UserDao userDao = UserDao.getinstance();
UserDto userDto = userDao.readUserById(id);

%>
<form method="post" action = "updateUserPro.jsp">
	<input type="hidden" id="no" name="no" value="<%=userDto.getId()%>"
							maxlength="50" readonly>
	<input type="hidden" id="exPhone" name="exPhone" value="<%=userDto.getPhone()%>" readonly>
    ID:<input type="text" id="id" name = "id" readonly value="<%=userDto.getUser()%>">
    PW(생성):<input type="password" id ="pw1" name ="pw1" value="<%=userDto.getPassword()%>">
    PW(확인):<input type="password" id = "pw2" name="pw2" >
    name:<input type="text" id="name" name="name" value="<%=userDto.getName()%>">
    phone:<input type="text" id="phone1" name="phone1" maxlength="3" placeholder="000" style="color:#aaa">-<input type="text" id="phone2" name="phone2" maxlength="4"placeholder="0000" style="color:#aaa">-<input type="text" id="phone3" name="phone3" maxlength="4"placeholder="0000" style="color:#aaa">
    주소:<input type="text" id="address" name="address" value ="<%=userDto.getAddress()%>">
    닉네임:<input type="text" id="nickname" name="nickname"value ="<%=userDto.getNickname()%>">
    <input type="submit" value="가입하기">
</form>
</body>
</html>