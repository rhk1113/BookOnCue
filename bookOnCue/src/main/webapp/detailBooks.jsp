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
System.out.println(query);%>
    <div class ="container">
    </div>
    
    
    <form>
    <input type= "hidden" value="<%=query%>" id="getisbn">
    <input type="button" value = "평론하기" onclick = "gotoWrite()">
    </form>
    <script src="javaScript/detailBook.js"></script>    
</body>
</html>