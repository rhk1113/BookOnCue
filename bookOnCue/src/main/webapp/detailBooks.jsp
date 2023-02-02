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
<link rel="stylesheet" href="css/detailBook.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="detail">
		<%
		String query = request.getParameter("query");
		System.out.println(query);
		String id = (String) session.getAttribute("id");
		%>
		<div class="containerDetail"></div>
		<div class="dowith">
			<input type="hidden" value="<%=id%>" id="curUser"> <input
				type="hidden" value="<%=query == null ? "" : query%>" id="getisbn"
				name="getisbn"> <input type="button" value="서평하기"
				onclick="gotoWrite()" class="gowrite">
			<div class="likeBox">
				<button class="like" id="like" name="like" onclick="toggleLike()">
					<span id="isLike">좋아요</span><span id="like-count"></span>
				</button>
				<button class="want" id="want" name="want" onclick="toggleWant()">
					<span id="wantText">찜여부</span>
				</button>
			</div>
		</div>

		<%
		boolean isreview = false;
		BoardDao boardDao = BoardDao.getInstance();
		ArrayList<BoardDto> list = boardDao.readBoardByIsbn(query);
		if (list.size() > 0) {
			isreview = true;
			ArrayList<BoardDto> bookAno = new ArrayList<BoardDto>();
			for (BoardDto dto : list) {
				if (dto.getDivision() == 6 || dto.getDivision() == 5) {
			bookAno.add(dto);
				}
			}
		%>
		<div class="bookreviews">
			<div class="textre">평론 읽어보기</div>
			<!-- 책에 관헤 쓴 글이 있다면 읽을 수 있도록 -->
			<table class="reviewbox">
				<thead>
				</thead>
				<tbody class="ano">
					<%
					int i = 1;
					//해당 책 관련 공지사항들 먼저 출력 3줄만 무조건 최근거 3개만 
					if (bookAno.size() > 0) {
						for (int j = 0; j < 3; j++) {
							String srt = String.valueOf(bookAno.get(j).getStrdate()).split(" ")[0];
							String end = String.valueOf(bookAno.get(j).getEnddate()).split(" ")[0];
					%>
					<tr class="reviewContent">
						<td>§</td>
						<td><a href="boardView?no=<%=bookAno.get(j).getNo()%>"><%=bookAno.get(j).getTitle()%></a>
						</td>
						<td><%=bookAno.get(j).getUser()%></td>
						<%
						if (bookAno.get(j).getDivision() == 6) {
						%>
						<td class="date"><%=srt%></td>
						<td class="date"><%=end%></td>
						<%
						} else {
						%>
						<td></td>
						<td></td>
						<%
						}
						%>
					</tr>
					<%
					i++;
					if (bookAno.size() == j + 1) {
						break;
					}
					}
					}
					%>
				</tbody>
				<tbody class="review"></tbody>
			</table>
			<div class="nbbutton">
				<input type=button onclick="detailpageDown()" value="back"
					class="back"> <input type=button onclick="detailpageUp()"
					value="next" class="next">
			</div>
		</div>
		<%
		} else {
		isreview = false;
		%>
		<div>
			<p>서평하기를 눌러 여러분의 감상을 들려주세요!</p>
		</div>
		<%
		}
		%>

		<!-- 들어갈 예정 -->
	</div>
	<script src="javaScript/detailBook.js"></script>
	<script src="javaScript/likeAndWish.js"></script>
	<script>
		function toggleWant() {
			bookToDB();
			work();
			CDWish();
			work()
			checkWish();
		}
	</script>
	<jsp:include page="footer.jsp" />
</body>
</html>