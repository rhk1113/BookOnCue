<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--라이브러리 활용을 하는 경우 이곳에 위치함.-->
<!--j쿼리 자바스크립트 라이브러리 : https://api.jquery.com/-->
<!--구글 cdn 에서 가져오는 링크: https://developers.google.com/speed/libraries-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Document</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<% request.setCharacterEncoding("utf-8");
String query = request.getParameter("query");
System.out.println(query);%>

	<!-- 검색창은 따로 헤더에 포함시킬것인가... 안하는게 나을 것 같다 어차피 글쓸때도 유지된다면 책검색은 한정된 곳에만 가능하게 도는 게 맞지. -->
	<form method="post" action="searchBook.jsp">
		<input type="text" id="searchbar" name="query" value="<%=query%>">
		<input type="submit" value="검색">
	</form>
	<h1>Book Search</h1>
	<button class="back_button" onclick="getDataBack()">back</button>
	<button class="next_button" onclick="getDataNext()">next</button>
	<table border="1">
		<thead>
			<tr>
				<th>image</th>
				<!--url-->
				<th>title</th>
				<th>contents</th>
				<th>author</th>
				<th>publisher</th>
				<th>price</th>
				<th>ISBN</th>
			</tr>
		</thead>
		<tbody class="container"></tbody>
	</table>

	<!--문서 하단에 위치함-->
	<script src="javaScript/searchBook.js"></script>
</body>
</html>