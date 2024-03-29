<%@page import="java.util.ArrayList"%>
<%@page import="bookOnCue.board.BoardDto"%>
<%@page import="bookOnCue.board.BoardDao"%>
<%@page import="bookOnCue.user.UserDto"%>
<%@page import="bookOnCue.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="css/mypage.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="getPost(2)">
	<jsp:include page="header.jsp"/>
	<div class = "all">
	
	<%
String id = (String)session.getAttribute("id");
UserDao userDao = UserDao.getinstance();
UserDto userDto = userDao.readUserById(id);%>
<div  class = "navigation">
	<button class="navbtn" onclick="location.href='updateUser'">회원정보수정</button>
	<button class="navbtn" onclick="if(confirm('탈퇴하시겠습니까?'))location.href='deleteUser'">회원탈퇴</button>
	<button class="navbtn" onclick="location.href='wishList'">위시리스트</button>
	<button class="navbtn" onclick="location.href='readerBoard'">나의 독서기록</button>
</div>
	<input type= "hidden" class = "curUser" id = "curUser" value=<%=id%>>
<table border="1px" style="border-collapse: collapse; margin: 30px auto 30px auto ">
<thead>
	<tr>
		<th>이름</th>
		<th>닉네임</th>
		<th>전화번호</th>
		<th>주소</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><%=userDto.getName()%></td>
		<td><%=userDto.getNickname()%></td>
		<td><%=userDto.getPhone()%></td>
		<td><%=userDto.getAddress()%></td>	
	</tr>
</tbody>
</table>

<%BoardDao boardDao = BoardDao.getInstance();
ArrayList<BoardDto> list = boardDao.readBoardAllByUser(id);

if(list.size()>0){
%>
<table>
<thead>
<tr>
<th>No</th>
<th>제목</th>
</tr>
</thead>
<tbody class = "written"></tbody>
</table>
<%}else{ %>
<div>아직 작성된 게시글이 없습니다.</div>

<%} %>


	</div>
		<jsp:include page="footer.jsp"/>
	
<script src = "javaScript/mypage.js"></script>
</body>
</html>