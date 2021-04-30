*** Settings ***

Resource            ../../../Keywords/RBP_Keywords.robot

Suite Setup         run keyword     Open Browser to Homepage    chrome
Suite Teardown      Close browser


*** Test Cases ***

Book Room Today
    [Documentation]     Creates reservation by clicking on "Today" button above calendar
    Book This Room - Book Today
    page should contain  ${Success_MSG}

