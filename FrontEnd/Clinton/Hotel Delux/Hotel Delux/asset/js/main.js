$(document).ready(function () {
    $('#bookingDate').datepicker({
        dateFormat: 'mm/dd/yy', minDate: new Date(), timepicker: false
    });
    $('.outDate').datepicker({
        dateFormat: 'mm/dd/yy'
    });
    $('#checkoutDate').datepicker({
        dateFormat: 'mm/dd/yy', minDate: "+1", timepicker: false
    });
});
function ErrorDiv() {
    debugger;
    let divError = document.getElementById("div-error");
    divError.setAttribute("style", "display:block;");
}

function ErrorDivHide() {
    debugger;
    let divError = document.getElementById("div-error");
    divError.setAttribute("style", "display:none;");
}
function validate() {
    debugger;
    let username = document.getElementById("username");
    let password = document.getElementById("password");
    if (username.value == "" || username.value.trim() == "" || username.value == undefined || username.value.length < 4) {
        username.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");

        return false;
    }
    else if (password.value == "" || password.value.trim() == "" || password.value == undefined || password.value.length < 4) {
        password.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else {

        return true;
    }
}
function addStaffValidate() {
    let username = document.getElementById("username");
    let password = document.getElementById("password");
    let name = document.getElementById("name");
    let address = document.getElementById("address");
    let mobile = document.getElementById("mobile");
    let email = document.getElementById("email");
    let state = document.getElementById("state");
    username.setAttribute("style", "border-style:none");
    password.setAttribute("style", "border-style:none");
    address.setAttribute("style", "border-style:none");
    name.setAttribute("style", "border-style:none");
    mobile.setAttribute("style", "border-style:none");
    email.setAttribute("style", "border-style:none");
    state.setAttribute("style", "border-style:none");
    if (username.value == "" || username.value.trim() == "" || username.value == undefined || username.value.length < 4) {
        username.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (password.value == "" || password.value.trim() == "" || password.value == undefined || password.value.length < 4) {
        password.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (name.value == "" || name.value.trim() == "" || name.value == undefined || name.value.length < 4) {
        name.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (address.value == "" || address.value.trim() == "" || address.value == undefined || address.value.length < 4) {
        address.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (mobile.value == "" || mobile.value.trim() == "" || mobile.value == undefined || mobile.value.length < 10) {
        mobile.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (email.value == "" || email.value.trim() == "" || email.value == undefined) {
        email.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (state.value == "" || state.value.trim() == "" || state.value == undefined || state.value.length < 4) {
        state.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else {
        return true;
    }
}

function editStaffValidate() {
    let password = document.getElementById("password");
    let name = document.getElementById("name");
    let address = document.getElementById("address");
    let mobile = document.getElementById("mobile");
    let email = document.getElementById("email");
    let state = document.getElementById("state");
    password.setAttribute("style", "border-style:none");
    address.setAttribute("style", "border-style:none");
    name.setAttribute("style", "border-style:none");
    mobile.setAttribute("style", "border-style:none");
    email.setAttribute("style", "border-style:none");
    state.setAttribute("style", "border-style:none");
   
    if (password.value == "" || password.value.trim() == "" || password.value == undefined || password.value.length < 4) {
        password.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (name.value == "" || name.value.trim() == "" || name.value == undefined || name.value.length < 4) {
        name.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (address.value == "" || address.value.trim() == "" || address.value == undefined || address.value.length < 4) {
        address.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (mobile.value == "" || mobile.value.trim() == "" || mobile.value == undefined || mobile.value.length < 10) {
        mobile.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (email.value == "" || email.value.trim() == "" || email.value == undefined) {
        email.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (state.value == "" || state.value.trim() == "" || state.value == undefined || state.value.length < 4) {
        state.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }

    else {
        return true;
    }
}

function addRoomValidate() {
    debugger;
    let roomNo = document.getElementById("roomNo");
    let roomType = document.getElementById("roomType");
    let roomAvailable = document.getElementById("roomAvailable");
    let roomPrice = document.getElementById("roomPrice");
    let uploadFile1 = document.getElementById("uploadFile1");
    let uploadFile2 = document.getElementById("uploadFile2");
    if (roomNo.value == null || roomNo.value == undefined || roomNo.value.trim() == "" || roomNo.value.length != 3) {
        roomNo.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (roomType.value == null || roomNo.value == undefined || roomNo.value.trim() == "") {
        roomNo.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (roomPrice.value == null || roomPrice.value == roomPrice || roomNo.value.trim() == "") {
        roomPrice.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }

   else if (uploadFile1.value.length < 4) {
        uploadFile1.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
   }
   else if (uploadFile2.value.length < 4) {
       uploadFile2.setAttribute("style", "border:1px solid red");
       let divError = document.getElementById("div-validate");
       divError.setAttribute("style", "display:block;");
       return false;
   }
    else {
        return true;
    }
}
function roomUpdateValidate() {
    debugger;
    let roomNo = document.getElementById("roomNo");
    let roomType = document.getElementById("roomType");
    let roomAvailable = document.getElementById("roomAvailable");
    let roomPrice = document.getElementById("roomPrice");
    let uploadFile1 = document.getElementById("uploadFile1");
    let uploadFile2 = document.getElementById("uploadFile2");
    if (roomNo.value == null || roomNo.value == undefined || roomNo.value.trim() == "" || roomNo.value.length != 3) {
        roomNo.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (roomType.value == null || roomNo.value == undefined || roomNo.value.trim() == "") {
        roomNo.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (roomPrice.value == null || roomPrice.value == roomPrice || roomNo.value.trim() == "") {
        roomPrice.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else {
        return true;
    }
}


function addCustomerValidate() {
    let username = document.getElementById("username");
    let password = document.getElementById("password");
    let name = document.getElementById("name");
    let address = document.getElementById("address");
    let mobile = document.getElementById("mobile");
    let email = document.getElementById("email");
    let state = document.getElementById("state");
    username.setAttribute("style", "border-style:none");
    password.setAttribute("style", "border-style:none");
    address.setAttribute("style", "border-style:none");
    name.setAttribute("style", "border-style:none");
    mobile.setAttribute("style", "border-style:none");
    email.setAttribute("style", "border-style:none");
    state.setAttribute("style", "border-style:none");
    if (username.value == "" || username.value.trim() == "" || username.value == undefined || username.value.length < 4) {
        username.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (password.value == "" || password.value.trim() == "" || password.value == undefined || password.value.length < 4) {
        password.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (name.value == "" || name.value.trim() == "" || name.value == undefined || name.value.length < 4) {
        name.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (address.value == "" || address.value.trim() == "" || address.value == undefined || address.value.length < 4) {
        address.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (mobile.value == "" || mobile.value.trim() == "" || mobile.value == undefined || mobile.value.length < 10) {
        mobile.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (email.value == "" || email.value.trim() == "" || email.value == undefined) {
        email.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (state.value == "" || state.value.trim() == "" || state.value == undefined || state.value.length < 4) {
        state.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else {
        return true;
    }
}
function makeBooking() {
    debugger;
    let roomNo = document.getElementById("roomNo");
    let mobile = document.getElementById("noOfPersons");
    let bookingDate = document.getElementById("bookingDate");
    let checkoutDate = document.getElementById("checkoutDate");
    //var q = new Date();
    //var m = q.getMonth()+1;
    //var d = q.getDate();
    //var y = q.getFullYear();
    //let bookingDateFormat = new Date(bookingDate.value);
    //let todayDateFormat = new Date(y, m, d);
    //var todayDate = d+"/"+m+"/"+y;

    //console.log("value of booking date is: " + bookingDate.value);
    //console.log("value of today date is: " + todayDate);
    //console.log("value of bookingDateFormat is: " + bookingDateFormat);
    //console.log("value of todayDateFormat is: " + todayDateFormat);
    //console.log("result of comparing: " + bookingDateFormat > todayDateFormat);
    if (roomNo.value == null || roomNo.value == undefined || roomNo.value.trim() == "" || roomNo.value.length != 3) {
        roomNo.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (noOfPersons.value == "" || noOfPersons.value.trim() == "" || noOfPersons.value == undefined || noOfPersons.value>= 10) {
        noOfPersons.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
}
    else if (bookingDate.value == null || bookingDate.value == undefined || bookingDate.value.trim() == "") {
        bookingDate.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (checkoutDate.value == null || checkoutDate.value == undefined || checkoutDate.value.trim() == "") {
        checkoutDate.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else {
        return true;
    }
}
function makeBookingStaff() {
    debugger;
    let roomNo = document.getElementById("roomNo");
    let mobile = document.getElementById("noOfPersons");
    let username = document.getElementById("username");
    let bookingDate = document.getElementById("bookingDate");
    let checkoutDate = document.getElementById("checkoutDate");
    //var q = new Date();
    //var m = q.getMonth();
    //var d = q.getDay();
    //var y = q.getFullYear();

    //var todayDate = new Date(y, m, d);

    //alert("value of date is: " + bookingDate.value);
    //alert("result of comparing: " + bookingDate.value < todayDate);
    if (roomNo.value == null || roomNo.value == undefined || roomNo.value.trim() == "" || roomNo.value.length != 3) {
        roomNo.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (username.value == "" || username.value.trim() == "" || username.value == undefined || username.value.length < 4) {
        noOfPersons.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (noOfPersons.value == "" || noOfPersons.value.trim() == "" || noOfPersons.value == undefined || noOfPersons.value >= 10) {
        noOfPersons.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (bookingDate.value == null || bookingDate.value == undefined || bookingDate.value.trim() == "") {
        bookingDate.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (checkoutDate.value == null || checkoutDate.value == undefined || checkoutDate.value.trim() == "") {
        checkoutDate.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else {
        return true;
    }
}
function cancelBooking() {
    let roomNo = document.getElementById("roomNo");
    if (roomNo.value == null || roomNo.value == undefined || roomNo.value.trim() == "" || roomNo.value.length != 3) {
        roomNo.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else {
        return true;
    }
}
function cancelStaffBooking() {
    let username = document.getElementById("username");
    let roomNo = document.getElementById("roomNo");
    username.setAttribute("style", "border-style:none");
    roomNo.setAttribute("style", "border-style:none");
    if (username.value == "" || username.value.trim() == "" || username.value == undefined || username.value.length < 4) {
        username.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
   else if (roomNo.value == null || roomNo.value == undefined || roomNo.value.trim() == "" || roomNo.value.length != 3) {
        roomNo.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else {
        return true;
    }
}


function checkBookingValidate() {
    debugger;
    let roomNo = document.getElementById("roomNo");
    let username = document.getElementById("username");
  

    if (roomNo.value == null || roomNo.value == undefined || roomNo.value.trim() == "" || roomNo.value.length != 3) {
        roomNo.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (username.value == "" || username.value.trim() == "" || username.value == undefined || username.value.length <4) {
        username.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else {
        return true;
    }
}

function billPaymentValidate(){
    let roomNo = document.getElementById("roomNo");
    let username = document.getElementById("username");
    let noOfPerson = document.getElementById("noOfPerson");
    let inDate = document.getElementById("inDate");
    let outDate = document.getElementById("outDate");
    let roomBill = document.getElementById("roomBill");
    let totalBill = document.getElementById("totalBill");

    var q = new Date();
    var m = q.getMonth();
    var d = q.getDay();
    var y = q.getFullYear();

    var todayDate = new Date(y, m, d);

    


    if (roomNo.value == null || roomNo.value == undefined || roomNo.value.trim() == "" || roomNo.value.length != 3) {
        roomNo.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (username.value == "" || username.value.trim() == "" || username.value == undefined || username.value.length < 4) {
        noOfPersons.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (noOfPerson.value == "" || noOfPerson.value.trim() == "" || noOfPerson.value == undefined || noOfPerson.value>= 10) {
        noOfPerson.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (inDate.value == null || inDate.value == undefined || inDate.value.trim() == "") {
        inDate.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (outDate.value == null || outDate.value == undefined || outDate.value.trim() == "" || outDate < todayDate) {
        outDate.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (roomBill.value == null || roomBill.value == undefined || roomBill.value.trim() == "" || roomBill.value.length <=2) {
        roomBill.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else if (totalBill.value == "" || totalBill.value.trim() == "" || totalBill.value == undefined || totalBill.value.length <= 2) {
        totalBill.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else {
        return true;
    }

}
function usernameValidate() {
    let username = document.getElementById("username");


    if (username.value == "" || username.value.trim() == "" || username.value == undefined || username.value.length < 4) {
        username.setAttribute("style", "border:1px solid red");
        let divError = document.getElementById("div-validate");
        divError.setAttribute("style", "display:block;");
        return false;
    }
    else {
        return true;
    }
}

    //popup
    function popUp(message, result) {
        let overlay = document.getElementById("overlay");
        overlay.setAttribute("style", "display:block");
        if (result) {
            document.getElementById("pop-up").setAttribute("style", "background:#59b05a");
        }
        else {
            document.getElementById("pop-up").setAttribute("style", "background:#d55048");
        }
        document.getElementById("message").innerText=message;
    }
    function closePopup() {
        let overlay = document.getElementById("overlay");
        overlay.setAttribute("style", "display:none");
    }