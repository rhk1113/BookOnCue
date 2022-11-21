<%@page import="bookOnCue.user.UserDto"%>
<%@page import="bookOnCue.user.UserDao"%>
<%@page import="bookOnCue.book.BookDao"%>
<%@page import="bookOnCue.book.BookDto"%>
<%@page import="bookOnCue.board.BoardDto"%>
<%@page import="bookOnCue.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	long no = Long.parseLong(request.getParameter("no"));
	
	BoardDao boardDao = BoardDao.getInstance();
	BoardDto boardDto = boardDao.readBoardByNo(no);
	String id = (String)session.getAttribute("id");
	BookDao bookDao = BookDao.getInstance();
	BookDto bookDto = bookDao.getBookByIsbn(boardDto.getIsbn());
	UserDao userDao = UserDao.getinstance();
	UserDto userDto = userDao.readUserById(id);
%>
<div>
<div><%=boardDto.getTitle()%></div>
<div><%=boardDto.getUser()%></div>
<div><%=boardDto.getRegdate()%></div>
<% if(!boardDto.getModdate().equals(boardDto.getRegdate())){%>
<div><%=boardDto.getModdate()%></div>
<%}%>
<% if(boardDto.getDivision()==6){%>
<div class = "div6">
<div><%=boardDto.getStrdate()%></div>
<div><%=boardDto.getEnddate()%></div>
</div>
<%}%> 
<% if(boardDto.getDivision()==2||boardDto.isIsbook()){%>
<div class="container">
		<ul>
			<li><img src="<%=bookDto.getImg()%>"></li>
			<li><%=bookDto.getTitle() %></li>
			<li><%=bookDto.getAuthor()%> / <%=bookDto.getPublisher()%></li>
		</ul>
	</div>
<%}%>
<div><%=boardDto.getText()%></div>

</div>
<%if(boardDto.getUser().equals(id)){%>
		<button>수정하기</button>
		<button>삭제하기</button>
<%}%>
<form method="post">
	<input type = "hidden" value = "<%=userDto.isManager()%>" id = "isManager">
	<input type="hidden" value = "<%=no %>" class = "postNo" id = "postNo">
	<input type="hidden" value="<%=id %>" id="curUser">
	<textarea id ="commentBox"></textarea>
	<input type="submit" onclick = "commentUp()">
</form>
<div class = "comments"></div>
<input type=button onclick="pageDown()" value="back" class = "back"> 
<input type=button onclick="pageUp()" value="next" class = "next">



<button onClick="location.href='boardList.jsp'">커뮤니티 가기</button>

<% if(boardDto.getDivision()==2||boardDto.isIsbook()){%>
<button onClick="location.href='detailBooks.jsp?isbn=<%=boardDto.getIsbn()%>'">다른 서평 보러가기</button>
<%} %>
<script src ="javaScript/boardView.js"></script>
</body>
</html>