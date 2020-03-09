<%@page import="ClassForOur.ReplyDao"%>
<%@page import="java.util.List"%>

<%@page import="ClassForOur.Reply"%>
<%@page import="ClassForOur.BoardDao"%>
<%@page import="ClassForOur.AddGoods"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래는, 4989!</title>
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<Style>
body {
   font-family: 'Noto Sans KR', sans-serif;
}

#main {
   border: 1px solid black;
   width: 860px;
   margin: 0 auto;
   border: 1px solid rgba(0, 0, 0, .1);
   box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, .2);
}

#title {
   margin: 30px 60px;
   overflow: hidden;
}

#title_info {
   color: #848484;
   font-size: 13px;
}

#cat, #boardNum, #hit  {
   float: left;
}

#date, #writer {
   float: right;
   margin-right: 30px;
}

#mid_info, #content {
   display: flex;
   justify-content: center;
   margin: 20px 0px;
}

#img {
   margin: 10px 5px;
}

#mid {
   width: 250px;
   height: 400px;
   display: block;
   margin: 10px 0px 0px 0px;
}

#price {
   text-align: center;
   padding: 100px 0px;
}

#mid-btn {
   display: flex;
   flex-wrap: wrap;
   justify-content: center;
}

#mid-btn button {
   width: 200px;
   margin: 5px; 
   background-color : #f79320;
   border: none;
   padding: 10px 20px;
   box-shadow: 0px 3px 10px 0px rgba(0, 0, 0, .2);
   background-color: #f79320;
   font-size: 12px;
   color: #F2F2F2;
   border-radius: 15px 30px;
   font-weight: bold;
}

#mid-btn button:hover {
   background-color: #1C1C1C;
   color: #f79320;
}

#content {
   border: 1px solid rgba(0, 0, 0, .2);
   width: 550px;
   height: 300px;
   margin: 20px auto 30px;
}

#reply{
   border: 1px solid rgba(0, 0, 0, .2);
   width: 550px;
   height: auto;
   margin: 30px auto;
   padding-bottom: 20px;
}

#reply_wrap{
   margin: 10px 30px;
}

#re_text{
   width: 400px;
   height:80px;
}

#reply_content{
   margin: 10px 30px;
   display: flex;
   justify-content: center;
}

#reply_content textarea{
   width: 400px;
}

.re_btn{
   background-color : #f79320;
   border: none;
   padding: 10px 10px;
   box-shadow: 0px 3px 10px 0px rgba(0, 0, 0, .2);
   background-color: #f79320;
   margin-left: 10px;
   font-size: 12px;
   color: #F2F2F2;
   border-radius: 15px 30px;
   font-weight: bold;
}

.re_btn:hover{
   background-color: #1C1C1C;
   color: #f79320;
}

hr {
   border: 0;
   height: 1px;
   background-image: linear-gradient(to right, rgba(0, 0, 0, 0),
      rgba(247, 147, 32, 0.75), rgba(0, 0, 0, 0));
}

#bottom_btn{
   display:flex;
   justify-content: center;
   margin: 30px;
}

#bottom_btn input{
   background-color : #f79320;
   border: none;
   padding: 10px 20px;
   box-shadow: 0px 3px 10px 0px rgba(0, 0, 0, .2);
   margin: 0px 10px;
   font-size: 12px;
   color: #F2F2F2;
   border-radius: 15px 30px;
   font-weight: bold;
}

#bottom_btn input:hover{
   background-color: #1C1C1C;
   color: #f79320;
}

#re_id{
   color:#f79320;
}

#re_date{
   color:#848484;
   font-size: 13px;
}

#re_delete{
   float: right;
   background-color : #f79320;
   border: none;
   padding: 5px 10px;
   box-shadow: 0px 3px 10px 0px rgba(0, 0, 0, .2);
   font-size: 12px;
   color: #F2F2F2;
   border-radius: 15px 30px;
   font-weight: bold;
}

#re_delete:hover{
   background-color: #1C1C1C;
   color: #f79320;
}

#re_view{
   margin: 10px 0px;
}   

</Style>
<script type="text/javascript">
	function link() {
		if (<%=session.getAttribute("sessionID")%>==null) {
			alert("로그인을 해주세요")
            return false;
		}else if (!document.rep.recontent.value){
			alert("댓글 내용을 입력해주세요")
			return false;
		}
		
	}
</script>

</head>
<body>

   <%
      //리퀘스트값 보여주는 곳에서. 전페이지에서 아이디를 가져옴
      String id = (String)request.getParameter("id");
      AddGoods addgoods = BoardDao.getInstance().selectOne(id);
      String renum = request.getParameter("renum");

      addgoods.setHit(addgoods.getHit() + 1);
      BoardDao.getInstance().update(addgoods);
      List<Reply> list = ReplyDao.getInstance().selectOne(id);
   %>

   <div id="main">
      <div id="title">
         <div>
            <h2><%=addgoods.getGoodsName()%></h2>
         </div>
         <div id="title_info">
            <span id = "boardNum">글 번호: &nbsp;<%=addgoods.getId()%></span>
            <br>
            <span id="cat">카테고리:&nbsp; <%=addgoods.getGoodsCate()%></span> 
            <span id="writer">작성자:&nbsp; <%=addgoods.getUserId()%></span> 
            <br>
            <span id = "hit">조회수: &nbsp;<%=addgoods.getHit()%></span>
            <span id="date">작성일:&nbsp;<%=addgoods.getGoodsdate()%></span>
         </div>
      </div>
      <hr>
      <div id="mid_info">
         <div id="img">
            <img height="400" width="300"
               src="ImageFile/<%=addgoods.getGoodsFile1()%>">
         </div>
         <div id="mid">
            <div id="price">
               <h4>
                  가격 &nbsp;&nbsp;<%=addgoods.getGoodsPrice()%>&nbsp;원
               </h4>
            </div>
            <div id="mid-btn">
               <div>
                  <a href="marketadd.jsp?id=<%=id%>&item=<%=addgoods.getGoodsName()%>"><button  onclick="return confirm('즐겨찾기에 추가하시겠습니까?')">즐겨찾기</button>
               </a></div>
               <div>
                 <a href="main.jsp?sell=<%=id%>" onclick="return link()"><button>바로 구매</button></a>
               </div>
            </div>
         </div>
      </div>
      <div id="content"><%=addgoods.getGoodsContents()%>
      </div>
      
      <hr>
      <!-- 댓글창 -->
      <div id="reply">
         <div id="reply_wrap">
            <div id="reply_title">
               <h4>댓글</h4>
            </div>

            <!-- 기존 댓글 불러오기 -->
            <%
         for (Reply b : list)
         {
         %>

            <div id="re_view">
               <div id="re_view_info">
                  <span id = "re_id">아이디: <%=b.getReid()%></span> 
                  <span id = "re_date">작성일 <%=b.getRedate()%></span>
                  <%
            if(session.getAttribute("sessionID") != null){
            String sessionid =(String)session.getAttribute("sessionID");
            String userid = (String)b.getReid();
 			if(sessionid.equals(userid) || sessionid.equals("master"))	
            {
            %>
                  <span><input id = "re_delete" type="button" value="댓글 삭제"
                     onclick="location.href='ReplyDelete.jsp?id=<%=id%>&renum=<%=b.getRenum()%>'"></span>
               </div>
               <%}}%>
               <div id="re_view_content">
                  <%=b.getRecontent()%>
               </div>
            </div>

            <%
         }
         %>


            <!-- 댓글 등록 -->
            <form action="replyservlet" method="post" name ="rep">
               <div id="reply_content">
                  <div>
                     <textarea id="re_text" name="recontent" placeholder = "로그인 해야 댓글을 달 수 있습니다."></textarea>
                  </div>
                  <div>
                     <input class="re_btn" type="submit" value="댓글 등록" onclick="return link()"> <input
                        type="hidden" name="reid" value="<%=addgoods.getUserId()%>">
                     <input type="hidden" name="boardnum" value="<%=id%>">
                  </div>
               </div>
            </form>
         </div>
      </div>
         
         <!-- 하단 버튼 -->
         <div id="bottom_btn">
            <input type="button" value="목록으로" onclick="location.href='main.jsp'">
            <%
            if(session.getAttribute("sessionID") != null){
            String sessionid =(String)session.getAttribute("sessionID");
            String userid = (String)addgoods.getUserId();
 			if(sessionid.equals(userid) || sessionid.equals("master"))	
            {
            %>
            <input type="button" value="삭제"
               onclick = "delete_check()"> <input
               type="button" value="수정"
               onclick="location.href='main.jsp?update=<%=id%>'">
        <%}} %>
         </div>
	</div>
<script>
   function delete_check(){
      if(confirm('정말로 삭제하시겠습니까?')){
         location.href="Delete.jsp?id=<%=id%>";
      }else{
         return false;         
      }
   }
   
</script>


</body>

</html>