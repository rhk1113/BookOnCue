<%@page import="bookOnCue.board.BoardDto"%>
<%@page import="bookOnCue.board.BoardDao"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
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
response.setContentType("application/json");
request.setCharacterEncoding("utf-8");
String query = request.getParameter("getisbn");
System.out.println(query);

BoardDao boardDao = BoardDao.getInstance();
ArrayList<BoardDto> list= boardDao.readBoardByIsbn(query);
System.out.println(list);

ArrayList<BoardDto> bookReview = new ArrayList<BoardDto>();
for(BoardDto dto : list){ 
 	if(dto.getDivision()==2) {
	bookReview.add(dto);
	}
}

PrintWriter res = response.getWriter();
String json = new Gson().toJson(bookReview);
System.out.println(json);
res.println(json);
//response.encodeRedirectUrl("BookDetail.jsp?isbn="+query);

%>
</body>
</html>