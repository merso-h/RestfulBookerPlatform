*** Settings ***

Resource            ../../../Keywords/book_this_room.robot

Suite Setup         run keyword     Open Browser to Homepage    firefox
Suite Teardown      Close browser

*** Test Cases ***

Book This Room - Today
    [Documentation]     Creates reservation by clicking on "Today" button above calendar
    [Tags]              p1      positive    "book this room"
    Book This Room - Book Today
    page should contain  1 night(s)
    Fill The Form & Click Book Button:  John    Doe     johndoe.123@example.com     +38711223344
    page should contain  Booking Successful!

Book This Room - Choose any dates
    [Documentation]     Creates room reservation with given date
    [Tags]              p1      positive    "book this room"
    Book This Room - Choose Reservation Date:     June 2021    22   25
    page should contain  night(s)
    Fill The Form & Click Book Button:  John    Doe     johndoe.123@example.com     +38711223344
    page should contain  Booking Successful!