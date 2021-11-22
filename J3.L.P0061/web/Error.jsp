<%-- 
    Document   : Error
    Created on : Oct 19, 2021, 7:06:31 PM
    Author     : VinhNM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Eror</title>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <div class="container">
            <div class="error-text">${error}</div>
        </div>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
