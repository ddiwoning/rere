<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
    $(".join-btn").click(function(){

        var user_pw = $("#user_pw");
        var user_pw2 = $("#user_pw2");

        if(!user_pw.val() || !user_pw2.val() ){
            return;
        }

        if(user_pw.val() != user_pw2.val() ){
            return;
        }

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

<body>
    <div layout:fragment="content" class="container my-3">
        <div class="container">
            <div class="col-lg-4" style="text-align:center;font-size:30px;font-weight:800;margin-top:30px;">
                회원가입
            </div>

            <div class="col-lg-4"></div>
            <div class="col-lg-4" style="background:#fff">
                <div class="jumbotron" style="padding-top: 20px;padding-bottom: 20px;width:90%;margin:0 auto;">
                    <form id="joinForm">
                        <div class="mb-3">
                            <input type="text" id="user_name" name="user_name" class="form-control" placeholder="이름">
                       </div>
                        <div class="mb-3">
                            <input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디(이메일)">
                        </div>
                        <div class="mb-3">
                            <input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="비밀번호">
                        </div>
                        <div class="mb-3">
                            <input type="password" id="user_pw2" name="user_pw2" class="form-control" placeholder="비밀번호확인">
                        </div>
                        <div class="mb-3">
                            <input type="text" id="user_birth" name="user_birth" class="form-control" placeholder="생년월일">
                        </div>
                        <div class="mb-3">
                            <input type="number" id="user_phone" name="user_phone" class="form-control" placeholder="휴대폰번호">
                        </div>
                        <div class="mb-3" style="background:#f0f0f0;border-radius:5px;height:35px;line-height:35px">
                            <label style="padding-left:10px;color:#666">성별</label>

                            <input type="radio" id="" name="user_gender" value="M" style="margin-left:50px;color:#666" checked>
                            <label for="usersexM">남</label>
                            <input type="radio" id="" name="user_gender" value="F" style="margin-left:50px;color:#666">
                            <label for="usersexF">여</label>
                        </div>

                        <div class="mb-3">
                            <button type="button"  class="btn btn-primary search-addr" style="width:100%">주소찾기</button><br><br>
                            <input type="text" id="user_newaddr" name="user_newaddr" readOnly class="form-control" placeholder="주소"><br>
                            <input type="text" id="user_newaddr2" name="user_newaddr2" class="form-control" placeholder="상세주소">
                        </div>

                        <button type="button"  class="btn btn-primary join-btn" style="width:100%">회원가입</button>
                    </form>
                </div>
            </div>


        </div>

    </div>
</body>
