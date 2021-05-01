*** Settings ***

Resource            ../../../keywords/RBP_Keywords.robot

Suite Setup         run keyword     Open Browser to Homepage    browser=chrome
Suite Teardown      Close browser



*** Test Cases ***

Send Valid Message
    [Documentation]  Fills the send message form and submits entered data
    Send Message    ${Firstname}    ${Email}    ${Phone}    ${SubjectMSG}   ${Message_Box}
    page should contain  Thanks for getting in touch ${Firstname}

Send Message with Invalid Data
    [Documentation]  Tests error message display after submitting invalid data
    Send Message    email=fakeemail.com    phone=38711     subject=Test     message=short message
    page should contain     must not be blank
    page should contain     must be a well-formed email address
    page should contain     size must be between 5 and 100
    page should contain     size must be between 11 and 21
    page should contain     size must be between 20 and 2000
