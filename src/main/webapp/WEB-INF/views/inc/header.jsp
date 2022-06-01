<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/style.css">
    <script type="text/javascript" src="/bootstrap.min.js" ></script>
    <script type="text/javascript" src="/common.js" ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Hello, sbb!</title>
</head>
<%@ include file="/WEB-INF/views/inc/navbar.jsp" %>
<div class="modal" id="msg_popup" tabindex="-1" role="dialog" style="display:none">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <!-- MSG Space-->
            </div>
            <div class="modal-footer" id="btn_confirm">
                <button type="button" id="confirm_yes" class="btn btn-primary" data-dismiss="modal" >YES</button>
                <button type="button" id="confirm_no"class="btn btn-secondary" data-dismiss="modal">NO</button>
            </div>
            <div class="modal-footer" id="btn_alert">
                <button type="button" id="alert_ok"class="btn btn-primary" data-dismiss="modal" >OK</button>
            </div>
        </div>
    </div>
</div>
