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
String id = (String)session.getAttribute("id");
UserDao userDao1 = UserDao.getinstance();
UserDto userDto1 = userDao1.readUserById(id);

%>
	<form class = "editMe" method="post" onsubmit="commitChange()">
		<input type="hidden" id="curUser" name="curUser" value="<%=id%>" readonly> 
		<input type="hidden" id="exPw" name="exPw" value="<%=userDto1.getPassword()%>" readonly> 
		<table>
		<tr>
		<td>ID:</td>
		<td><input type="text" id="id" name="id" readonly value="<%=userDto1.getUser()%>" readonly></td>
		</tr><tr>
		<td>PW(기존):</td>
		<td><input type="password" id="pw" name="pw" value=""> </td>
		</tr><tr>
		<td>PW(생성):</td>
		<td><input type="password" id="pw1" name="pw1" value=""> </td>
		</tr><tr>
		<td>PW(확인):</td>
		<td><input type="password" id="pw2" name="pw2" value=""> </td>
		</tr><tr>
		<td>name:</td>
		<td><input type="text" id="name" name="name" value="<%=userDto1.getName()%>"> </td>
		</tr><tr>
		<td>phone:</td>
		<td><input type="text" id="phone" name="phone" value="<%=userDto1.getPhone()%>" readonly> 
		</td>
		</tr><tr>
		<td>주소:</td>
		<td><input type="text" id="address" name="address" value="<%=userDto1.getAddress()%>"></td>
		</tr><tr>
		<td>닉네임:</td>
		<td><input type="text" id="nickname" name="nickname" value="<%=userDto1.getNickname()%>"> </td>
		</tr><tr>
		<td><input type="button" value="수정하기" onclick = "checkPass()"></td>
		</tr>
		</table>
	</form>
	<script src = "javaScript/userUpdate.js"></script>
</body>
</html>