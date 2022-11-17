<%@page import="datas.book.BookDto"%>
<%@page import="datas.book.BookDao"%>
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
request.setCharacterEncoding("utf-8");

if(request.getParameter("isbn").length()>3||request.getParameter("isbn")!=null){ //null값이 아닌 띄어쓰기 등이 들어갈 것을 대비... isbn은 무조건 10~13자리.
	BookDao bookDao = BookDao.getInstance();
	BookDto bookDto = bookDao.getBookByIsbn(request.getParameter("isbn"));
}
%>
	<SELECT class="selectbox" NAME="seletbox" SIZE=1>
		<OPTION VALUE=1 onselect="함수">커뮤니티</OPTION>
		<OPTION VALUE=2>책 평론하기</OPTION>
		<!-- 이하 어팬드로 넣을 값 -->
		<option value=0 disabled>==============</option>
		<OPTION VALUE=3>공지사항</OPTION>
		<OPTION VALUE=4>기간제 이벤트</OPTION>
	</SELECT>
	<!-- 책관련 공지는 체크박스에 체크표시를 할 시 +2 값하기.
			얘도 관리자만 볼 수 있게 따로 집어넣을 예정. -->
	<div class = "admin">
	<input type ="checkbox"  onclick="함수">
	<!-- 기간제 이벤트를 넣을 때만 발생하도록 할것 -->
	<input type ="date">	
	<input type ="date">
	</div>
	<!-- 여기 안에다가 책 내용 넣을것임. -->

    <form action ="함수">
        <input type="text" class = "title">
        <input type="text" class = "content">
        <input type="submit">
    </form>
<div class = "container"></div>
<!-- <ul>
    <li>이미지</li>
    <li>타이틀</li>
    <li>작가</li>
    <li>출판사</li>
</ul> 들어갈 예정 -->

</body>
</html>