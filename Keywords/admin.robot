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

*** Keywords ***

Create Room
    [Documentation]  Admin creates room
    [Arguments]     ${room#}    ${type}=     ${accessible}=   ${price}=     ${wifi}=    ${refreshments}=    ${TV}=      ${safe}=    ${radio}=   ${views}=
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
    [Documentation]  Deletes room for row number provided
    #[Arguments]     #${row#}
    click element at coordinates  //*[contains(@id,'roomNumber255')]    1040    0

