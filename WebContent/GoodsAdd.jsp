<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<style type="text/css">
body {
   font-family: 'Noto Sans KR', sans-serif;
}

#main {
   width: 860px;
   margin: 0px auto;
   border: 1px solid rgba(0, 0, 0, .1);
   box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, .2);
   padding: 30px;
}

#title {
   color: #f79320;
   margin-bottom: 30px;
}

#top select{
   width: 150px;
} 


#top input {
   width: 500px;
   margin: 0px 5px;
   padding: 5px;
}

#top, #button {
   margin: 20px 0px;
}

.toCenter {
   display: flex;
   justify-content: center;
}

#textarea {
   width: 350px;
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
   font-size: 12px;
   color: #F2F2F2;
   border-radius: 15px 30px;
   font-weight: bold;
   border: none;
   padding: 10px 15px;
   margin: 10px;
   box-shadow: 0px 3px 10px 0px rgba(0, 0, 0, .2);
}

#button input:hover {
   background-color: #1C1C1C;
   color: #f79320;
}

#content{
   display: flex;
   justify-content: center;
   
}

#price{
   display: flex;
   justify-content: center;
   margin: 10px 0px;
}

#holder{
  overflow: hidden;
  height: auto;
}

#right{
   justify-content: flex-start;
   
}
</style>

</head>
<body>
   <form action="upload" name="upload" enctype="multipart/form-data"
      method="post" onsubmit="return confirm('정말로 등록하시겠습니까?')">

      <div id="main">
         <div id="title" class="toCenter">
            <h2>상품 등록</h2>
         </div>
         <div id="top" class="toCenter">
            <select id="select" name="goodsCate">
               <option value="none">카테고리 선택</option>
               <option value="man">남성 의류</option>
               <option value="girl">여성 의류</option>
               <option value="app">가전기기</option>
               <option value="child">아동용품</option>
               <option value="ticket">상품권/티켓</option>
               <option value="travel">취미용품</option>
               <option value="computer">컴퓨터</option>
               <option value="camera">카메라</option>
               <option value="book">도서</option>
               <option value="furniture">가구</option>
            </select> <input type="text" name="goodsName" placeholder="제목을 입력하세요.">
         </div>
         <div id="content">
            <div id="left">
            <div id="holder">
               <img height="400" width="300" src="ImageFile/" id="status"
                  class="success"></div>
               <div>
                  <input type="file" name="goodsFile1">
               </div>
            </div>
            <div id="right">
               <div id = "price">
                  가격&nbsp;&nbsp;<input type="text" name="goodsPrice" placeholder="가격을입력하세요.">&nbsp;원
               </div>
               <div>
               <textarea id="textarea" name = "goodsContents"
                  placeholder="상품 설명을 입력하세요.&#13;&#10;설명은 자세할수록 좋습니다!"></textarea>
               </div>
            </div>
         </div>
            <div id="button" class="toCenter">
               <input type="submit" value="상품 등록"> 
               <input type="button" value="취소" onclick="history.back()">
            </div>

      </div>
   </form>
   <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

   <script>
      var upload = document.getElementsByTagName('input')[2], holder = document
            .getElementById('holder'), state = document
            .getElementById('status');

      upload.onchange = function(e) {
         e.preventDefault();

         var file = upload.files[0], reader = new FileReader();

         reader.onload = function(event) {
            var img = new Image();
            img.src = event.target.result;

            //if (img.width > 1) { 
            img.width = 300;
            img.height = 400;
            //}
            holder.innerHTML = '';
            holder.appendChild(img);
            holder.width = 300;
            holder.height = 400;

         };
         reader.readAsDataURL(file);
         return false;

      };
   </script>
</body>
</html>