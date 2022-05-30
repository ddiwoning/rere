<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>아이디 찾기</title>
    <script type="text/javascript">
    $(document).ready(function(){
        $(".find-btn").click(function(){
            let params = $("#findForm").serialize();
            $.ajax({
                type: "POST"
                , url: "/api/find/id"
                , data: params
                , success: function(res) {
                    if (res) {
                        alert('ID : ' + res.user_id);
                        location.href = "/";
                    } else {
                        alert("아이디 찾기에 실패하였습니다. 다시 시도해주세요.")
                    }
                }
            })
        })
    })
    </script>
</head>
<body>
<h3>아이디 찾기 화면</h3>
<form id="findForm">
    <input type="hidden" id="find_lf" name="find_lf" value="ID"/><br/>
    이름 : <input type="text" id="user_name" name="user_name"/><br/>
    전화번호 : <input type="number" id="user_phone" name="user_phone"/><br/>
    <br/>
    <input type="button" value="찾기" class="find-btn">
</form>
</body>
</html>