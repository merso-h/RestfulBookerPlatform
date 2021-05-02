*** Settings ***

Resource            ../../../Keywords/RBP_Keywords.robot


Suite Setup         run keyword     Open Browser to Homepage    chrome
Suite Teardown      Close browser

*** Test Cases ***

Login as administrator
    [Documentation]  Logs in as administrator
    Login   admin   password
    page should contain     Logout

Login with invalid data
    [Documentation]  Attempt to login with invalid credentials
    Login   user    user1
    page should contain  Log into your account