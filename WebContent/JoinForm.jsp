<%@page import="ClassForOur.logDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>회원가입 화면입니다</title>
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

#title{
   margin: 50px 0px;
   text-align: center;
   color: #f79320;
}


#id, #pw, #pw_check, #name, #sex, #mail, #phone, #address {
   margin: 20px auto;
   border-bottom: 1px solid #848484;
   width: 250px;
   display: flex;
   flex-wrap: wrap;
}

#birth{
   margin: 20px auto;
   width: 250px;
   display: flex;
   border-bottom: 1px solid #848484;
}

#birth div{
   width: 50px;
   margin: 0px 5px;
}

#input input{
   border: none;
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
   border: none;
   padding: 8px 15px;
   margin: 10px;
   box-shadow: 0px 3px 10px 0px rgba(0, 0, 0, .2);
   color: #F2F2F2;
   font-weight:bold;
   font-size: 14px;
   border-radius: 15px 50px;
   
}

.button:hover {
   background-color: #1C1C1C;
   color: #f79320;
}

p{
   font-size: 13px;
}
</style>

<script type="text/javascript">
function checkValue()
{
    if(!document.userInfo.userid.value){
        alert("아이디를 입력하세요.");
        return false;
    }        
    if(!document.userInfo.password.value){
        alert("비밀번호를 입력하세요.");
        return false;
    }        
    if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
    }
    if(!document.userInfo.name.value){
        alert("이름을 입력하세요.");
        return false;
    }
    if(!document.userInfo.sex.value){
        alert("성별을 입력하세요.");
        return false;
    }
    if(!document.userInfo.bir.value && !document.userInfo.bir1.value && !document.userInfo.bir2.value){
        alert("생일을 입력하세요.");
        return false;
    }
   
    if(!document.userInfo.phone.value){
        alert("전화번호를  입력하세요.");
        return false;
    }
    if(!document.userInfo.mail.value){
        alert("메일을 입력하세요.");
        return false;
    }
    if(!document.userInfo.address.value){
       alert("주소를 입력하세요")
        return false;
    }
}
</script>
</head>
<body>
 <form method="post" action="loginfoSave" name="userInfo"
         onsubmit="return checkValue()">      
         <div id="main">
         <div id = "wrap">
            <div id="title">
               <h2>회원가입</h2>
            </div>
            <div id="input">
               <div id = "id">
                  ID &nbsp;&nbsp;<input type="text" name="userid">
               </div>
               <div id = "pw">
                  PW &nbsp;<input type="password" name="password">
               </div>
               <div id = "pw_check">
                  PW 확인 &nbsp;<input type="password" name="passwordcheck">
               </div>
               <div id = "name">
                  이름 &nbsp;<input type= "text" name="name" placeholder = "홍길동">
               </div>
               <div id = "sex">
                  성별 &nbsp;<input type= "text" name="sex" placeholder = "남/여">
               </div>
               <div id = "birth">
                  생년월일 &nbsp;<div><input type="text" name="bir" maxlength="4"
                  placeholder="년(4자)" size="6"></div>
                     <select name="bir">
                        <option value="">월</option>
                        <option value="01">1</option>
                        <option value="02">2</option>
                        <option value="03">3</option>
                        <option value="04">4</option>
                        <option value="05">5</option>
                        <option value="06">6</option>
                        <option value="07">7</option>
                        <option value="08">8</option>
                        <option value="09">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                  </select>
                        <div><input type="text" name="bir" maxlength="2" placeholder="일"
                  size="4"></div>
               </div>
               <div id = "mail">
                  이메일 &nbsp;<input type= "text" name="email">
               </div>
               <div id = "phone">
                  휴대전화 &nbsp;<input type= "text" name="phone" placeholder = "(-)없이 숫자만 입력">
               </div>
               <div id = "address">
                  주소 &nbsp;<input type= "text" name="address">
               </div>
               
            </div>
            <div id="button" class="toCenter">
               <input type="submit" value="회원가입" class="button"> 
               <input type="button" value="취소" onclick="history.back()" class="button">
            </div>
         </div>
      </div>
   </form>
</body>
</html>