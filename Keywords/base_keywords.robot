*** Settings ***

Library            ExtendedSelenium2Library
Variables           ../variables.py

*** Variables ***

${IN_SendMSGName}       id=name
${IN_SendMSGEmail}      id=email
${IN_SendMSGPhone}      id=phone
${IN_SendMSGSubject}    id=subject
${IN_SendMSGBox}        id=description
${BTN_SubmitMSG}        id=submitContact
${LNK_AdminPanel}       //a[@href="/#/admin"]
${IN_Username}          id=username
${IN_Password}          id=password
${BTN_Login}            id=doLogin
${BTN_LetMeHack}        css=btn.btn-primary
${BTN_AdminInbox}       css=fa.fa-inbox

*** Keywords ***

Open Browser to Homepage
    [Documentation]     Opens homepage in asked browser
    [Arguments]         ${browser}
    open browser        ${URL}      browser=${browser}
    maximize browser window
    click element       ${BTN_LetMeHack}

Send Message
    [Documentation]  Fills send message form and submits it
    [Arguments]     ${name}=     ${email}=    ${phone}=    ${subject}=      ${message}=
    input text      ${IN_SendMSGName}       ${name}
    input text      ${IN_SendMSGEmail}      ${email}
    input text      ${IN_SendMSGPhone}      ${phone}
    input text      ${IN_SendMSGSubject}    ${subject}
    input text      ${IN_SendMSGBox}        ${message}
    click element   ${BTN_SubmitMSG}

Login
    [Documentation]  Enter credentials and Log in
    [Arguments]         ${username}     ${password}
    click element       ${LNK_AdminPanel}
    input text          ${IN_Username}      ${username}
    input text          ${IN_Password}      ${password}
    click element       ${BTN_Login}

Check Admin Inbox
    [Documentation]  Checks for new messages in admin inbox
    [Arguments]     ${name}
    click element  ${BTN_AdminInbox}
    click element  //p[text()='${name}']



