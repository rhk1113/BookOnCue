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
<link rel="stylesheet" href="css/postView.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class = "all">
	<%
	long no = Long.parseLong(request.getParameter("no"));
	
	BoardDao boardDao = BoardDao.getInstance();
	BoardDto boardDto = boardDao.readBoardByNo(no);
	String id = (String)session.getAttribute("id");
	BookDao bookDao = BookDao.getInstance();
	BookDto bookDto = bookDao.getBookByIsbn(boardDto.getIsbn());
	
	UserDao userDao = UserDao.getinstance();
	UserDto	userDto = userDao.readUserById(id);
	String str = String.valueOf(boardDto.getStrdate()).split(" ")[0];
	String end = String.valueOf(boardDto.getEnddate()).split(" ")[0];
%>
<div class = "post">
<div class = "title">제목 | <%=boardDto.getTitle()%></div>
<div class = "user">작성자 | <%=boardDto.getUser()%></div>
<div class = "regdate">게시일 | <%=boardDto.getRegdate()%></div>
<% if(!boardDto.getModdate().equals(boardDto.getRegdate())){%>
<div class = "moddate">수정일 | <%=boardDto.getModdate()%></div>
<%}%>
<% if(boardDto.getDivision()==6||boardDto.getDivision()==4){%>
<div class = "date">
<span>이벤트 기간 | </span>
<span><%=str%></span>
<span>~</span>
<span><%=end%></span>
</div>
<%}%> 
<div class = "posttext">
<% if(boardDto.getDivision()==2||boardDto.isIsbook()){%>
<div class="containerview">
		<ul>
			<li><img src="<%=bookDto.getImg()%>"></li>
			<li><%=bookDto.getTitle() %></li>
			<li><%=bookDto.getAuthor()%> / <%=bookDto.getPublisher()%></li>
		</ul>
	</div>
<%}%>
<div class = "text"><%=boardDto.getText()%></div>
</div>

</div>


<%
if(userDto!=null){
if(boardDto.getUser().equals(id)||userDto.isManager()){%>
<div class = "owner">
		<button class ="utilbtn" onclick = "location.href='BoardEdit?no=<%=no%>'">수정하기</button>   
		<button class ="utilbtn" onclick = "location.href='BoardDeletePro.jsp?no=<%=no%>'">삭제하기</button>
</div>
<%}
	boolean manager=false;
if(id!="null"){manager = userDto.isManager();
}%>


<form method="post" class = "leaveComment">
	<input type = "hidden" value = "<%=manager%>" id = "isManager">
	<input type="hidden" value = "<%=no %>" class = "postNo" id = "postNo">
	<input type="hidden" value="<%=id %>" id="curUser">
	<textarea id ="commentBox"></textarea>
	<input class ="subbtn" type="submit" onclick = "commentUp()">
</form>
<form method="post"class = "EditComment">
	<input type = "hidden" value = "<%=manager%>" id = "isManager">
	<input type="hidden" value = "<%=no%>" class = "postNo" id = "postNo">
	<input type="hidden" value="<%=id %>" id="curUser">
	<input class ="subbtn" type="submit" onclick = "commentEdit()">
</form>
<div class = "comments"></div>
<input type=button onclick="pageDown()" value="back" class = "back"> 
<input type=button onclick="pageUp()" value="next" class = "next">



<button class = "viewbtn" onClick="location.href='boardList'">커뮤니티 가기</button>

<%} if(boardDto.getDivision()==2||boardDto.isIsbook()){%>
<button class = "viewbtn" onClick="location.href='detailBooks?query=<%=boardDto.getIsbn()%>'">다른 서평 보러가기</button>
<%} %>
</div>
<script src ="javaScript/boardView.js"></script>

		<jsp:include page="footer.jsp"/>
</body>
</html>
