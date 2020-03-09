<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
#widget {
   position: relative;
   width: 80%;
   height: auto;
   margin: 0 auto;
   overflow: hidden;
}

#list_content {
   display: inline;
   float: left;
   margin: 20px 50px;
}

#page_turner {
   margin: 0 auto;
   padding: 30px;
   text-align: center;
}

#title{
   font-weight: bold;
   font-size:15px;
}

#item div{
   text-align: left;
}

#item a:link{
   text-decoration: none;
   color: #1C1C1C;
}

#item a:visited{
   text-decoration: none;
   color:#1C1C1C;
}

#item a:hover{
      color: #f79320;
      text-decoration: none;
   }
   
#content div{
   color: #848484;
   font-size:13px;
}

#title, #content{
   margin-left: 5px;
}

</style>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body bgcolor="#dddddd">
   <div id="widget">
      <%
         int pageNum;
         if (session.getAttribute("page") == null) {
            pageNum = 1;
         } else {
            pageNum = Integer.parseInt((String) session.getAttribute("page"));
         }

         Connection conn = null;
         Statement stmt = null;
         ResultSet rs = null;
         ResultSet countSet = null;

         int cnt = 0;
         int maxNum = 8;
         int startNum = maxNum * (pageNum - 1);
         int index = 0;

         
         
         
         try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");

            stmt = (Statement) conn.createStatement();

            // 전체 글을 가져오기
            if (session.getAttribute("cate") == null) {
               countSet = stmt.executeQuery("select * from board order by id desc");
            } else if (session.getAttribute("cate") != null) {
               String cate = null;
               cate = (String) session.getAttribute("cate");
               System.out.println(cate);

               countSet = stmt.executeQuery("select * from board where goodscate=" + "'" + cate + "'"+"order by id desc");
            }

            // ResultSet의 첫번째 라인으로 이동
            countSet.first();
            // 전체 글수
            cnt = Integer.parseInt(countSet.getString(1));

            index = cnt - startNum;
            System.out.println( cnt );

            // 현재 페이지의 글 가져오기
            if (session.getAttribute("cate") == null) {
               rs = stmt.executeQuery("select * from board order by id desc limit " + startNum + "," + maxNum);
            } else {
               String cate = null;
               cate = (String) session.getAttribute("cate");
               session.setAttribute("cate", null);
               rs = stmt.executeQuery("select * from board where goodscate=" + "'" + cate + "'" +"order by id desc");
            }

            while (rs.next()) {
               int id = rs.getInt("id");
               String goodsName = rs.getString("goodsName");
               String goodsPrice = rs.getString("goodsPrice");
               String goodsCate = rs.getString("goodsCate");
               String time = rs.getString("time");
               String goodsFile = rs.getString("goodsFile");
               String goodsContents = rs.getString("goodsContents");
               String userId = rs.getString("userId");
      %>
      <!-- 불러오기 -->
      <div id = "item">
         <a href="main.jsp?id=<%=id%>">
            <li style="list-style-type: none" id=list_content>
         <!-- 링크타게 들어간다 리퀘스트값. -->
            <img height="360" width="240" src="ImageFile\<%=goodsFile%>"><br>
         <div id = "title">
            <b><%=goodsName%></b>
         </div>
         <div id = "content">
            <div>
               가격:&nbsp; <%=goodsPrice%><br> 
            </div> 
            <div>
               카테고리:&nbsp;<%=goodsCate%><br> 
            </div>
            <div>
               작성자:&nbsp; <%=userId%><br> 
            </div>
            <div>
               날짜 :&nbsp; <%=time%><br>
            </div>
         </div>
         </li>
         </a>
      </div>
      <%
         index--;
            }
         } catch (SQLException se) {
            out.println("<p align = 'center'>해당 카테고리에 등록된 상품이 없습니다 </p>");
            session.setAttribute("cate", null);

            
         }
      %>
   </div>
   <div id="page_turner">
      <%
         int totalPageNum = (int) Math.ceil(cnt / (double) maxNum);
         for (int i = 0; i < totalPageNum-1; i++) {
            if ((i + 1) == pageNum) {
      %>
      <%=i + 1%>
      <%
         } else {
      %>
      <a href="main.jsp?page=<%=(i + 1)%>"><%=(i + 1)%></a>
      <%
         }
         }
         session.setAttribute("page", null);
      %>
   </div>

</body>
</html>