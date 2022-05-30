<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>비밀번호 찾기</title>
    <script type="text/javascript">
    $(document).ready(function(){
        $(".find-btn").click(function(){
            let params = $("#findForm").serialize();
            $.ajax({
                type: "POST"
                , url: "/api/find/pw"
                , data: params
                , success: function(res) {
                    if (res) {
                        /*신규비밀번호 메일로 전송하는 소스 들어갈곳*/
                        alert($("#find_email").val() + '로 신규 비밀번호를 전송하였습니다.');
                        location.href = '/';
                    } else {
                        alert("비밀번호 찾기에 실패하였습니다. 다시 시도해주세요.")
                    }
                }
            })
        })
    })
    </script>
</head>
<body>
<h3>비밀번호 찾기 화면</h3>
<form id="findForm">
    <input type="hidden" id="find_lf" name="find_lf" value="PW"/><br/>
    ID : <input type="text" id="user_id" name="user_id"/><br/>
    이름 : <input type="text" id="user_name" name="user_name"/><br/>
    전화번호 : <input type="number" id="user_phone" name="user_phone"/><br/>
    <br>
    신규비밀번호 전달받을 메일주소<br>
    <input type="text" id="find_email" name="find_email"/><br/>


    <br/>
    <input type="button" value="찾기" class="find-btn">
</form>
</body>
</html>