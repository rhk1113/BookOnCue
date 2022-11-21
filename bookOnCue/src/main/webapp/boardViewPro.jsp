<%@page import="bookOnCue.comment.CommentDto"%>
<%@page import="bookOnCue.comment.CommentDao"%>
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

	CommentDao coDao = CommentDao.getInstance();
	CommentDto coDto = null;

	long no = coDao.getMaxNo();
	String id = request.getParameter("id");
	long post = Long.parseLong(request.getParameter("post"));
	String text = request.getParameter("text");

	coDto = new CommentDto(no, id, post, text);
	coDao.createComment(coDto);
	System.out.println("댓글등록완료");

	response.sendRedirect("boardView.jsp?no="+post);

%>
</body>
</html>