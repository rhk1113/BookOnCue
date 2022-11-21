<%@page import="bookOnCue.user.UserDto"%>
<%@page import="bookOnCue.user.UserDao"%>
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
	UserDao userDao = UserDao.getinstance();
	String id = request.getParameter("id");
	UserDto userDto = null;
	userDto = userDao.readUserById(id);
	System.out.println(request.getParameter("id"));
	if (userDto!=null){
		System.out.println(userDto.getPassword());
		String pw = request.getParameter("pw");
		if (pw.equals(userDto.getPassword())){
			session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("manager",userDto.isManager());
			System.out.println("세션 저장 완료");
			response.sendRedirect("index.jsp");
		}else{
			System.out.println("세션 저장 실패");
			response.sendRedirect("login.jsp");
		}
	}
	else{
		System.out.println("사용자를 찾을 수 없습니다");
		response.sendRedirect("login.jsp");
}%>

</body>
</html>