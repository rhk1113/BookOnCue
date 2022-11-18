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
	response.setCharacterEncoding("utf-8");

	BookDao bookDao = BookDao.getInstance();
	BookDto bookDto = null;
	
	long id = bookDao.getMaxId();
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String isbn = request.getParameter("isbn");
	String img = request.getParameter("img");
	int price = Integer.parseInt(request.getParameter("price"));
	String url = request.getParameter("url");
	String publisher = request.getParameter("publisher");

	bookDto = new BookDto(id, title, author, isbn, img, price, url, publisher);
	
	BookDto check = bookDao.getBookByIsbn(isbn);
	
	if(check==null){
	bookDao.createBook(bookDto);
	System.out.println("책등록 완료");
	}else{
		System.out.println("이미 등록된 책입니다.");
		System.out.println(check);
	}
	%>
</body>
</html>