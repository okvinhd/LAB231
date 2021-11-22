<%-- 
    Document   : Order Detail
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
        <title>Order Detail</title>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <div class="container"><div id="overlay"></div></div>
        <div class="form-popup" id="popup-detail${detail.id}">
            <div class="title-popup">Chi tiết đơn hàng<a href="Orders?idOrder=${id}&index=${index}" class="btn-x-popup" id="detail${detail.id}">&times;</a></div>

            <c:if test="${errorEdit !=null}">
                <div><p style="color: red; margin-left: 100px;">${errorEdit}</p></div>
                </c:if>
            <div class="main-popup">
                <div class="left-popup">
                    <c:if test="${errorEdit ==null}">
                        <c:if test="${status eq '3'}">
                            <div class="mark-accept">Đã nhận đơn thành công</div>
                        </c:if>
                        <c:if test="${status eq '4'}">
                            <div class="mark-cancel">Đã huỷ đơn</div>
                        </c:if>
                    </c:if>
                    <div class="title-popup title-info-popup">Thông tin đơn hàng</div>
                    <div class="keepLine">
                        <div class="title-detail">Mã số đơn hàng: </div>
                        <div class="data-popup">${detail.id}</div>
                    </div>
                    <div class="keepLine">
                        <div class="title-detail">Loại bàn: </div>
                        <div class="data-popup">${detail.typeTable}</div>
                    </div>
                    <div class="keepLine">
                        <div class="title-detail">Số lượng khách: </div>
                        <div class="data-popup">${detail.numberGuest}</div>
                    </div>
                    <div class="keepLine">
                        <div class="title-detail">Thời gian đặt: </div>
                        <div class="data-popup">${detail.dateOrder}</div>
                    </div>
                    <div class="keepLine">
                        <div class="title-detail">Thời gian tổ chức: </div>
                        <div class="data-popup">${detail.time} ${detail.beginDate}</div>
                    </div>
                    <div class="keepLine">
                        <div class="title-detail">Ghi chú: </div>
                        <div class="data-popup">${detail.note}</div>
                    </div>
                    <div class="keepLine info-status">
                        <div class="title-detail color-status">Trạng thái: </div>
                        <div class="data-popup color-status">${detail.status}</div>
                    </div>
                    <div class="keepLine">
                        <div class="title-detail total-money-popup">Tổng tiền: </div>
                        <div class="title-detail total-money-popup">${detail.totalMoneyAll} VNĐ</div>
                    </div>
                    <div class="keepLine">
                        <div class="title-detail total-money-popup">Tổng đặt cọc (10%):</div>
                        <div class="title-detail total-money-popup">${detail.totalMoneyAll / 100 * 10} VNĐ</div>
                    </div>
                    <c:if test="${detail.status ne 'Đã huỷ' and detail.status ne 'Đã hoàn thành'}">
                        <div class="keepLine">
                            <form id="form-accept" action="editOrder" method="POST">
                                <c:if test="${detail.status ne 'Đã đặt'}">
                                    <input type="hidden" name="status" value="3"/>
                                    <input type="hidden" name="idDetail" value="${detail.id}"/>
                                    <input type="hidden" name="idOrder" value="${id}"/>
                                    <input type="hidden" name="index" value="${index}"/>
                                    <div onclick="clickAcceppt()" class="btn-accept">Nhận đơn</div>
                                </c:if>
                            </form>
                            <form id="form-cancel" action="editOrder" method="POST">
                                <input type="hidden" name="status" value="4"/>
                                <input type="hidden" name="idDetail" value="${detail.id}"/>
                                <input type="hidden" name="idOrder" value="${id}"/>
                                <input type="hidden" name="index" value="${index}"/>
                                <div onclick="clickCancel()" class="btn-cancel">Huỷ đơn</div>
                            </form>
                        </div>
                    </c:if>
                </div>
                <div class="right-popup">
                    <div class="title-food-popup">Món ăn</div>
                    <table class="list">
                        <col style="width:20px">
                        <col style="width:200px;">
                        <col style="width:133.1625px">
                        <col style="width:133.1625px">
                        <tr style="background-color: green">
                            <td class="title-list">#</td>
                            <td class="title-list title-left">Tên món ăn</td>
                            <td class="title-list title-right">Giá (VNĐ)</td>
                            <td class="title-list title-right">Số lượng</td>
                        </tr>
                        <c:forEach items="${detail.food}" var="f">
                            <tr class="row-item">
                                <td class="text-service">${f.numberOrder}</td>
                                <td class="text-normal title-left">${f.name}</td>
                                <td class="title-right">${f.price}</td>
                                <td class="title-right">${f.quantity}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="total-money-popup money-food">Tổng tiền món ăn: ${detail.totalMoneyFood} VNĐ</div>
                    <div class="title-food-popup">Combo món ăn</div>
                    <table class="list">
                        <col style="width:20px">
                        <col style="width:200px;">
                        <col style="width:133.1625px">
                        <col style="width:133.1625px">
                        <tr style="background-color: green">
                            <td class="title-list">#</td>
                            <td class="title-list title-left">Tên combo món ăn</td>
                            <td class="title-list title-right">Giá (VNĐ)</td>
                            <td class="title-list title-right">Số lượng</td>
                        </tr>
                        <c:forEach items="${detail.comboFood}" var="c">
                            <tr class="row-item">
                                <td class="text-service">${c.numberOrder}</td>
                                <td class="text-normal title-left">${c.name}</td>
                                <td class="title-right">${c.price}</td>
                                <td class="title-right">${c.quantity}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="total-money-popup money-food">Tổng tiền combo món ăn: ${detail.totalMoneyComboFood} VNĐ</div>
                    <div class="title-food-popup">Dịch vụ</div>
                    <table class="list">
                        <col style="width:20px">
                        <col style="width:200px;">
                        <col style="width:133.1625px">
                        <col style="width:133.1625px">
                        <tr style="background-color: green">
                            <td class="title-list">#</td>
                            <td class="title-list title-left">Tên dịch v</td>
                            <td class="title-list title-right">Giá (VNĐ)</td>
                            <td class="title-list title-right">Số lượng</td>
                        </tr>
                        <c:forEach items="${detail.service}" var="s">
                            <tr class="row-item">
                                <td class="text-service">${s.numberOrder}</td>
                                <td class="text-normal title-left">${s.name}</td>
                                <td class="title-right">${s.price} </td>
                                <td class="title-right">${s.quantity}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="total-money-popup money-food">Tổng tiền dịch vụ: ${detail.totalMoneyService} VNĐ</div>
                </div>
            </div>
            <div class="footer-popup">
                <a href="Orders?idOrder=${id}&index=${index}" class="btn-close-popup" id="detail${detail.id}">Trở lại</a>
            </div>
        </div>
        <jsp:include page="Footer.jsp"/>
        <script>
            function openAccept() {
                document.getElementById("accept-form").style.display = "block";
            }

            function openCancel() {
                document.getElementById("cancel-form").style.display = "block";
            }

            function clickAcceppt() {
                if (confirm("Bạn muốn nhận đơn này?") === true) {
                    document.getElementById("form-accept").submit();
                }
            }

            function clickCancel() {
                if (confirm("Bạn muốn huỷ đơn này?") === true) {
                    document.getElementById("form-cancel").submit();
                }
            }
        </script>
    </body>
</html>
