*** Settings ***

Library            ExtendedSelenium2Library
Variables           ../variables.py

*** Variables ***

${BTN-Let_Me_Hack}      css=.btn.btn-primary
${BTN-Book_this_room}   //*[text()="Book this room"]             #.btn.btn-outline-primary.float-right.openBooking
${BTN-Today}            //button[text()="Today"]
${BTN-Calendar_Next}    //button[text()="Next"]
${BTN-Calendar_Back}    //button[text()="Back"]
${IN_Firstname}         css=.form-control.room-firstname
${IN_Lastname}          css=.form-control.room-lastname
${IN_Email}             css=.form-control.room-email
${IN_Phone}             css=.form-control.room-phone
${BTN-Book}             css=.btn.btn-outline-primary.float-right.book-room
${Firstname}            John
${Lastname}             Doe
${Email}                johndoe1@example.com
${Phone}                +3879876543210
${Success_MSG}          Success
${Day_selected_MSG}     Day Selected

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
    Fill The Form & Click Book Button
#Pošto se soba može rezervisati za danas i klikom na Today odlučio sam da razdvojim ovu opciju s generalnim keywordom dolje kad prosljeđujemo datum

Fill The Form & Click Book Button
    [Documentation]     Fills data in book form and creates reservation
    input text          ${IN_Firstname}     ${Firstname}
    input text          ${IN_Lastname}      ${Lastname}
    input text          ${IN_Email}         ${Email}
    input text          ${IN_Phone}         ${Phone}
    click button        ${BTN-Book}


Book This Room - Choose Reservation Date
    [Documentation]     Selects a future date for reservation in calendar
    #Month and Year should be provided in format "Month Year"; for example:May 2021
    [Arguments]         ${Month_YEAR}   ${Day}
    scroll element into view    ${BTN-Book_this_room}
    click element       ${BTN-Book_this_room}
        FOR     ${date}     IN RANGE     0  11
                ${Visible}=     run keyword and return status  page should contain  ${Month_YEAR}
                run keyword if  '${Visible}'=="True"  run keyword  Choose Day in Calendar   ${Day}
                ...  ELSE   click element  ${BTN-Calendar_Next}
        END
    Fill The Form & Click Book Button
#for petlja provjerava da li se prikazani mjesec podudara s danim i klika na next ukoliko je odgovor negativan

Choose Day in Calendar
    [Documentation]  Clicks on a date in calendar
    [Arguments]     ${Day}
    click element  xpath=//div[@class='rbc-date-cell']//a[text()='${Day}']
    page should contain  ${Day_selected_MSG}
#Stranica ima bug, ne može se selektovati dan pa sam izmislio ovu Success poruku da mi može pasti test na odabiru dana