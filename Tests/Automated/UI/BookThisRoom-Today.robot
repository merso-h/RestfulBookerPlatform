*** Settings ***

Resource            ../../../Keywords/RBP_Keywords.robot

Suite Teardown      Close all browsers


*** Test Cases ***

Book Room Today (Chrome)
    Open Chrome to Homepage
    Book Today
    page should contain  ${Success_MSG}

Book Room Today (Firefox)
    Open Firefox to Homepage
    Book Today
    page should contain  ${Success_MSG}

Book Room Today (Edge)
    Open Edge to Homepage
    Book Today
    page should contain  ${Success_MSG}