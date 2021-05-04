*** Settings ***

Resource                ../../../Keywords/base_keywords.robot

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

My Foo Bar Keyword
    [Documentation]    Does so and so
    [Arguments]        ${arg1}
    Do this
    Do that
    [Return]           Some value