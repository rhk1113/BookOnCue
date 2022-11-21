<%@page import="bookOnCue.board.BoardDto"%>
<%@page import="bookOnCue.board.BoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%String query = request.getParameter("isbn");
System.out.println(query);
String id = (String)session.getAttribute("id");
%>
	<div class="container"></div>


	<form>
	<input type="hidden" value="<%=id%>" id="curUser">
		<input type="hidden" value="<%=query%>" id="getisbn" name="getisbn">
		<input type="button" value="서평하기" onclick="gotoWrite()">
	</form>

	<% 
    boolean isreview = false;
    BoardDao boardDao = BoardDao.getInstance();
    ArrayList<BoardDto> list= boardDao.readBoardByIsbn(query);
    if(list.size()>0){
    	isreview=true;
    	ArrayList<BoardDto> bookAno = new ArrayList<BoardDto>();
        for(BoardDto dto : list){
        	if(dto.getDivision()==6||dto.getDivision()==5){
        	bookAno.add(dto);
        	}
        }
    %>
	<input type="hidden" id="">
	<div class="bookreviews">
		<p>평론 읽어보기</p>
		<!-- 책에 관헤 쓴 글이 있다면 읽을 수 있도록 -->
		<table>
			<thead>
			</thead>
			<tbody>
				<% int i=1;
    //해당 책 관련 공지사항들 먼저 출력 3줄만 무조건 최근거 3개만 
    if(bookAno.size()>0){
    	for(int j=0; j<3; j++){ %>
				<tr>
					<td><%=i%></td>
					<td><a href="boardView.jsp?no=<%=bookAno.get(j).getNo()%>"><%=bookAno.get(j).getTitle()%></a>
					</td>
					<td><%=bookAno.get(j).getUser()%>
					</td>
					<%if(bookAno.get(j).getDivision()==6){ %>
					<td><%=bookAno.get(j).getStrdate()%>
					</td>
					<td><%=bookAno.get(j).getEnddate()%>
					</td>
						<% }else{%>
					<td></td>				
					<td></td>
					<% }%>						
				</tr>
				<%i++;
		if(bookAno.size()==j+1){
			break;
		}
    	}}
    %>
			</tbody>
			<tbody class="review"></tbody>
		</table>
		<input type=button onclick="pageDown()" value="back" class = "back"> 
		<input type=button onclick="pageUp()" value="next" class = "next">

	</div>
	<% }else{isreview = false;%>
	<div>
		<p>서평하기를 눌러 여러분의 감상을 들려주세요!</p>
	</div>
	<% }%>

	<!-- 들어갈 예정 -->
	<script src="javaScript/detailBook.js"></script>
</body>
</html>