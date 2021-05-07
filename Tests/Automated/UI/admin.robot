*** Settings ***

Resource            ../../../Keywords/admin.robot

Suite Setup         run keyword     Open Browser to Homepage    firefox
Suite Teardown      Close browser


*** Test Cases ***

Create Room
    [Documentation]  Create room in admin panel
    [Tags]      P1  positive    Create Room
    Login   admin    password
    Create Room     299     wifi=Yes    TV=Yes

Delete Room
    [Documentation]  Delete room in admin panel
    [Tags]      P1  positive    Delete Room
    Login   admin       password
    Delete Room     299

Create Room without giving room number
    [Documentation]  Check for error message when trying to create room without giving room #
    [Tags]      P1  negative    Create Room
    Login   admin       password
    Create Room
    page should contain  must be greater than or equal to 1


Create and Delete Room
    [Documentation]  Creates and then deletes the same room
    [Tags]      P1  positive    create room     delete room
    Login   admin   password
    Create Room     room#=567
    Delete Room     room#=567

Create Reservation
    [Documentation]  Creates room and reservation for that same room
    [Tags]          P1  positive    create reservation  book room
    Login       admin       password
    Create Room     room#=600   type=Family     price=100   wifi=Yes    refreshments=Yes
    Choose Reservation Date:  June 2021         12      15
    Book Room   room#=600   deposit_paid?=true  firstname=John  lastname=Doe
