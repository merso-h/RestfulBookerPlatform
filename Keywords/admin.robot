*** Settings ***

Resource                base_keywords.robot

*** Variables ***
${BTN_Create}           id=createRoom
${IN_Room#}             id=roomNumber
${IN_RoomPrice}         id=roomPrice
${CBox_Wifi}            id=wifiCheckbox
${CBox_Refreshment}     id=refreshCheckbox
${CBox_TV}              id=tvCheckbox
${CBox_Safe}            id=safeCheckbox
${CBox_Radio}           id=radioCheckbox
${CBox_Views}           id=viewsCheckbox
${LNK_Report}           id=reportLink
${IN_Firstname}         name=firstname
${IN_Lastname}          name=lastname
${BTN_Book}             css=.btn.btn-outline-primary.float-right.book-room
${BTN_Cancel}           css=.btn.btn-outline-danger.float-right.book-room
${BTN-Today}            //button[text()='Today']
${BTN-Calendar_Next}    //button[text()='Next']
*** Keywords ***

Create Room
    [Documentation]  Admin creates room
    [Arguments]     ${room#}=    ${type}=     ${accessible}=   ${price}=     ${wifi}=    ${refreshments}=    ${TV}=      ${safe}=    ${radio}=   ${views}=
    ${unvisible}=     run keyword and return status  element should not be visible   ${room#}
    run keyword if  '${unvisible}'=='True'     input text       ${IN_Room#}     ${room#}
    run keyword if  '${wifi}'=='Yes'  select checkbox  ${CBox_Wifi}
    run keyword if  '${refreshments}'=='Yes'  select checkbox  ${CBox_Refreshment}
    run keyword if  '${TV}'=='Yes'  select checkbox  ${CBox_TV}
    run keyword if  '${safe}'=='Yes'  select checkbox  ${CBox_Safe}
    run keyword if  '${radio}'=='Yes'  select checkbox  ${CBox_Radio}
    run keyword if  '${views}'=='Yes'  select checkbox  ${CBox_Views}
    run keyword if  '${type}'=='Yes'  click element   //*[@value="${type}"]
    run keyword if  '${accessible}'=='Yes'  click element   //*[@value="${accessible}"]
    run keyword if  '${price}'!=''    input text    ${IN_RoomPrice}     ${price}
    click element  ${BTN_Create}

Delete Room
    [Documentation]  Deletes room for room number provided
    [Arguments]     ${room#}
    page should contain  ${room#}
    click element at coordinates  //*[contains(@id,'roomNumber${room#}')]    1040    0

Choose Reservation Date:
    [Documentation]     Selects a future date for reservation in calendar
    #Month and Year should be provided in format "Month Year"; for example:May 2021
    [Arguments]         ${Month_YEAR}   ${Day1}     ${Day2}
    click element       ${LNK_Report}
        FOR     ${month}     IN RANGE     0  11
                ${Visible}=     run keyword and return status  page should contain  ${Month_YEAR}
                run keyword if  '${Visible}'=="True"  run keywords  Select days in Calendar:   ${Day1}    ${Day2}
                ...     AND     exit for loop
                ...  ELSE   click element  ${BTN-Calendar_Next}

        END


Select days in Calendar:
    [Documentation]  Selects reservation dates in calendar
    [Arguments]     ${Day1}     ${Day2}
    run keyword     drag and drop   xpath=//div[@class='rbc-date-cell']//a[text()='${Day1}']      xpath=//div[@class='rbc-date-cell']//a[text()='${Day2}']

Book Room
    [Documentation]  Books a room in admin panel
    [Arguments]     ${room#}    ${deposit_paid?}    ${firstname}    ${lastname}
    input text      ${IN_Firstname}     ${firstname}
    input text      ${IN_Lastname}     ${lastname}
    click element  //option[text()='${room#}']
    click element  //option[text()='${deposit_paid?}']
    click element  ${BTN_Book}