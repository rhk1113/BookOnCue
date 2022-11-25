
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

    <form id = "loginForm" action = "JoinPro.jsp">
        <table>
        <tr>
            <td>아이디*</td>
            <td><input type="text" name="userID" id="userID" required class = "userID"></td>
            <td><button onclick="checkid()">중복 확인</button></td>
        </tr>
        <tr>
            <td>비밀번호*</td>
            <td><input type="password" name="userPW" id="userPW" required></td>
        </tr>
        <tr>
            <td>비밀번호 확인*</td>
            <td><input type="password" name="pwCheck" id="pwCheck" required></td>
        </tr>
        <tr>
            <td>이름*</td>
            <td><input type="text" name ="userName" required></td>
        </tr>
        <tr>
            <td>전화번호*</td>
            <td><input type="text" name = "phone1" required maxlength="3" placeholder="000">-
                <input type="text" name = "phone2" required maxlength="4" placeholder="0000">-
                <input type="text" name = "phone3" required maxlength="4" placeholder="0000"></td>
        </tr>
        <tr>
            <td>주소</td>
            <td><input type="text" name ="address"></td>
        </tr>
        <tr>
            <td>닉네임</td>
            <td><input type="text" name = "nickname"></td>
        </tr>
        <tr>
        <td><input type="submit" id="loginSubmit" value="가입 하기"></td>
        </tr>
    </table>
</form>
<script src = "javaScript/join.js"></script>
</body>
</html>