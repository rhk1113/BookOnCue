<%@page import="bookOnCue.board.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bookOnCue.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<button onclick="location.href='index.jsp'">메인으로 돌아가기</button>
<% 
	String id = (String)session.getAttribute("id");
    boolean isreview = false;
    BoardDao boardDao = BoardDao.getInstance();
    ArrayList<BoardDto> list= boardDao.readBoardAll();
    if(list!=null){
    	isreview=true;
    	ArrayList<BoardDto> anounce = new ArrayList<BoardDto>();
        for(BoardDto dto : list){
        	if(dto.getDivision()<=6&&dto.getDivision()>=3){
        		anounce.add(dto);
        	}
        }
        
    %>
<div class = "navigation">
<button onclick="div1()">전체</button>
<button onclick="div2()">공지사항</button>
<button onclick="div3()">커뮤니티</button>
<button onclick="div4()">서평 모아보기</button>
</div>
<table>
<thead>
</thead>
<tbody>
				<% int i=1;
    //해당 책 관련 공지사항들 먼저 출력 3줄만 무조건 최근거 3개만 
    if(anounce.size()>0){
    	for(int j=0; j<3; j++){ %>
				<tr>
					<td><%=i%></td>
					<td><a href="boardView.jsp?no=<%=anounce.get(j).getNo()%>"><%=anounce.get(j).getTitle()%></a>
					</td>
					<td><%=anounce.get(j).getUser()%>
					</td>
					<%if(anounce.get(j).getDivision()==6||anounce.get(j).getDivision()==4){%>
					<td><%=anounce.get(j).getStrdate()%>
					</td>
					<td><%=anounce.get(j).getEnddate()%>
					</td>
						<% }else{%>
					<td></td>				
					<td></td>
						<% }%>
				</tr>
				<%i++;
		if(anounce.size()==j+1){
			break;
		}
    	}}}%>
</tbody>
<tbody class = "posts"></tbody>
</table>
<% if (id!=null){ %>
	<button onclick="location.href='BoardWrite.jsp'">글쓰러가기</button>
	<%} %>
	<input type=button onclick="pageDown()" value="back" class = "back"> 
		<input type=button onclick="pageUp()" value="next" class = "next">
<script src="javaScript/boardList.js"></script>
</body>
</html>