<%@page import="java.util.ArrayList"%>
<%@page import="datas.board.BoardDto"%>
<%@page import="datas.board.BoardDao"%>
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
<%String query = request.getParameter("isbn");
System.out.println(query);
%>
    <div class ="container">
    </div>
    
    
    <form>
    <input type= "hidden" value="<%=query%>" id="getisbn">
    <input type="button" value = "평론하기" onclick = "gotoWrite()">
    </form>
    
    <% 
    boolean isreview = false;
    BoardDao boardDao = BoardDao.getInstance();
    ArrayList<BoardDto> list= boardDao.readBoardByIsbn(query);
    if(list!=null){
    	isreview=true;
    %>
    <input type ="hidden" id = "">
    <div class ="bookreviews">
    <p>평론 읽어보기</p>
    <!-- 책에 관헤 쓴 글이 있다면 읽을 수 있도록 -->
    <table>
    	<thead>
    	</thead>
    	<tbody>
    <% int i=1;
    for(BoardDto dto : list){ %>
    	<tr>
    	<td><%=i%></td>
    	<td><a href ="dto.getNo의페이지이동처리"><%=dto.getTitle() %></a></td>
    	<td><%=dto.getUser()%></td>
    	<% if(dto.getDivision()==6) {%>
    	<td><%=dto.getStrdate()%></td>
    	<td><%=dto.getEnddate()%></td>
    	<%} %>
    <%i++;}}else{isreview = false;}%>
    	</tr>
    	</tbody>
    </table>
    </div>
   
<!-- 들어갈 예정 -->
    <script src="javaScript/detailBook.js"></script>    
</body>
</html>