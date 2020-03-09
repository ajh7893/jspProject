<%@page import="ClassForOur.marketDao"%>
<%@page import="ClassForOur.market"%>
<%@page import="ClassForOur.logDao"%>
<%@page import="ClassForOur.logtest"%>
<%@page import="ClassForOur.Reply"%>
<%@page import="java.util.List"%>
<%@page import="ClassForOur.ReplyDao"%>
<%@page import="ClassForOur.BoardDao"%>
<%@page import="ClassForOur.AddGoods"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>즐겨찾기 페이지</title>
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
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
   padding-bottom: 50px;
}

h2{
   color: #f79320;
   font-align:center;
}

#table{
   width: 600px;
   text-align: center;
   align: center;
   margin: 100px auto;
   box-shadow: 0px 5px 16px 0px rgba(0, 0, 0, .2);
}
   
   #first-row{
      background-color: #f79320;
      text-align: center;
      font-size: 14px;
      color: #FFF;
      height: 30px;
   }
   
   #second-row{
      height: 110px;
   }
   
   .img{
   width: 150px;
}

.price{
   width: 150px;
}

.name a:link{
   text-decoration: none;
   color: #1C1C1C;
}

.name a:visited{
   text-decoration: none;
   color:#1C1C1C;
}

.name a:hover{
      color: #f79320;
      text-decoration: none;
}

#button{
   display: flex;
   justify-content: center;
   margin: 20px;
}

button{
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

button:hover {
   background-color: #1C1C1C;
   color: #f79320;
}
</style>
</head>
<body>
   <%
      //리퀘스트값 보여주는 곳에서. 전페이지에서 아이디를 가져옴
      String user = (String) session.getAttribute("sessionID");

      logtest log = logDao.getInstance().selectOne(user);

      List<market> list = marketDao.getInstance().selectOne(user);
   %>
   
<div id = "main">
      <div>
      <h2 align = "center">즐겨 찾기</h2>
   </div>
         <table id ="table">
            <tr id = "first-row">
            <td>
               사진 
            </td>
            <td>
               상품명
            </td>
            <td>
               가격
            </td>
            <td>
               판매자
            </td>
         </tr>
   <%
      for (market ma : list) {
         String id = ma.getItemnum();
         AddGoods addgoods = BoardDao.getInstance().selectOne(id);
      %>
         
         <tr id = "second-row">
            <td class = "img">
               <a href="main.jsp?id=<%=ma.getItemnum()%>">
               <img height="120" width="100" src="ImageFile/<%=addgoods.getGoodsFile1()%>">
               </a>
            </td>
            <td class = "name">
               <a href="main.jsp?id=<%=ma.getItemnum()%>"><%=ma.getItem()%></a>
            </td>
            <td class = "price">
               <%=addgoods.getGoodsPrice() %>&nbsp;원
            </td>
            <td>
               <%=addgoods.getUserId() %>
            </td>
            <td>
               <input id = "re_delete" type="button" value="삭제"
                     onclick="location.href='bookmarkDelete.jsp?id=<%=ma.getId()%>'">
            </td>
         </tr>
         <%
            }
            %>
         </table>
         <div id ="button">
            <button onclick = "location.href='main.jsp'">메인 페이지로</button>
         </div>
       </div>   
       
   <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2 -->
</body>
</html>