*** Settings ***

Resource            ../../../Keywords/RBP_Keywords.robot


Suite Setup         run keyword     Open Browser to Homepage    chrome
Suite Teardown      Close browser


*** Test Cases ***

Book This Room - Custom Date
    [Documentation]     Creates room reservation with given date
    Book This Room - Choose Reservation Date     June 2021    21
    page should contain  ${Success_MSG}

