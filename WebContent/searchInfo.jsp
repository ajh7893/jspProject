<%@page import="java.sql.*"%>
<%@page   import="com.mysql.jdbc.interceptors.SessionAssociationInterceptor"%>
<%@page import="ClassForOur.*"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<title>찾기</title>
</head>
<body>
   <%
      int pageNum;
      if (request.getParameter("page") == null) {
         pageNum = 1;
      } else {pageNum = Integer.parseInt(request.getParameter("page"));}
      // DB연걸
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      ResultSet countSet = null;
      int cnt = 0;
      int maxNum = 9;
      int startNum = maxNum * (pageNum - 1);
      int index = 0;
      try {
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");
         stmt = (Statement) conn.createStatement();
         // 전체 글을 가져오기
         if (session.getAttribute("search") == null) {
            countSet = stmt.executeQuery("select * from board order by id desc");
         } else if (session.getAttribute("search") != null) {
            String search = null;
            search = (String) session.getAttribute("search");
            System.out.println(search);
            countSet = stmt.executeQuery("select * from board where goodsName=" + "'" + search + "'");
         }
         countSet.first();
         // 전체 글수
         cnt = Integer.parseInt(countSet.getString(1));
         index = cnt - startNum;
         // *세션 search가 널이면 다보여주고 검색값이 있으면 겂색하는거 보여주는 구문*
         if (session.getAttribute("search") == null) {
            rs = stmt.executeQuery("select * from board order by id desc limit " + startNum + "," + maxNum);
         } else {
            String search = null;
            search = (String) session.getAttribute("search");
            session.setAttribute("search", null);
            rs = stmt.executeQuery("select * from board where goodsName=" + "'" + search + "'");
         }
         while (rs.next()) {
            //if(session.getAttribute("search")!=null)
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
   <li style="list-style-type: none" id=list_content>
      <!-- 링크타게 들어간다 리퀘스트값. -->
      <td><a href="boardInfo.jsp?id=<%=id%>"></td>
      <img height="360" width="240" src="ImageFile\<%=goodsFile%>"> <br>
      제목 : <%=goodsName%></a><br>
      가격 : <%=goodsPrice%><br> 
      카테고리 : <%=goodsCate%><br>
      유저 아이디 : <%=userId%><br> 
      날짜 : <%=time%><br> </a>
   </li>
   <%index--;}} catch (SQLException se) {out.println("검색한 상품이 없습니다");}%>
   </div>
      <input type = "button" value = "메인으로 " onclick ="gotoMain()">
   </div>
<script type="text/javascript">
function gotoMain() {location.href="main.jsp";}
</script>
</body>
</html>