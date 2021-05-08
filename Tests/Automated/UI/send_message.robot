*** Settings ***

Resource            ../../../Keywords/base_keywords.robot


*** Test Cases ***

Suite Setup         run keyword     Open Browser to Homepage    chrome
Suite Teardown      Close browser

*** Variables ***
${name}=    John Wayne
${email}=   johnny123@example.com
${phone}=   +3870123456789
${subject}=  testing
${message}=  This is an automation test.


*** Test Cases ***

Send Message with Valid Input
    [Documentation]   Fills the send message form and submits entered data
    [Tags]            p1    positive    send message    contact
    Send Message      ${name}   ${email}    ${phone}    ${subject}  ${message}
    page should contain     Thanks for getting in touch

Send Message with Invalid Input
    [Documentation]  Tests error message display after submitting invalid data in send message form
    [Tags]            p1    negative    send message    contact
    Send Message            email=fakeemail.com    phone=38711     subject=Test     message=short message
    page should contain     must not be blank
    page should contain     must be a well-formed email address
    page should contain     size must be between 5 and 100
    page should contain     size must be between 11 and 21
    page should contain     size must be between 20 and 2000

Send Message and Check Admin Inbox
    [Documentation]     Sends message through contact form and checks admin inbox
    [Tags]          p1      positive    send message    contact     admin
    Send Message      ${name}   ${email}    ${phone}    ${subject}  ${message}
    Login   admin   password
    Check Admin Inbox   ${name}
    page should contain  ${message}
    page should contain  ${email}
    page should contain  ${name}
    page should contain  ${phone}
    page should contain  ${subject}

