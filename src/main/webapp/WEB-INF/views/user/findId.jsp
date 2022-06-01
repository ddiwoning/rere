<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
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

        $(".find-btn2").click(function(){
            let params = $("#findForm2").serialize();
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

<body>

    <div layout:fragment="content" class="container my-3">
        <div class="container">
            <div class="col-lg-4" style="text-align:center;font-size:30px;font-weight:800;margin-top:30px;">
                아이디 / 비밀번호 찾기
            </div>

            <div class="col-lg-4"></div>
            <div class="col-lg-4" style="background:#fff">
                <div class="jumbotron" style="padding-top: 20px;padding-bottom: 20px;width:90%;margin:0 auto;">
                    <h5> 아이디 찾기</h5>
                    <form id="findForm">
                        <input type="hidden" id="find_lf" name="find_lf" value="ID"/><br/>
                        <div class="mb-3">
                            <input type="text" id="user_name" name="user_name" class="form-control" placeholder="이름">
                        </div>
                        <div class="mb-3">
                            <input type="number" id="user_phone" name="user_phone" class="form-control" placeholder="휴대폰번호">
                        </div>

                        <button type="button" class="btn btn-primary find-btn" style="width:100%">확인</button>
                    </form>
                </div>
            </div>




            <div class="col-lg-4"></div>
            <div class="col-lg-4" style="background:#fff;margin-top:20px">
                <div class="jumbotron" style="padding-top: 20px;padding-bottom: 20px;width:90%;margin:0 auto;">
                    <h5> 비밀번호 찾기</h5>
                    <form id="findForm2">
                        <input type="hidden" id="find_lf" name="find_lf" value="PW"/><br/>
                        <div class="mb-3">
                            <input type="text" id="user_name" name="user_name" class="form-control" placeholder="이름">
                        </div>
                        <div class="mb-3">
                            <input type="number" id="user_phone" name="user_phone" class="form-control" placeholder="휴대폰번호">
                        </div>
                        <div class="mb-3">
                            <input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디">
                        </div>
                        <div class="mb-3">
                            <input type="text" id="find_email" name="find_email" class="form-control" placeholder="신규비밀번호 전달받을 메일주소">
                        </div>

                        <button type="button" class="btn btn-primary find-btn2" style="width:100%">확인</button>
                    </form>
                </div>
            </div>


        </div>
    </div>
</body>
