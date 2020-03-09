<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dbPack.dbDTO"%>
<%@ page import="dbPack.dbDAO"%>
<%@ page import="java.util.ArrayList"%>

<jsp:setProperty property="*" name="info" />

<%
	ArrayList<dbDTO> dtos = dbDAO.getInstance().dbSelect();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<title>공지사항 목록</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

#main {
	width: 860px;
	margin: 5% auto;
	border: 1px solid rgba(0, 0, 0, .1);
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, .2);
	padding-top: 30px;
	padding-bottom: 60px;
}

h2 {
	color: #f79320;
	font-align: center;
}

#table_wrap {
	margin: 50px 0px;
}

#table {
	width: 600px;
	text-align: center;
	align: center;
	font-family: 'Noto Sans KR', sans-serif;
}

#first-row {
	background-color: #f79320;
	text-align: center;
	font-size: 14px;
	color: #FFF;
	height: 25px;
}

.id {
	width: 50px;
	font-size: 12px;
	border-right: 1px solid rgba(0, 0, 0, 0.2);
}

.subject {
	width: 150px;
	text-decoration: none;
	text-align: left;
	border-right: 1px solid rgba(0, 0, 0, 0.2);
	font-size: 14px;
}

.subject a {
	text-decoration: none;
	margin: 10px;
}

.subject a:link {
	color: #2E2E2E;
	text-decoration: none;
}

.subject a:visited {
	color: #2E2E2E;
	text-decoration: none;
}

.subject a:hover {
	color: #f79320;
	text-decoration: none;
}

.date {
	width: 100px;
	border-right: 1px solid rgba(0, 0, 0, 0.2);
	font-size: 12px;
}

.hit {
	width: 50px;
	font-size: 12px;
}

#write {
	float: right;
	margin: 30px 120px 30px 0px;
}

#write input {
	background-color: #f79320;
	font-size: 12px;
	border: none;
	padding: 10px 15px;
	margin: 10px;
	box-shadow: 0px 3px 10px 0px rgba(0, 0, 0, .2);
	color: #F2F2F2;
	border-radius: 15px 30px;
	font-weight: bold;
}

#write input:hover {
	background-color: #1C1C1C;
	color: #f79320;
}

.new-row {
	height: 25px;
}
</style>
</head>
<body>
	<div id="main">
		<div>
			<h2 align="center">공지사항</h2>
		</div>
		<div id="table_wrap">
			<table id="table" align="center">
				<tr id="first-row">
					<td>글 번호</td>
					<td>글 제목</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>

				<%
					for (int i = 0; i < dtos.size(); i++) {
						dbDTO dto = dtos.get(i);
						int id = dto.getId();
						String subject = dto.getSubject();
						String date = dto.getDate();
						int hit = dto.getHit();
				%>
				<tr class="new-row">
					<td class="id"><b><%=id%></b></td>
					<td class="subject"><a href="main.jsp?number=<%=id%>">
							<%=subject%>
					</a></td>
					<td class="date"><%=date%></td>
					<td class="hit"><%=hit%></td>
				</tr>
				<%
					}
				%>
			</table>
			<%
				if (session.getAttribute("sessionID") != null) {
					String sessionid = (String) session.getAttribute("sessionID");
					if (sessionid.equals("master")) {
			%>
			<div id="write">
				<input type="button" onclick="location.href = 'notice_board.jsp'"
					value="글 쓰기">
			</div>
			<%
				}
				}
			%>
		</div>
	</div>
</body>
</html>