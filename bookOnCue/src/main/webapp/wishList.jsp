<%@page import="java.util.ArrayList"%>
<%@page import="bookOnCue.wish.WishDto"%>
<%@page import="bookOnCue.wish.WishDao"%>
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
	<jsp:include page="header.jsp"/>
<%String id = (String)session.getAttribute("id");
WishDao wishDao = WishDao.getInstance();
ArrayList<WishDto> list= wishDao.readAllWishByUser(id);

if(list.size()>0){%>
<div>나의 위시 리스트</div>
<div class="lists"></div>
<%}else{%>
<div>위시 리스트가 텅 비어있어요!</div>
<button onclick="location.href='searchBook.jsp?query=오늘'">읽고 싶은 책 찾으러 가기!</button>
<%} %>
<input type= "hidden" class = "curUser" id = "curUser" value=<%=id%>>
<script src = "javaScript/wishList.js"></script>
</body>
</html>