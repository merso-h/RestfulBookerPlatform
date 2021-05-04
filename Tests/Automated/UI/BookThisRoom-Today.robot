*** Settings ***

Resource            ../../../Keywords/RBP_Keywords.robot

Suite Setup         run keyword     Open Browser to Homepage    firefox
Suite Teardown      Close browser


*** Test Cases ***

Book This Room - Today
    [Documentation]     Creates reservation by clicking on "Today" button above calendar
    Book This Room - Book Today
    page should contain  1 night(s)
    Fill The Form & Click Book Button:  John    Doe     johndoe.123@example.com     +38711223344
    page should contain  Booking Successful!



