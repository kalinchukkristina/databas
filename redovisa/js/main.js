(function () {
    "use strict";
    // date

    function greeting() {
        const todayDate = new Date();
        const hours = todayDate.getHours();

        if (hours < 12) {
            return "God förmiddag!";
        } else {
            return "God eftermiddag!";
        }
    }

    document.getElementById("greeting").innerHTML = greeting();

    const date = new Date();
    const readableDate = date.toDateString();

    document.querySelector(".myDate").innerHTML = `Datum idag är : ${readableDate}`;

    //hamburger menu
    const hamburger = document.getElementById('hamburger');
    const navUL = document.getElementById('nav-ul');

    hamburger.addEventListener('click', () => {
        navUL.classList.toggle('show');
    });
}());
