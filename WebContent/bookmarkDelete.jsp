<%@page import="ClassForOur.*"%>
<%@page import="ClassForOur.BoardDao"%>
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
		String id = (String)request.getParameter("id");
		System.out.println(id);
		marketDao.getInstance().delete(id);
		response.sendRedirect("bookmark.jsp");
	%>

</body>
</html>