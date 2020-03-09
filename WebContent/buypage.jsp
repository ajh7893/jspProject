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
<title>Insert title here</title>
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
   padding-bottom: 60px;
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
      height: 120px;
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

hr {
   border: 0;
   height: 1px;
   background-image: linear-gradient(to right, rgba(0, 0, 0, 0),
      rgba(247, 147, 32, 0.75), rgba(0, 0, 0, 0));
}

#info-wrap{
   margin: 50px 100px;
   color:#1C1C1C;

}

#info{
   margin-left: 30px;
}

#button{
   display:flex;
   justify-content: center;
}

#button button {
   width: 200px;
   font-weight: bold;
   margin: 5px; 
   background-color : #f79320;
   font-size: 14px;
   border: none;
   padding: 10px 10px;
   box-shadow: 0px 3px 10px 0px rgba(0, 0, 0, .2);
   background-color: #f79320;
    color: #F2F2F2;
   border-radius: 15px 30px;
}

#button button:hover {
   background-color: #1C1C1C;
   color: #f79320;
}

#info input{
   border: none;
   border-bottom: 1px solid #1C1C1C;
   margin: 10px 0px;
   padding: 5px;
}

#address{
   width: 300px;
}


</style>
<script type="text/javascript">
	function check() {
		var a = confirm("정말로 결제하시겠습니까?")
		
		if (a == true) {
			location.href="main.jsp"
		}
	}

</script>
</head>
<body>
<%
      //리퀘스트값 보여주는 곳에서. 전페이지에서 아이디를 가져옴
      String id = (String)request.getParameter("id");
      AddGoods addgoods = BoardDao.getInstance().selectOne(id);
      
      String user = (String)session.getAttribute("sessionID");
      
      logtest log = logDao.getInstance().selectOne(user);
      System.out.println(log.getAddr());
      System.out.println(log.getEmail());
      System.out.println(log.getPhone());
   %>
   
   <div id = "main">
      <div>
      <h2 align = "center">바로 구매</h2>
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
         </tr>
         <tr id = "second-row">
            <td class = "img">
               <a href="main.jsp?id=<%=id%>">
               <img height="120" width="100" src="ImageFile/<%=addgoods.getGoodsFile1()%>">
               </a>
            </td>
            <td class = "name">
               <a href="main.jsp?id=<%=id%>"><%=addgoods.getGoodsName()%></a>
            </td>
            <td class = "price">
               <%=addgoods.getGoodsPrice()%>&nbsp;원
            </td>
         </tr>
         </table>
         <hr>
         
         <div id = "info-wrap">
            <div><h3>배송지 정보</h3></div>
            <div id = "info">
               이름 &nbsp;<input type = "text" value = <%=log.getName() %>><br>
               전화번호 &nbsp;<input type = "text" value = <%=log.getPhone() %>><br>
               이메일 &nbsp;<input type = "text" value = <%=log.getEmail() %>><br>
               주소 &nbsp;<input type = "text" id = "address" value = <%=log.getAddr() %>>            
            </div>
         </div>
         <div id = "button">
            <button onclick="check()">결제</button>
            <button onclick="history.back()">취소</button>
         </div>
   </div>
        
</body>
</html>