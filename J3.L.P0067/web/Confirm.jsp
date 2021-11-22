<%-- 
    Document   : Confirm
    Created on : Nov 5, 2021, 9:17:49 AM
    Author     : VinhNM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Feast Booking</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/5e79e0a5fc.js" crossorigin="anonymous"></script>
    </head>
    <body onload="fade()">
        <div class="background" id="snackbar">${param.message==1? 'thao tác thành công' : 'thao tác không thành công'}</div>
        <script>
            function fade() {
                var x = document.getElementById("snackbar");
                x.className = "background";
                if (${param.message==1}) {
                    x.className = x.className.replace("background", "");
                }
                setTimeout(function () {
                    document.getElementById('snackbar').style.display = 'none';
                }, 3000);

            }
        </script> 
    </body>
</html>
