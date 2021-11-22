<%-- 
    Document   : Services
    Created on : Nov 3, 2021, 12:38:03 AM
    Author     : VinhNM
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="js/list.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body >
        <jsp:include page="Header.jsp"/>
        <div class="container">
            <header>
                <ul>
                    <li><a href="#home">Thông tin</a></li>
                    <li><a href="#news">Ảnh</a></li>
                    <li><a   id="alwaysHover" href="#contact">Thực đơn</a></li>
                    <li><a href="#about">Combo món ăn</a></li>
                    <li><a href="#news">Dịch vụ</a></li> 
                    <li><a href="#contact">Khuyến mãi</a></li>
                    <li><a href="#about">Đơn hàng</a></li>
                </ul>
            </header>
            <div class="title-page">
                <h1>Món ăn</h1>
            </div>
            <form class="search" action="Service" method="GET">
                <div class="one-box">
                    <div class="box-search">Tên món ăn:</div>
                    <input name="nameService" class="txt-box" type="text" placeholder="Nhập tên món ăn" maxlength="50" value="${nameService}"/>
                </div>
                <div class="one-box">
                    <div class="box-search">Loại hình:</div>
                    <select name="idTypeService" class="combo-box">
                        <option value="0">Tất cả</option>
                        <c:forEach items="${typeService}" var="ts">
                            <option value="${ts.id}" ${idService == ts.id ? 'selected' : ""}>${ts.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="one-box">
                    <button class="btn-search" type="submit"><i class="fas fa-search"></i></button>
                </div>
                <a onclick="openForm()" class="btn-add"><i class="far fa-plus-square"></i>Thêm món ăn</a>
            </form>
            <c:if test="${check eq false}"><h1 class="nofi-error">${error}</h1></c:if>
            <c:if test="${check eq true}">
                <div class="space-list">
                    <table class="list">
                        <col style="width:25px">
                        <col style="width:400px">
                        <col style="width:250px">
                        <col style="width:250px">
                        <col style="width:250px">
                        <col style="width:150px">
                        <tr style="background-color:  #198754; height: 30px">
                            <td class="title-list">#</td>
                            <td class="title-list">Tên món ăn</td>
                            <td class="title-list" style="text-align: right;padding-right: 10%;">Giá</td>
                            <td class="title-list ">Loại món ăn</td>
                            <td class="title-list">Trạng thái</td>
                            <td class="title-list"></td>
                        </tr>
                        <c:if test="${totalItem > 0}">
                            <c:forEach items="${listService}" var="ls" varStatus="loop">
                                <tr class="row-item">
                                    <td class="text-service">${loop.index+1}</td>
                                    <td class="text-service">${ls.name}</td>
                                    <td class="text-service" style="text-align: right;padding-right: 5%;">${ls.price} VNĐ</td>
                                    <td class="text-service">${ls.type}</td>
                                    <td>${ls.status}</td>
                                    <td><button id="service${ls.id}" onclick="openFormDetail(this)" class="button-edit"><i class="fas fa-edit"></i>Sửa</button></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${totalItem eq 0}">
                            <tr class="row-item">
                                <td colspan="6" class="text-service">Không có dữ liệu</td>
                            </tr>
                        </c:if>
                    </table>
                    <div class="keepLine">
                        <c:if test="${index > 1}"><a href="Service?nameService=${key}&idTypeService=${idService}&index=${index-1}" class="btn-pagging" href="">Trang trước</a></c:if>
                        <c:forEach begin="1" end="${totalPage}" var="a">
                            <%-- If the page number is the current page, bold text is displayed --%>
                            <c:if test="${a eq index}">
                                <strong class="number-page-select">${a}</strong>
                            </c:if>
                            <%-- If the page number is not the current page, show the link --%>
                            <c:if test="${a ne index}">
                                <a class="number-page" href="Service?nameService=${key}&idTypeService=${idService}&index=${a}">${a}</a>
                            </c:if>
                        </c:forEach>
                        <c:if test="${index < totalPage}"><a href="Service?nameService=${key}&idTypeService=${idService}&index=${index+1}"  class="btn-pagging" href="">Trang sau</a></c:if>
                        </div>
                    </div>
                    <div id="overlay"></div>
                </div>
            <jsp:include page="Footer.jsp"/>
            <c:forEach items="${listService}" var="ls">
                <form action="EditController?nameService=${nameService}&idTypeService=${idService}&index=${index}" method="POST" class="form-popup" id="detailservice${ls.id}">
                    <div class="header-popup">
                        <div class="title-popup">Chi tiết món ăn</div>
                        <div id="detailservice${ls.id}" onclick="closeFormDetail(this)" class="button-close">&times;</div>
                    </div>
                    <div class="main-popup">
                        <c:if test="${param.message == 3}">
                            <div class="title-popup" style="color: green;">Thành công</div>       
                        </c:if>
                        <c:if test="${param.message == 4}">
                            <div class="title-popup" style="color: red;">Lỗi Hệ Thống</div>       
                        </c:if>
                        <div style="display: flex;justify-content:  center;">
                            <img id="mark-image-detail-${ls.id}" class="image-add" src="images/${ls.image}"/>
                        </div>
                        <input id="rawimage-detail-${ls.id}" name="edit-imageService" type="hidden" value="${ls.image}"/>
                        <input id="image-detail-${ls.id}" name="edit-imageServiceraw" class="choose-file" type="file" onchange="chooseImageDetail(this)"/>
                        
                        <div class="title-popup">Mã món ăn:</div>
                        <input class="box-popup" name="edit-idService" type="text" placeholder="Nhập tên món ăn" value="${ls.id}" readonly="readonly"/>
                        <div class="title-popup">Tên món ăn:</div>
                        <input oninput="checkEachInputEdit(this)" id="name-service-${ls.id}" class="box-popup" name="edit-nameService" type="text" maxlength="50" placeholder="Nhập tên món ăn" value="${ls.name}"/>
                        <div id="warning-name-${ls.id}" class="warning">Vui lòng nhập tên</div>
                        <div class="title-popup">Loại hình:</div>
                        <select class="combobox-popup" name="edit-idTypeService" class="combo-box">
                            <c:forEach items="${typeService}" var="ts">
                                <option value="${ts.id}" ${ls.typeCode eq ts.id ? 'selected' : ""}>${ts.name}</option>
                            </c:forEach>
                        </select>
                        <div class="title-popup">Trạng thái:</div>
                        <select class="combobox-popup" name="edit-statusService" class="combo-box">
                            <option value="true" ${ls.status eq "Đang kinh doanh" ? 'selected' : ""}>Đang kinh doanh</option>
                            <option value="false" ${ls.status ne "Đang kinh doanh" ? 'selected' : ""}>Không kinh doanh</option>
                        </select>
                        <div class="title-popup">Giá món ăn:</div>
                        <input oninput="checkEachInputEdit(this)" id="price-service-${ls.id}"  class="box-popup" name="edit-priceService" type="number" placeholder="Nhập giá món ăn" value="${ls.price}"/>
                        <div id="warning-price-${ls.id}" class="warning">Vui lòng nhập giá hợp lệ, nhỏ hơn 100.000.000 VNĐ và lớn hơn 999 VNĐ</div>
                        <div class="title-popup">Mô tả:</div>
                        <textarea oninput="changeDescriptionEdit(this)"  id="description-service-${ls.id}" class="box-popup" name="edit-descriptionService" maxlength="200" placeholder="Mô tả món ăn">${ls.decription}</textarea></div>
                    <div id="warning-description-${ls.id}" class="warning">Vui lòng nhập mô tả</div>
                    <div class="footer-popup">
                        <div  style="display: none" id="fake-btn-${ls.id}" onclick="checkInputEdit(this)" class="btn-save fake-btn-save">Lưu</div>
                        <button id="real-btn-${ls.id}" type="submit" class="btn-save">Lưu</button>
                        <a id="detailservice${ls.id}" onclick="closeFormDetail(this)" class="btn-back">Trở lại</a>
                    </div>
                </form>

            </c:forEach>
        </c:if>
        <form action="AddController?nameService=${nameService}&idTypeService=${idService}&index=${index}" method="POST" class="form-popup" id="myForm">
            <div class="header-popup">
                <div class="title-popup">Thêm món ăn</div>
                <div onclick="closeForm()" class="button-close">&times;</div>
            </div>
            <div class="main-popup">
                <c:if test="${param.message == 1}">
                    <div class="title-popup" style="color: green;">Thành công</div>       
                </c:if>
                <c:if test="${param.message == 0}">
                    <div class="title-popup" style="color: red;">Lỗi Hệ Thống</div>       
                </c:if>
                <div id="mark-image" class="text-file">Chọn ảnh hoặc đổi ảnh</div>
                <div id="warning-image" class="warning">Vui lòng chọn ảnh</div>
                <div style="display: flex;justify-content:  center;">
                    <img id="show-image" class="image-short"/>
                </div>
                
                <input id="files" name="add-imageService" class="choose-file" type="file" onchange="chooseImage()"/>
                <div class="title-popup">Tên món ăn:</div>
                <input oninput="changeName()" id="name-service" class="box-popup" name="add-nameService" maxlength="50" type="text" placeholder="Nhập tên món ăn"/>
                <div id="warning-name" class="warning">Vui lòng nhập tên</div>
                <div class="title-popup">Loại hình:</div>
                <select class="combobox-popup" name="add-idTypeService" class="combo-box">
                    <c:forEach items="${typeService}" var="ts">
                        <option value="${ts.id}">${ts.name}</option>
                    </c:forEach>
                </select>
                <div class="title-popup">Trạng thái:</div>
                <select class="combobox-popup" name="add-statusService" class="combo-box">
                    <option value="true">Đang kinh doanh</option>
                    <option value="false">Không kinh doanh</option>
                </select>
                <div class="title-popup">Giá món ăn:</div>
                <input id="price-service" oninput="changePrice(this)" class="box-popup" name="add-priceService" type="number" placeholder="Nhập giá món ăn" maxlength="8" minlength="4"/>
                <div id="warning-price" class="warning">Vui lòng nhập giá hợp lệ, nhỏ hơn 100.000.000 VNĐ và lớn hơn 999 VNĐ</div>
                <div class="title-popup">Mô tả:</div>
                <textarea maxlength="200" id="description-service" oninput="changeDescription()" class="box-popup" name="add-descriptionService" placeholder="Mô tả món ăn"></textarea>
                <div id="warning-description" class="warning">Vui lòng nhập mô tả</div>
            </div>
            <div class="footer-popup">               
                <div id="fake-btn" onclick="checkInput()" class="btn-save fake-btn-save">Lưu</div>
                <button id="real-btn" style="display: none" type="submit" class="btn-save">Lưu</button>
                <a onclick="closeForm()" class="btn-back">Trở lại</a>
            </div>
        </form>
        <c:if test="${update eq 'false'}">
            <script>
                alert("DỮ LIỆU VỪA NHẬP ĐÃ TRÙNG, VUI LÒNG KIỂM TRA LẠI");
            </script>
        </c:if>
        <c:choose>
            <c:when test="${param.message == 1 || param.message==0}">
                <script>openForm();</script>
            </c:when>
        </c:choose> 
        <c:choose>
            <c:when test="${param.message == 3 || param.message==4}">
                <script>
                    const queryString = window.location.search;

                    const urlParams = new URLSearchParams(queryString);

                    const page_type = urlParams.get('id');
                    var x = document.getElementById("service"+page_type);
                    openFormDetail(x);
                </script>
            </c:when>
        </c:choose> 
    </body>
</html>
