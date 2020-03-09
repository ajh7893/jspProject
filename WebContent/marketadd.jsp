<%@page import="ClassForOur.market"%>
<%@page import="ClassForOur.marketDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
		String id = (String)request.getParameter("id");
		String item = (String)request.getParameter("item");
		System.out.println(item);
		String useid = (String)session.getAttribute("sessionID");
		marketDao mark = marketDao.getInstance();
		market mm = new market();
		
		mm.setId(null);
		mm.setItem(item);
		mm.setItemnum(id);
		mm.setUseid(useid);
		
		mark.insert(mm);
		
		response.sendRedirect("main.jsp?id="+id);
	%>

</body>
</html>