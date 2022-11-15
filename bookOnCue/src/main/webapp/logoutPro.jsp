<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
let result = confirm("로그아웃 하겠습니까?");
let flag = result

if(flag){
<%	// 컨펌에 긍정했을때만 로그아웃 하도록 고민해보기.
	session=request.getSession();
	System.out.println("로그아웃 성공?");
	session.invalidate();
	System.out.println("로그아웃 성공");
	response.sendRedirect("index.jsp");
%>
}
</script>
</body>
</html>