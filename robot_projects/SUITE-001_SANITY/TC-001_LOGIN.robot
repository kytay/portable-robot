*** Settings ***
Library         SeleniumLibrary
Library         String
Resource        ${RESOURCE_DIR}/global.resource
Resource        ${RESOURCE_DIR}/users.resource
Resource        ${RESOURCE_DIR}/TC-001.resource
Default Tags    sanity
Test Setup      Open Browser    ${ENV_LOGIN_URL}  ${ENV_BROWSER_APP}
Test Teardown   Close Browser

*** Test Cases ***
Login web application as Employee, and logout.
    Wait Until Page Contains Element    ${LOGIN_USER_INPUT_XPATH}
    Input Text                  ${LOGIN_USER_INPUT_XPATH}  ${EMP_1.id}
    Input Text                  ${LOGIN_PASS_INPUT_XPATH}  ${EMP_1.password}
    Click Element               ${LOGIN_SIGNIN_BUTTON_XPATH}
    Wait Until Page Contains Element     ${MAIN_PROFILE_NAME}
    # Wait Until Element Does Not Contain  ${MAIN_PROFILE_NAME}  ${USER_1.id}  timeout=20
    Element Text Should Be      ${MAIN_PROFILE_NAME}  ${EMP_1.name}
    Element Text Should Be      ${MAIN_PROFILE_EMPLOYEEID}  ${EMP_1.id}
    Element Should Be Visible   ${MAIN_TIMESHEET_MODULE}
    Element Should Not Be Visible       ${MAIN_TIMETRACK_MODULE}
    Click Element               ${MAIN_PROFILE_PIC}
    Click Element               ${MAIN_LOGOUT}

Login web application as Manager, and logout.
    Wait Until Page Contains Element    ${LOGIN_USER_INPUT_XPATH}
    Input Text                  ${LOGIN_USER_INPUT_XPATH}  ${MGR_1.id}
    Input Text                  ${LOGIN_PASS_INPUT_XPATH}  ${MGR_1.password}
    Click Element               ${LOGIN_SIGNIN_BUTTON_XPATH}
    Wait Until Page Contains Element     ${MAIN_PROFILE_NAME}
    Element Text Should Be      ${MAIN_PROFILE_NAME}  ${MGR_1.name}
    Element Text Should Be      ${MAIN_PROFILE_EMPLOYEEID}  ${MGR_1.id}
    Element Should Be Visible   ${MAIN_TIMESHEET_MODULE}
    Element Should Be Visible   ${MAIN_TIMETRACK_MODULE}
    Click Element               ${MAIN_PROFILE_PIC}
    Click Element               ${MAIN_LOGOUT}

Login web application as External Customer, and logout.
    Wait Until Page Contains Element    ${LOGIN_USER_INPUT_XPATH}
    Input Text                  ${LOGIN_USER_INPUT_XPATH}  ${EXT_1.id}
    Input Text                  ${LOGIN_PASS_INPUT_XPATH}  ${EXT_1.password}
    Click Element               ${LOGIN_SIGNIN_BUTTON_XPATH}
    Wait Until Page Contains Element     ${MAIN_PROFILE_NAME}
    Element Text Should Be      ${MAIN_PROFILE_NAME}  ${EXT_1.name}
    Element Text Should Be      ${MAIN_PROFILE_EMPLOYEEID}  ${EXT_1.id}
    Element Should Not Be Visible   ${MAIN_TIMESHEET_MODULE}
    Element Should Be Visible   ${MAIN_TIMETRACK_MODULE}
    Click Element               ${MAIN_PROFILE_PIC}
    Click Element               ${MAIN_LOGOUT}

# Access Timesheet Module
#     Click Element               ${MAIN_TIMESHEET_MODULE}
