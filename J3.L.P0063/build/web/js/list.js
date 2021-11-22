/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function chooseImage() {
    const file = document.getElementById("files").value.split("\\");
    document.getElementById("mark-image").style.display = "none";
    document.getElementById("warning-image").style.display = "none";
    document.getElementById("show-image").src = "images/" + file[file.length - 1];
    checkEachInput();
}

function openForm() {
    document.getElementById("myForm").style.display = "block";
    document.getElementById("overlay").style.display = "block";

}

function closeForm() {
    document.getElementById("myForm").style.display = "none";
    document.getElementById("overlay").style.display = "none";
}

function openFormDetail(name)
{
    let idBtn = "detail";
    let idDetail = idBtn.concat(name.id);
    document.getElementById(idDetail).style.display = "block";
    document.getElementById("overlay").style.display = "block";
}

function closeFormDetail(name) {
    document.getElementById(name.id).style.display = "none";
    document.getElementById("overlay").style.display = "none";
}

function chooseImageDetail(file)
{
    let idmark = "mark-";
    let urlimage = "raw";
    let idDetail = idmark.concat(file.id);
    urlimage = urlimage.concat(file.id);
    const files = document.getElementById(file.id).value.split("\\");
    document.getElementById(idDetail).src = "images/" + files[files.length - 1];
    document.getElementById(urlimage).value = files[files.length - 1];
}

function checkInput() {
    if (document.getElementById("files").value.trim() === "") {
        document.getElementById("warning-image").style.display = "block";
    }
    if (document.getElementById("files").value.trim() !== "") {
        document.getElementById("warning-image").style.display = "none";
    }
    if (document.getElementById("name-service").value.trim().length === 0)
    {
        document.getElementById("warning-name").style.display = "block";
    }
    if (document.getElementById("name-service").value.trim().length > 0)
    {
        document.getElementById("warning-name").style.display = "none";
    }
    if (document.getElementById("price-service").value <= 0 ||
            document.getElementById("price-service").value.length < 4 ||
            document.getElementById("price-service").value.length > 8)
    {
        document.getElementById("warning-price").style.display = "block";
    }
    if (document.getElementById("price-service").value > 0 &&
            document.getElementById("price-service").value.length >= 4 &&
            document.getElementById("price-service").value.length <= 8)
    {
        document.getElementById("warning-price").style.display = "none";
    }
    if (document.getElementById("description-service").value.trim().length === 0)
    {
        document.getElementById("warning-description").style.display = "block";
    }
    if (document.getElementById("description-service").value.trim().length > 0)
    {
        document.getElementById("warning-description").style.display = "none";
    }
}

function checkInputEdit(btn) {
    const id = btn.id.split("-");
    if (document.getElementById("name-service-" + id[2]).value.trim().length === 0)
    {
        document.getElementById("warning-name-" + id[2]).style.display = "block";
    }
    if (document.getElementById("name-service-" + id[2]).value.trim().length > 0)
    {
        document.getElementById("warning-name-" + id[2]).style.display = "none";
    }
    if (document.getElementById("price-service-" + id[2]).value <= 0 ||
            document.getElementById("price-service-" + id[2]).value.length > 8 ||
            document.getElementById("price-service-" + id[2]).value.length < 4)
    {
        document.getElementById("warning-price-" + id[2]).style.display = "block";
    }
    if (document.getElementById("price-service-" + id[2]).value > 0 &&
            document.getElementById("price-service-" + id[2]).value.length <= 8 &&
            document.getElementById("price-service-" + id[2]).value.length >= 4)
    {
        document.getElementById("warning-price-" + id[2]).style.display = "none";
    }
    if (document.getElementById("description-service-" + id[2]).value.trim().length === 0)
    {
        document.getElementById("warning-description-" + id[2]).style.display = "block";
    }
    if (document.getElementById("description-service-" + id[2]).value.trim().length > 0)
    {
        document.getElementById("warning-description-" + id[2]).style.display = "none";
    }
}

function changeName() {
    document.getElementById("warning-name").style.display = "none";
    checkEachInput();
}

function checkEachInput() {
    if (document.getElementById("name-service").value.trim().length > 0 &&
            document.getElementById("files").value.trim().length > 0 &&
            document.getElementById("description-service").value.trim().length > 0
            && document.getElementById("price-service").value > 0 &&
            document.getElementById("price-service").value.length >= 4 &&
            document.getElementById("price-service").value.length <= 8)
    {
        document.getElementById("fake-btn").style.display = "none";
        document.getElementById("real-btn").style.display = "block";
    }
    if (document.getElementById("name-service").value.trim().length === 0 ||
            document.getElementById("files").value.trim().length === 0 ||
            document.getElementById("description-service").value.trim().length === 0 ||
            document.getElementById("price-service").value <= 0 ||
            document.getElementById("price-service").value.length < 4 ||
            document.getElementById("price-service").value.length > 8) {
        document.getElementById("fake-btn").style.display = "block";
        document.getElementById("real-btn").style.display = "none";
    }
}

function checkEachInputEdit(btn) {
    const id = btn.id.split("-");
    if (document.getElementById("name-service-" + id[2]).value.trim().length > 0 &&
            document.getElementById("description-service-" + id[2]).value.trim().length > 0
            && document.getElementById("price-service-" + id[2]).value > 0 &&
            document.getElementById("price-service-" + id[2]).value.length > 3 &&
            document.getElementById("price-service-" + id[2]).value.length < 9)
    {
        document.getElementById("fake-btn-" + id[2]).style.display = "none";
        document.getElementById("real-btn-" + id[2]).style.display = "block";
    }
    if (document.getElementById("name-service-" + id[2]).value.trim().length === 0 ||
            document.getElementById("description-service-" + id[2]).value.trim().length === 0 ||
            document.getElementById("price-service-" + id[2]).value <= 0 ||
            document.getElementById("price-service-" + id[2]).value.length <= 3 ||
            document.getElementById("price-service-" + id[2]).value.length >= 9) {
        document.getElementById("fake-btn-" + id[2]).style.display = "block";
        document.getElementById("real-btn-" + id[2]).style.display = "none";
    }
}

function changePrice(price) {
    if (price.value.length <= 8 && price.value.length >= 4) {
        document.getElementById("warning-price").style.display = "none";
        checkEachInput();
    }
    else{
        document.getElementById("fake-btn").style.display = "block";
        document.getElementById("real-btn").style.display = "none";
    }
}

function changeDescription() {
    document.getElementById("warning-description").style.display = "none";
    checkEachInput();
}

function changePriceEdit(price) {
    const id = price.id.split("-");
    if (price.value.length <= 8 && price.value.length >= 4) {
        document.getElementById("warning-price" + id[2]).style.display = "none";
        checkEachInputEdit(price);
    }
    else{
        document.getElementById("fake-btn-" + id[2]).style.display = "block";
        document.getElementById("real-btn-" + id[2]).style.display = "none";
    }
}

function changeDescriptionEdit(des) {
    const id = des.id.split("-");
    document.getElementById("warning-description-" + id[2]).style.display = "none";
    checkEachInputEdit(des);
}

