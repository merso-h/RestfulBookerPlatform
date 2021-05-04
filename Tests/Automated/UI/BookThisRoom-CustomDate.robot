*** Settings ***

Resource            ../../../Keywords/RBP_Keywords.robot


Suite Setup         run keyword     Open Browser to Homepage    firefox
Suite Teardown      Close browser


*** Test Cases ***

Book This Room - Choose any dates
    [Documentation]     Creates room reservation with given date
    Book This Room - Choose Reservation Date:     June 2021    22   25
    page should contain  night(s)
    Fill The Form & Click Book Button:  John    Doe     johndoe.123@example.com     +38711223344
    page should contain  Booking Successful!

