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
<link rel="stylesheet" href="css/cList.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class = "cList">
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
<button onclick="divC1()" class="navbtn">전체</button>
<button onclick="divC2()" class="navbtn">공지사항</button>
<button onclick="divC3()" class="navbtn">커뮤니티</button>
<button onclick="divC4()" class="navbtn">서평 모아보기</button>
</div>
<table class ="posttable">
<thead>
</thead>
<tbody>
				<% int i=1;
    //해당 책 관련 공지사항들 먼저 출력 3줄만 무조건 최근거 3개만 
    if(anounce.size()>0){
    	for(int j=0; j<3; j++){ 
    	    	String srt = String.valueOf(anounce.get(j).getStrdate()).split(" ")[0];
    	String end = String.valueOf(anounce.get(j).getEnddate()).split(" ")[0];%>
				<tr>
					<td>§</td>
					<td><a href="boardView?no=<%=anounce.get(j).getNo()%>"><%=anounce.get(j).getTitle()%></a>
					</td>
					<td><%=anounce.get(j).getUser()%>
					</td>
					<%if(anounce.get(j).getDivision()==6||anounce.get(j).getDivision()==4){%>
					<td class ="date"><%=srt%>
					</td>
					<td class ="date"><%=end%>
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
<div class="floor">
<% if (id!=null){ %>
	<button onclick="location.href='BoardWrite'" class = "gowrite">글쓰러가기</button>
	<%} %>
	<div class ="nbbutton">
		<input type=button onclick="CpageDown()" value="back" class = "back"> 
		<input type=button onclick="CpageUp()" value="next" class = "next">
	</div>
</div>
</div>
<script src="javaScript/boardList.js"></script>
	<jsp:include page="footer.jsp"/>
</body>
</html>