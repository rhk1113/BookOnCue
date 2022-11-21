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
	
	long id = Long.parseLong(request.getParameter("no"));
	
	boardDao.deletePost(id);
	System.out.println("게시글 등록 완료");
	response.sendRedirect("boardList.jsp");
%>
</body>
</html>