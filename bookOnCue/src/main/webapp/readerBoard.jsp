<%@page import="bookOnCue.board.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bookOnCue.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="getPost()">
	<jsp:include page="header.jsp"/>
<%
String id = (String)session.getAttribute("id");
BoardDao boardDao = BoardDao.getInstance();
ArrayList<BoardDto> list = boardDao.readBoardAllByUser(id);%>
<input type= "hidden" class = "curUser" id = "curUser" value=<%=id%>>
<table>
<% 
if(list.size()>0){
%>
<tbody class = "written"></tbody>
</table>
<%}else{%>
<div>아직 작성한 서평이 없습니다.</div>
<button onclick="location.href='searchBook?query=오늘'">읽을 책 찾으러 가기!</button>
<%} %>
<script src = "javaScript/readerBoard.js"></script>
</body>
</html>