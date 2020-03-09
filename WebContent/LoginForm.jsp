<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="EUC-KR"%>
<html>
<head>
<title>로그인 화면</title>
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<style>
body {
   font-family: 'Noto Sans KR', sans-serif;
}

#main {
   width: 480px;
   margin: 30px auto;
   border: 1px solid rgba(0, 0, 0, .1);
   box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, .2);
}

#title, #signUp {
   margin: 50px 0px;
   text-align: center;
   color: #f79320;
}

#input div {
   margin: 20px auto;
   width: 210px;
   display: flex;
   flex-wrap: wrap;
}

#input input {
   border: none;
   border-bottom: 1px solid #1C1C1C;
}

#button {
   margin: 20px 0px 50px 0px;
}

.toCenter {
   display: flex;
   justify-content: center;
}

.button {
   background-color: #f79320;
   border:none;
   font-size: 14px;
   padding: 8px 15px;
   margin: 5px;
    color: #F2F2F2;
   border-radius: 15px 30px;
   font-weight: bold;
   box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, .2);
}

.button:hover {
   background-color: #1C1C1C;
   color: #f79320;
}

p {
   font-size: 13px;
}
</style>
<script type="text/javascript">
   function checkValue() {

      if (!document.userInfo1.userid.value) {
         alert("아이디를 입력하세요");
         return false;
      }
      if (!document.userInfo1.password.value) {
         alert("비밀번호를 입력하세요");
         return false;
      }
   }
</script>
</head>
<body>
   <form method="post" action="LoginServlet" name="userInfo1"
      onsubmit="return checkValue()">
      <div id="main">
         <div>
            <div id="title">
               <h2>로그인</h2>
            </div>
            <div id="input">
               <div>
                  ID &nbsp;&nbsp;<input type="text" name="userid">
               </div>
               <div>
                  PW &nbsp;<input type="password" name="password">
               </div>
            </div>
            <div id="button" class="toCenter">
               <input type="submit" value="로그인" class="button"> <input
                  type="reset" value="다시 입력" class="button">
            </div>
            <div id="signUp">
               <div class="toCenter">
                  <p>아직 회원이 아니시라면...</p>
               </div>
               <a href = "main.jsp?stat=join"><input type="button" value="회원가입" class="button"
                  class="toCenter"></a>
            </div>
         </div>
      </div>
   </form>
</body>
</html>