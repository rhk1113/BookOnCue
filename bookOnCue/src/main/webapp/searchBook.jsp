<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="css/search.css"> 
<!--라이브러리 활용을 하는 경우 이곳에 위치함.-->
<!--j쿼리 자바스크립트 라이브러리 : https://api.jquery.com/-->
<!--구글 cdn 에서 가져오는 링크: https://developers.google.com/speed/libraries-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Document</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="bookSearch">
	<div class="container"></div>
	
	<div class = "nbbutton">
	<button class="back_button" onclick="getDataBack()">back</button>
	<button class="next_button" onclick="getDataNext()">next</button>
	</div>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>