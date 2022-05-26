<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인</title>
    <script type="text/javascript"> //자바스크립트를 쓴다는 것
    $(document).ready(function(){
        $("#userLoginSave").click(function(){ //버튼 이름이 userLoginSave
            let params = $("#loginForm").serialize();
            $.ajax({
                type: "POST"
                , url: "/loginCheck"
                , data: params
                , success: function(res) {
                    if (res > 0) {
                        alert("환영합니다!");
                        location.href = "/main";
                    } else {
                        alert("로그인에 실패하였습니다. 다시 시도해주세요.")
                    }
                }
            })
        })
    })
    </script>
</head>
<body>
<h3>로그인 화면</h3>
<form id="loginForm" action="/loginProc", method="post">
    아이디 : <input type="text" id="user_id" name="user_id"/><br/>
    비밀번호 : <input type="password" id="user_pw" name="user_pw"/><br/>
    <br/>
    <input type="submit" value="로그인">


</form>
</body>
</html>