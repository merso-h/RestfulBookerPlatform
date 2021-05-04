*** Settings ***

Library            ExtendedSelenium2Library
Variables           ../variables.py

*** Variables ***

${BTN-Let_Me_Hack}      css=.btn.btn-primary
${BTN-Book_this_room}   css=.btn.btn-outline-primary.float-right.openBooking
${BTN-Today}            //button[text()="Today"]
${BTN-Calendar_Next}    //button[text()="Next"]
${BTN-Calendar_Back}    //button[text()="Back"]
${IN_Firstname}         css=.form-control.room-firstname
${IN_Lastname}          css=.form-control.room-lastname
${IN_Email}             css=.form-control.room-email
${IN_Phone}             css=.form-control.room-phone
${BTN-Book}             css=.btn.btn-outline-primary.float-right.book-room

*** Keywords ***

Open Browser to Homepage
    [Documentation]     Opens homepage in asked browser
    [Arguments]         ${browser}
    open browser        ${URL}      browser=${browser}
    maximize browser window


Book This Room - Book Today
    [Documentation]     Books a room Today by clicking on "Today" above calendar
    scroll element into view  ${BTN-Book_this_room}
    click element       ${BTN-Book_this_room}
    click element       ${BTN-Today}

Fill The Form & Click Book Button:
    [Documentation]     Fills data in book form and creates reservation
    [Arguments]         ${Firstname}    ${Lastname}     ${Email}    ${Phone}
    input text          ${IN_Firstname}     ${Firstname}
    input text          ${IN_Lastname}      ${Lastname}
    input text          ${IN_Email}         ${Email}
    input text          ${IN_Phone}         ${Phone}
    click button        ${BTN-Book}

Book This Room - Choose Reservation Date:
    [Documentation]     Selects a future date for reservation in calendar
    #Month and Year should be provided in format "Month Year"; for example:May 2021
    [Arguments]         ${Month_YEAR}   ${Day1}     ${Day2}
    scroll element into view    ${BTN-Book_this_room}
    click element       ${BTN-Book_this_room}
        FOR     ${month}     IN RANGE     0  11
                ${Visible}=     run keyword and return status  page should contain  ${Month_YEAR}
                run keyword if  '${Visible}'=="True"  run keyword  Select days in Calendar:   ${Day1}    ${Day2}
                ...  ELSE   click element  ${BTN-Calendar_Next}
        END


Select days in Calendar:
    [Documentation]  Selects reservation dates in calendar
    [Arguments]     ${Day1}     ${Day2}
    run keyword     drag and drop   xpath=//div[@class='rbc-date-cell']//a[text()='${Day1}']      xpath=//div[@class='rbc-date-cell']//a[text()='${Day2}']

