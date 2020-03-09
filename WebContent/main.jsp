<%@page import="org.apache.catalina.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>중고거래는, 4989!</title>
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
    <%
    String stat; 
    stat = (String)request.getParameter("stat");
    String cate;
      cate = (String)request.getParameter("cate");
    String pagein;
    pagein = (String)request.getParameter("page");
    String id;
    id = (String)request.getParameter("id");
    String number;
    number = (String)request.getParameter("number");
    String sell;
    sell = (String)request.getParameter("sell");
    String update;
    update = (String)request.getParameter("update");
    
    if(stat == null){
       stat="Load.jsp";
    }else if(stat.equals("sell")){
       stat="GoodsAdd.jsp";
    }else if(stat.equals("login")){
       stat="LoginForm.jsp";
    }else if(stat.equals("join")){
       stat="JoinForm.jsp";
    }else if(stat.equals("logout")){
    	session.setAttribute("sessionID", null);
    	stat="Load.jsp";
    }else if(stat.equals("notice")){
        stat="noticeList.jsp";
     }
    
    
    if(cate != null){
       session.setAttribute("cate", cate);
    }
    if(pagein != null){
       session.setAttribute("page", pagein);
    }
    if(id != null){
    	stat="boardInfo.jsp?id="+id;
    }
    if(number != null){
    	stat="notice_view.jsp?number="+number;
    }
    if(sell != null){
		stat="buypage.jsp?id="+sell;    	
    }
    if(update != null){
    	stat="updateForm.jsp?id="+update;
    }
    %>
<script src="https://kit.fontawesome.com/59bb7064b2.js"

   crossorigin="anonymous"></script>

   <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
     $( document ).ready( function() {
        $( '#xy' ).load('<%=stat%>');
     } );
     
    </script>
<style>
html, body {
   height: 100%;
}

body {
   margin: 0px;
   padding: 0px;
   background: #FFFFFF;
   font-family: 'Noto Sans KR', sans-serif;
   font-size: 12pt;
}

header {
   overflow: hidden;
   background-color: #fff;
   display:fixed;
}

#top-header {
   text-align: center;
   height: 200px;
}

#logo {
   float: left;
   padding: none;
   margin: none;
   height: 100%;
   width: 100%;
   background-color: #fff;
}

#logo img {
   height: 200px;
}

#top-menu {
   float: right;
   width: 100%;
   height: 50px;
   padding: 0px 0px 10px 0px;
   background: #fff;
}

#top-menu ul {
   text-align: center;
   float: right;
   margin: 20px 50px 20px 0px;
}

#top-menu li {
   display: inline-block;
   margine: 0px 20px;
}

.top-nav a {
   text-decoration: none;
   padding: 5px 10px;
   font-size: 20px;
   color: #1C1C1C;
}

/**검색창*/
#search-bar {
   float: right;
   margin: 10px 50px 10px 0px;
}

.bottom-menu input[type=text] {
   width: 250px;
   height: 20px;
   border: none;
   font-size: 13px;
   margin: none;
   padding: 5px 10px;
   border-bottom: 1px solid black;
}

#bottom-menu {
   overflow: hidden;
   border: 1px solid black;
}

.bottom-a a {
   float: left;
   font-size: 15px;
   color: black;
   text-align: center;
   padding: 14px 20px;
   text-decoration: none;
   margin: 0px 40px;
}

.bottom-a a:hover{
   background-color: #f79320;   
} 

/*드롭다운 메뉴*/
.dropbtn {
   background-color: white;
   color: black;
   padding: 14px 20px;
   font-size: 15px;
   border: none;
   float: right;
}

.dropdown {
   float: left;
}

#dropbtn{
   position: relative;
}

.dropdown-content {
   display: none;
   background-color: #FFFFFF;
   z-index: 1;
   min-width: 160px;
   box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, .2);
   position: absolute;
   top: 305px;
}

.dropdown-content a {
   float: none;
   color: black;
   text-align: center;
   text-decoration: none;
   padding: 12px 16px;
   display: block;
}

#bottom-a a{
   margin: 0px 100px;
}

.dropdown-content a:hover {
   background-color: #f79320;
}

.dropdown:hover .dropdown-content {
   display: block;
}

.dropdown:hover .dropbtn {
   background-color: #f79320;
}

.to-center{
   margin: 0px 40%;
}

#search-bar button {
   font-size: 15px;
   border: none;
   padding: 7px 10px;
   background-color: #f79320;
}

#search-bar button:hover {
   background-color: #1C1C1C;
   color: #f79320;
}

#section1 {
   height: 300px;
   text-align: center;
   margin: 0%, 40%;
}

.row #column1, .row #column2 {
   float: left;
   width: 320px;
   padding: 80px 40px;
   margin: 20px 40px;
   border: 1px dotted black;
}

.column-title h3 {
   margin: 1em 0em;
   font-size: 1.6em;
   font-weight: 700;
}

.button {
   text-decoration: none;
   text-align: center;
   display: inline-block;
   padding: 16px 32px;
   font-size: 16px;
   background-color: #f79320;
   margin: 4px 2px;
}

.button hover {
   background-color: #000000 color: #FFFFFF;
}

#section2 {
   overflow: hidden;
   top: 400px;
   padding-top: 5em;
   margin: 0% 5%;
}

#column21, #column22, #column23, #column24 {
   width: 282px;
   text-align: center;
   float: left;
   margin-right: 24px;
}

.img-title {
   display: block;
   padding-bottom: 1em;
   font-size: 1em;
}

.img {
   display: inline-block;
   border: 1px solid rgba(0, 0, 0, .5);
   border-radius: 5px;
}

#row{
   display:flex;
   flex-direction: row;
   justify-content: space-around;
   margin: 30px 0px 50px 0px;
}

#row-title{
}

.footer{
   margin-top:30px;
   padding: 20px 0px;
   background-color:#1C1C1C;
   color: #D8D8D8;
   text-align: center;
}

#footer-row{
   display: flex;
   justify-content: space-around;
}

.footer h3{
   color: #f79320;
   margin-bottom: 20px; 
   
}

.column{
   width: 250px;
   height: 100px;
   font-align: center;
   color: #BDBDBD;
   padding: 25px 0px;
   
}

.column i{
   font-size: 2em;
   color: #f79320;
}

.column p{
   font-size: 13px;
}

#last{
   font-size: 13px;
   color:#848484;
}

</style>

<script type="text/javascript">
function link() {
	if (<%=session.getAttribute("sessionID")%>==null) {
		alert("로그인을 해주세요")
        return false;
	}
}
</script>
</head>
<body>
   <header>
      <div id="top-header" class="top-nav">
         <nav id="top-menu">
            <ul>
               <li><a href="main.jsp" title = "홈"><i class="fas fa-home"></i></a></li>
                  <%if (session.getAttribute("sessionID") == null){
                  %>
               <li><a href="main.jsp?stat=login" title = "로그인"><i class="fas fa-sign-in-alt"></i></a></li>
               <li><a href="main.jsp?stat=join" title = "회원가입"><i class="fas fa-user-plus"></i></a></li>
                  <%}else{%>
               <li><a href = "main.jsp?stat=logout" onclick="return confirm('로그아웃 하시겠습니까?')" title = "로그아웃"><i class="fas fa-sign-out-alt"></i></a></li>   <!-- 로그아웃 -->
               <li><a href = "#" title = "회원정보"><i class="fas fa-user-circle"></i></a></li>      <!--내 정보-->
               <li><a href="bookmark.jsp" title = "즐겨찾기"><i class="fas fa-star"></i></a></li> <!-- 장바구니  -->
                  <%}%>
                  
            </ul>
         </nav>
         <div id="logo">
            <a href=main.jsp><img src="imgs/logo.jpg"></a>
         </div>
      </div>
		<div id="bottom-menu" class="bottom-menu">
			<div class="to-center">
				<div class="dropdown">
					<button class="dropbtn">
						구매하기<i class="fa fa-caret-down"></i>
					</button>
					<div class="dropdown-content">
						<a href="main.jsp?cate=man"> 남성의류 </a> <a
							href="main.jsp?cate=girl"> 여성의류 </a> <a href="main.jsp?cate=app">가전기기</a>
						<a href="main.jsp?cate=child">아동용품</a> <a
							href="main.jsp?cate=ticket">상품권/티켓</a> <a
							href="main.jsp?cate=travel">취미용품</a> <a
							href="main.jsp?cate=computer">컴퓨터</a> <a
							href="main.jsp?cate=camera">카메라</a> <a href="main.jsp?cate=book">도서</a>
						<a href="main.jsp?cate=furniture">가구</a>
					</div>
				</div>
			</div>
			<div class="bottom-a">
				<a href="main.jsp?stat=sell" onclick="return link()">판매하기</a><a
					href="main.jsp?stat=notice">공지사항</a> 
			</div>
  <div id="search-bar">
            <form action="searchServlet" method="post">
               <input type="text" name="search" placeholder="원하는 물건을 찾아보세요!">
                 <button type="submit"><i class="fas fa-search"></i></button>
            </form>
         </div>
	</header>
   
   

 <section id = "section2">
   <div id = "xy" >
   </div>
 </section>

   <div class = "footer">
      <h3>중고거래는, 4989!</h3>
      <div id = "footer-row">
         <div class = "column">
            <i class="fas fa-map-marker-alt"></i>
            <p>서울특별시 종로구 종로 69 YMCA 7층 </p>
         </div>
         <div class = "column">
            <i class="fas fa-phone-alt"></i>
            <p>02-4989-4989</p>
         </div>
         <div class = "column">
            <i class="fas fa-envelope"></i>
            <p>service@4989.com</p>
         </div>
      </div>
      <p id = "last">
         중고거래 플랫폼 4989 / 김성호, 김혜원, 안정하, 윤창욱
      </p>
   </div>
</body>
</html>