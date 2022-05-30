<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>가</title>
    <script type="text/javascript">
    $(document).ready(function(){
        $(".join-btn").click(function(){
            $("#user_newaddr").val($("#user_newaddr").val() + " " + $("#user_newaddr2").val())
            let params = $("#joinForm").serialize();
            $.ajax({
                type: "POST"
                , url: "/signUp"
                , data: params
                , success: function(res) {
                    if (res > 0) {
                        alert("환영합니다!");
                        location.href = "/";
                    } else {
                        alert("가입에 실패하였습니다. 다시 시도해주세요.")
                    }
                }
            })
        })
        $(".search-addr").click(function(){
            window.open("/user/search/addr", '', 'width=300, height=500')
        })

    })
    </script>
</head>
<body>
<h3>가입 화면</h3>
<form id="joinForm" action="/join", method="post">
    아이디 : <input type="text" id="user_id" name="user_id"/><br/>
    비밀번호 : <input type="password" id="user_pw" name="user_pw"/><br/>
<br/>
    이름 : <input type="text" id="user_name" name="user_name"/><br/>
<br/>
    성별 : <input type="radio" id="" name="user_gender" value="M" checked/>남성
    <input type="radio" id="" name="user_gender" value="W"/>여성<br/>
<br/>
    나이 : <input type="number" id="user_age" name="user_age"/><br/>
<br/>
    생년월일 : <input type="number" id="user_birth" name="user_birth" placeHolder="910524"/><br/>
<br/>
    주소찾기 : <button type="button" class="search-addr">검색</button><br/>
    주소 : <input type="text" id="user_newaddr" name="user_newaddr" readOnly/><br/>
    상세주소 : <input type="text" id="user_newaddr2" name="user_newaddr2"/><br/>
<br/>
    전화번호 :
    <input type="number" id="user_phone" name="user_phone" /><br/>
<br/><br/>
    <button type="button" class="join-btn">가입하기</button>

</form>
</body>
</html>