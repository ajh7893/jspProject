<%@page import="dbPack.dbDAO"%>
<%@page import="dbPack.dbDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<%
   String number = (String)request.getParameter("number");
   dbDTO dto = dbDAO.getInstance().getDetail(number);
   
   dto.setHit(dto.getHit() + 1);
   dbDAO.getInstance().update(dto);
%>

<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">

<style type="text/css">

body {
   font-family: 'Noto Sans KR', sans-serif;
}
   #main {
   border: 1px solid black;
   width: 860px;
   height: auto;
   overflow: hidden;
   margin: 5% auto;
   border: 1px solid rgba(0, 0, 0, .1);
   box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, .2);
}

 br { letter-spacing:0px; }   
   
   #submit{
      background-color: #f79320;
      border:none;
      padding: 10px 15px;
      
   }
   
   #title {
   margin: 30px 60px;
   overflow: auto;
}

#title_info {
   color: #848484;
   font-size: 13px;
}

#content {
   border: 1px solid rgba(0, 0, 0, .2);
   width: 550px;
   height: auto;
   margin: 20px auto 30px;
   font-size: 14px;
   white-space:normal;
   word-break: break-all;
   word-wrap: break-word;
}

#content p{
   margin: 20px;

}
   
hr {
   border: 0;
   height: 1px;
   background-image: linear-gradient(to right, rgba(0, 0, 0, 0),
      rgba(247, 147, 32, 0.75), rgba(0, 0, 0, 0));
}

#post-btn{
      float: right;
      margin: 30px 120px 30px 0px; 
   }
   
   #post-btn button{
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
   
   #post-btn button:hover {
   background-color: #1C1C1C;
   color: #f79320;
   }

   
   
</style>
</head>
<body>
   
    <div id="main">
      <div id="title">
         <div>
            <h2><%=dto.getSubject()%></h2>
         </div>
         <div id="title_info">
            <span id="date">작성일:&nbsp;<%=dto.getDate()%></span>
         </div>
      </div>
      <hr>
      <div id="content"><p><%=dto.getContent()%></p></div>
         <div id = "post-btn">
         <button type="submit" id = "submit" onclick = "history.back()">목록으로</button>
      </div>
      </div>
   
</body>
</html>