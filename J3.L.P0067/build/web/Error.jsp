<%-- 
    Document   : Error
    Created on : Nov 3, 2021, 12:39:14 AM
    Author     : VinhNM
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/servicelist.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <div class="container">
            <div class="error-text">${error}</div>
        </div>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
