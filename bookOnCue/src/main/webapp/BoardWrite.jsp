<%@page import="bookOnCue.book.BookDao"%>
<%@page import="bookOnCue.book.BookDto"%>
<%@page import="bookOnCue.user.UserDto"%>
<%@page import="bookOnCue.user.UserDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="css/write.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class = "all">
	<%
request.setCharacterEncoding("utf-8");
boolean admin = false;
String id = (String)session.getAttribute("id");


if(id!=null){ //관리자 여부 확인
	UserDao userDao = UserDao.getinstance();
	UserDto userDto = userDao.readUserById(id);
	admin = userDto.isManager();
}

String getisbn =request.getParameter("isbn");
boolean isisbn = false;
BookDto bookDto = null;
%>
	<form id="writeAbout" method="post" action="boardWritePro.jsp">
	<input type="hidden" id="admin" value=<%=admin%>>
	<SELECT class="selectbox" NAME="seletbox" SIZE=1 onchange="selected(this.value)">
		<OPTION VALUE=1>커뮤니티</OPTION>
		<OPTION VALUE=2>책 평론하기</OPTION>
		<!-- 이하 어팬드로 넣을 값 -->
	</SELECT>
	<!-- 책관련 공지는 체크박스에 체크표시를 할 시 +2 값하기.
			얘도 관리자만 볼 수 있게 따로 집어넣을 예정. -->
	<!-- 기간제 이벤트를 넣을 때만 발생하도록 할것 -->

		<div class="bookcheck"></div>
		<div class="eventdate">
			<input type="date" name="strdate"> <input type="date"
				name="enddate">
		</div>
		<input type="hidden" value="false" id="isbook" name="isbook">
		<input type="hidden" value="1" id="division" name="division">
		<input type="hidden" value="<%=id%>" id="user" name="user"> <input
			type="hidden" value="<%=getisbn%>" id="getisbn" name="isbn">
		<div  class="title">
		제목:&nbsp;&nbsp;&nbsp;<input type="text" id="postTitle" name="title">
		</div>
		<div class="text" >
		<textarea id="postText" name="text"></textarea>
		</div>
		<input type="submit" class = "submit">
	</form>
	<!-- 여기 안에다가 책 내용 넣을것임. -->
	<%
if(getisbn!=null){
	isisbn=true;
	//null값이 아닌 띄어쓰기 등이 들어갈 것을 대비... isbn은 무조건 10~13자리.
	BookDao bookDao = BookDao.getInstance();
	bookDto = bookDao.getBookByIsbn(getisbn);
	
%>

		<ul class="bookcontainer">
			<li><img src="<%=bookDto.getImg()%>"></li>
			<li><%=bookDto.getTitle() %></li>
			<li><%=bookDto.getAuthor()%> / <%=bookDto.getPublisher()%></li>
		</ul>
	<!-- 들어갈 예정 -->
	<%}%>
	</div>
	<jsp:include page="footer.jsp"/>
	<input type="hidden" value="<%=isisbn%>" id="isisbn">
	<script src="javaScript/boardWrite.js"></script>
</body>
</html>
