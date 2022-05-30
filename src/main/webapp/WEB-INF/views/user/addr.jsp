<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        html,
        body {
            height: 100%;
            margin: 0;
        }

        #container {
            width: 100%;
            height: 100%;
        }
    </style>
</head>

<body>
    <div id="container"></div>
    <script>
        new daum.Postcode({
            width: '100%',
            height: '100%',
            oncomplete: function(data) {
                $("#user_newaddr", opener.document). val(data.address);
                self.close();
            }
        }).embed(document.querySelector('#container'));
    </script>
</body>

</html>