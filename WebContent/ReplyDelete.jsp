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
		String id = request.getParameter("id");
		String renum = request.getParameter("renum");
		System.out.println(renum);
		System.out.println(id);
		ReplyDao.getInstance().delete(renum);
		response.sendRedirect("main.jsp?id="+id);
	%>

</body>
</html>