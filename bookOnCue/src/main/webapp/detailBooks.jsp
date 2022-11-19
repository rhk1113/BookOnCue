<%@page import="java.util.ArrayList"%>
<%@page import="datas.board.BoardDto"%>
<%@page import="datas.board.BoardDao"%>
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
System.out.println(query);
%>
    <div class ="container">
    </div>
    
    
    <form>
    <input type= "hidden" value="<%=query%>" id="getisbn" name="getisbn">
    <input type="button" value = "서평하기" onclick = "gotoWrite()">
    </form>
    
    <% 
    boolean isreview = false;
    BoardDao boardDao = BoardDao.getInstance();
    ArrayList<BoardDto> list= boardDao.readBoardByIsbn(query);
    if(list!=null){
    	isreview=true;
    	ArrayList<BoardDto> bookAno = new ArrayList<BoardDto>();
        for(BoardDto dto : list){
        	if(dto.getDivision()==6||dto.getDivision()==5){
        	bookAno.add(dto);
        	}
        }
        ArrayList<BoardDto> bookReview = new ArrayList<BoardDto>();
        for(BoardDto dto : list){ 
    	 	if(dto.getDivision()==2) {
    		bookReview.add(dto);
    		}
    	 }
    	int no = bookReview.size();
    	int lastPage = 0;
    	if (no>5){
    		if (no%5==0){
    			lastPage = no/5;
    		}else{
    			lastPage = no/5+1;
    		}
    	}
        int p = 0;  
    %>
    <input type ="hidden" id = "">
    <div class ="bookreviews">
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
    			<td><a href ="dto.getNo의페이지이동처리"><%=bookAno.get(j).getTitle()%></a><td>
    			<td><%=bookAno.get(j).getUser()%><td>
    		    <td><%=bookAno.get(j).getStrdate()%><td>
    		    <td><%=bookAno.get(j).getEnddate()%><td>
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
    <input type=button onclick="pageDown()" value = "back">
    <input type=button onclick="pageUp()" value = "next">
   
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