<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="bookOnCue.board.BoardDto"%>
<%@page import="bookOnCue.board.BoardDao"%>
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
	response.setCharacterEncoding("utf-8");
	
	BoardDao boardDao = BoardDao.getInstance();
	BoardDto boardDto = null;
	
	long id = Long.parseLong(request.getParameter("postNo"));
	int division = Integer.parseInt(request.getParameter("division"));
	String title =request.getParameter("title");
	String text =request.getParameter("text");
	String user =request.getParameter("user");
	String isbn =request.getParameter("isbn");
	
	Timestamp strdate =null;
	Timestamp enddate =null;
	
	boolean isbook =false;
	String bookcheck = request.getParameter("isbook");
	System.out.println(bookcheck);
	if(bookcheck.equals("true")){
		isbook=true;
	}
	
	if(!request.getParameter("strdate").equals("") &&!request.getParameter("enddate").equals("") ){
	strdate = Timestamp.valueOf(LocalDateTime.parse(request.getParameter("strdate")+" 12:00:00",DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
	enddate = Timestamp.valueOf(LocalDateTime.parse(request.getParameter("enddate")+" 12:00:00",DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
	}
	boardDto = new BoardDto(id, division, title, text, user, isbn, strdate, enddate, isbook);
	
	boardDao.updatePost(boardDto, id);
	System.out.println("게시글 등록 완료");
	if(division==2){
	response.sendRedirect("detailBooks?query="+isbn);
	}else{
		response.sendRedirect("boardList");
	}
	%>
</body>
</html>