<%@page import="ClassForOur.*"%>
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
		String id = request.getParameter("id");
		BoardDao.getInstance().delete(id);
		response.sendRedirect("main.jsp");
	%>

</body>
</html>