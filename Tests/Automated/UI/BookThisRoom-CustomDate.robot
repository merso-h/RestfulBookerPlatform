*** Settings ***

Resource            ../../../Keywords/RBP_Keywords.robot

Suite Teardown      Close all browsers


*** Test Cases ***

Book This Room - Custom Date (Chrome)
    Open Chrome to Homepage
    Book This Room - Choose Reservation Date     June 2021    21
    page should contain  ${Success_MSG}

Book This Room - Custom Date (Firefox)
    Open Firefox to Homepage
    Book This Room - Choose Reservation Date     June 2021    21
    page should contain  ${Success_MSG}

Book This Room - Custom Date (Edge)
    Open Edge to Homepage
    Book This Room - Choose Reservation Date     June 2021    21
    page should contain  ${Success_MSG}