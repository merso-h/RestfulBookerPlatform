*** Settings ***

Resource            ../../../Keywords/base_keywords.robot


*** Test Cases ***

Suite Setup         run keyword     Open Browser to Homepage    chrome
Suite Teardown      Close browser

*** Test Cases ***

Send Message with Valid Input
    [Documentation]   Fills the send message form and submits entered data
    [Tags]            p1    positive    send message    contact
    Send Message            firstname=Johnny    email=johnny123@example.com    phone=+3870123456789    subject=Testing   message=This is an automation test.
    page should contain     Thanks for getting in touch

Send Message with Invalid Input
    [Documentation]  Tests error message display after submitting invalid data
    [Tags]            p1    negative    send message    contact
    Send Message            email=fakeemail.com    phone=38711     subject=Test     message=short message
    page should contain     must not be blank
    page should contain     must be a well-formed email address
    page should contain     size must be between 5 and 100
    page should contain     size must be between 11 and 21
    page should contain     size must be between 20 and 2000
