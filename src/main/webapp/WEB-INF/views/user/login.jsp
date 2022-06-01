<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<script>
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
                            location.href = "/";
                        } else {
                            alert("로그인에 실패하였습니다. 다시 시도해주세요.")
                        }
                    }
                })
            })
        })
</script>
<body>
    <div class="container my-3">
        <div class="container">
            <div class="col-lg-4" style="text-align:center;font-size:30px;font-weight:800;margin-top:60px;">
                FIM
            </div>
            <div class="col-lg-4" style="text-align:center;font-size:25px;font-weight:800;color:#888">
                Falling in MBTI
            </div>
            <div class="col-lg-4"></div>
            <div class="col-lg-4" style="margin-top:160px;">
                <div class="jumbotron" style="padding-top: 20px;">
                    <form id="loginForm">

                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="ID" name="user_id" id="user_id" maxlength="20" style="border:none;background: transparent;border-bottom:1px solid #888">
                    </div>
                    <div class="form-group" style="padding-top: 20px;">
                        <input type="password" class="form-control" placeholder="PW" name="user_pw" id="user_pw" maxlength="20" style="border:none;background: transparent;border-bottom:1px solid #888">
                    </div>
                    <input type="button" class="btn btn-primary form-control" style="background:transparent;border:none;color:#000;margin-top:30px" value="Login" id="userLoginSave">


                    </form>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="regline" style="padding-top: 20px;">

                    <div style="width:50%;float:left;text-align:center;" class="reglink">
                        <a href="/user/join">회원가입</a>
                    </div>
                    <div style="width:50%;float:left;float:left;text-align:center">
                        <a href="/find/id">아이디/비밀번호 찾기</a>
                    </div>

                </div>
            </div>

        </div>
    </div>
</body>