<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시창</title>
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
   padding: 30px;
}

#title {
   color: #f79320;
   margin-bottom: 30px;
}

#top input {
   width: 500px;
   padding: 5px;
}

#top, #button {
   margin: 10px 0px;
}

.toCenter {
   display: flex;
   justify-content: center;
}

#textarea {
   width: 505px;
   height: 340px;
   margin: 10px 10px;
   word-break: break-all;
   word-wrap: break-word;
}

#button {
   margin: 20px;
}

#button input {
   background-color: #f79320;
   font-size: 1em;
   border: none;
   padding: 10px 15px;
   margin: 10px;
   box-shadow: 0px 3px 10px 0px rgba(0, 0, 0, .2);
   color: #F2F2F2;
   border-radius: 15px 30px;
   font-weight: bold;
}

#button input:hover {
   background-color: #1C1C1C;
   color: #f79320;
}

#content{
   display: flex;
   justify-content: center;
   
}

</style>
</head>
<body>
   <form action="notice_db" method="post" ENCTYPE="multipart/form-data"
      onsubmit="return confirm('정말로 등록하시겠습니까?')">
      <div id="main">
         <div id="title" class="toCenter">
            <h2>공지사항 등록</h2>
         </div>
         <div id="top" class="toCenter">
            <input type="text" name="subject" placeholder="제목을 입력하세요.">
         </div>
         <div id="content">
            <div>
               <textarea id="textarea" name ="content" placeholder="내용을 입력하세요."></textarea>
            </div>
         </div>
         <div id="button" class="toCenter">
            <input type="submit" value="등록"> 
            <input type="button" value="취소" onclick="history.back()">
         </div>

      </div>
   </form>