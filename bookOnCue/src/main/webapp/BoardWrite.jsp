<%@page import="datas.user.UserDto"%>
<%@page import="datas.user.UserDao"%>
<%@page import="datas.book.BookDto"%>
<%@page import="datas.book.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
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
<input type = "hidden" id = "admin" value = <%=admin%>>
	<SELECT class="selectbox" NAME="seletbox" SIZE=1 onchange = "selected(this.value)">
		<OPTION VALUE=1 onselect="함수">커뮤니티</OPTION>
		<OPTION VALUE=2>책 평론하기</OPTION>
		<!-- 이하 어팬드로 넣을 값 -->
	</SELECT>
	<!-- 책관련 공지는 체크박스에 체크표시를 할 시 +2 값하기.
			얘도 관리자만 볼 수 있게 따로 집어넣을 예정. -->
	<div class = "bookcheck">
	<!-- 기간제 이벤트를 넣을 때만 발생하도록 할것 -->
	</div>
	<div class = "eventdate">
		<input type ="date">	
		<input type ="date">
	</div>

    <form action ="boardWriting()" >
		<input type= "hidden" value="<%=getisbn%>" id="getisbn">	
        제목:<input type="text" class = "title" id="title" name="title">
        내용:<input type="text" class = "text" id = "text" name="text">
        <input type="submit">
    </form>
	<!-- 여기 안에다가 책 내용 넣을것임. -->
<%
if(getisbn!=null){
	isisbn=true;
if(getisbn.length()>3){ 
	//null값이 아닌 띄어쓰기 등이 들어갈 것을 대비... isbn은 무조건 10~13자리.
	BookDao bookDao = BookDao.getInstance();
	bookDto = bookDao.getBookByIsbn(getisbn);
	
%>
<div class = "container">
<ul>
    	<li><img src="<%=bookDto.getImg()%>"></li>
    	<li><%=bookDto.getTitle() %></li>
    	<li><%=bookDto.getAuthor()%> / <%=bookDto.getPublisher()%></li>
	</ul>
</div>
<!-- 들어갈 예정 -->
<%}}%>
<input type= "hidden" value="<%=isisbn%>" id="isisbn">
<script src="javaScript/boardWrite.js"></script>
</body>
</html>