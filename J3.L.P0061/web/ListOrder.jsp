<%-- 
    Document   : List Order
    Created on : Oct 19, 2021, 7:06:31 PM
    Author     : VinhNM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>List order</title>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <div class="container">
            <div class="menu">
                <a href="#" class="item-menu">Thông tin</a>
                <a href="#" class="item-menu">Ảnh</a>
                <a href="#" class="item-menu">Thực đơn</a>
                <a href="#" class="item-menu">Combo món ăn</a>
                <a href="#" class="item-menu">Dịch vụ</a>
                <a href="#" class="item-menu">Khuyến mãi</a>
                <a href="Orders" class="select-item">Đơn hàng</a>
            </div>
            <div class="title-page">
                <h1>Đơn hàng</h1>
            </div>
            <form class="search" action="Orders" method="GET">
                <div class="one-box">
                    <div class="box-search">Mã đơn hàng:</div>
                    <input  name="idOrder" class="txt-box" type="number" placeholder="Nhập mã đơn hàng" value="${id}"/>
                </div>
                <div class="one-box">
                    <button class="btn-search" type="submit"><img class="image-search" src="images/search.png" alt=""/></button>
                </div>
            </form>
            <c:if test="${check eq true}">
                <div class="space-list">
                    <table class="list">
                        <col style="width:6%">
                        <col style="width:20%">
                        <col style="width:35%">
                        <col style="width:20%">
                        <col style="width:20%">
                        <tr style="background-color: green; height: 30px">
                            <td class="title-list">Mã đơn</td>
                            <td class="title-list title-right">Tổng tiền (VNĐ)</td>
                            <td class="title-list title-center">Ngày đặt</td>
                            <td class="title-list title-left">Trạng thái</td>
                            <td class="title-list"></td>
                        </tr>
                        <c:if test="${size < 1}">
                            <tr class="row-item">
                                <td colspan="4" style="font-weight: bold; text-align: left; padding: 10px">Không có kết quả</td>
                            </tr>
                        </c:if>
                        <c:if test="${size > 0}">
                            <c:forEach items="${orders}" var="od">
                                <tr class="row-item">
                                    <td  class="text-service">${od.id}</td>
                                    <td class="text-normal title-right">${od.totalMoneyAll}</td>
                                    <td class="text-center">${od.dateOrder}</td>
                                    <td class="text-left" style="padding-left: 10px">${od.status}</td>
                                    <td>
                                        <form action="editOrder" method="GET">
                                            <input name="idDetail" type="hidden" value="${od.id}"/>
                                            <input name="idOrder" type="hidden" value="${id}"/>
                                            <input name="index" type="hidden" value="${index}"/>
                                            <button id="detail${od.id}" class="button-detail">
                                                <img class="image-search" src="images/detail.png" alt=""/>Chi tiết
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </table>
                    <c:if test="${totalPage > 1}">
                        <div class="keepLine">
                            <c:if test="${index > 1}">
                                <a href="Orders?idOrder=${id}&index=${index - 1}" class="btn-pagging">Trang trước</a>
                            </c:if>
                            <c:forEach begin="1" end="${totalPage}" var="a">
                                <%-- If the page number is the current page, bold text is displayed --%>
                                <c:if test="${a eq index}">
                                    <strong class="number-page-select">${a}</strong>
                                </c:if>
                                <%-- If the page number is not the current page, show the link --%>
                                <c:if test="${a ne index}">
                                    <a class="number-page" href="Orders?idOrder=${id}&index=${a}">${a}</a>
                                </c:if>
                            </c:forEach>
                            <c:if test="${index < totalPage}"><a href="Orders?idOrder=${id}&index=${index + 1}"  class="btn-pagging">Trang sau</a></c:if>
                            </div>
                        </div>
                </c:if>
            </c:if>
            <c:if test="${check eq false}">
                <div class="nofi-error">${error}</div>
            </c:if>
        </div>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
