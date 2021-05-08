*** Settings ***

Resource            ../../../Keywords/book_this_room.robot

Suite Setup         run keyword     Open Browser to Homepage    firefox
Suite Teardown      Close browser

*** Variables ***
${firstname}=   John
${lastname}=    Doe
${email}=   johndoe.123@example.com
${phone}=   +38711223344
${admin_login}=     admin
${admin_pass}=      password

*** Test Cases ***

Book This Room - Today
    [Documentation]     Creates reservation by clicking on "Today" button above calendar
    [Tags]              p1      positive    "book this room"
    Book This Room - Book Today
    page should contain  1 night(s)
    Fill The Form & Click Book Button:  ${firstname}    ${lastname}     ${email}     ${phone}
    page should contain  Booking Successful!

Book This Room - Choose any dates
    [Documentation]     Creates room reservation with given date
    [Tags]              p1      positive    "book this room"
    Book This Room - Choose Reservation Date:     June 2021    22   25
    page should contain  night(s)
    Fill The Form & Click Book Button:  ${firstname}    ${lastname}     ${email}     ${phone}
    page should contain  Booking Successful!

Book This Room - Check Admin Inbox
    [Documentation]  Creates reservation and checks admin inbox
    Book This Room - Choose Reservation Date:     June 2021    22   25
    page should contain  night(s)
    Fill The Form & Click Book Button:  ${firstname}    ${lastname}     ${email}     ${phone}
    page should contain  Booking Successful!
    click element  ${BTN_Close_BookSuccess}
    Login   ${admin_login}   ${admin_pass}
    Check Admin Inbox  ${firstname}
    page should contain  ${firstname}
    page should contain  ${email}
    page should contain  ${lastname}
    page should contain  ${phone}
