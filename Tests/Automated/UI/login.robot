*** Settings ***

Resource            ../../../Keywords/base_keywords.robot

Suite Setup         run keyword     Open Browser to Homepage    chrome
Suite Teardown      Close browser

*** Test Cases ***

Login as administrator
    [Documentation]  Logs in as administrator
    [Tags]      P1  login  positive
    Login   admin   password
    page should contain     Logout

Login with invalid data
    [Documentation]  Attempt to login with invalid credentials
    [Tags]      P1  login  negative
    Login   user    user1
    page should contain  Log into your account




