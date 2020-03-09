<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="ClassForOur.*"%>
<%@page import="ClassForOur.AddGoods"%>


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
	request.setCharacterEncoding("UTF-8");
	int sizeLimit = 10 * 1024 * 1024;
	   //이미지 파일 저장경로
	String savePath = request.getSession().getServletContext().getRealPath("ImageFile");
	//수정하고 난후  text파일에 저장된것을 변수로 만들어 줘서 
	//불러오고  데이터들을 디비에 저장하고 불러온다.
	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

	String id = multi.getParameter("id");

	String goodsName = multi.getParameter("goodsName");

	String goodsPrice = multi.getParameter("goodsPrice");

	String goodsContents = multi.getParameter("goodsContents");
	
	String goodsFile1 = (String)multi.getFilesystemName("goodsFile1");
	
	String goodsCate = multi.getParameter("goodsCate");
	
	AddGoods board = BoardDao.getInstance().selectOne(id);

	board.setGoodsName(goodsName);
	board.setGoodsPrice(goodsPrice);
	board.setGoodsContents(goodsContents);
	board.setGoodsFile1(goodsFile1);
	board.setGoodsCate(goodsCate);
	
	//불러오는것.
	BoardDao.getInstance().update(board);
	
	//페이지 불러오는것
	response.sendRedirect("boardInfo.jsp?id=" + id);

	%>


</body>
</html>