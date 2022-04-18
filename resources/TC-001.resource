
*** Variables ***
# Environment Related
${ENV_LOGIN_URL}            %{TARGET_URL}/index.html
${ENV_BROWSER_APP}          Chrome 

### HTML elements xpath

## Login web application
# Actions
${LOGIN_USER_INPUT_XPATH}           xpath:/html/body/div[1]/main/div[1]/form/div[1]/div/input
${LOGIN_PASS_INPUT_XPATH}           xpath:/html/body/div[1]/main/div[1]/form/div[2]/div/input
${LOGIN_SIGNIN_BUTTON_XPATH}        xpath:/html/body/div[1]/main/div[1]/form/button[1]
${LOGIN_FORGOTPASS_BUTTON_XPATH}    xpath:/html/body/div[1]/main/div[1]/form/button[2]
# Verify
${MAIN_PROFILE_NAME}                xpath:/html/body/div[1]/div/header[1]/div/div/div[2]/div[1]/span[1]
${MAIN_PROFILE_EMPLOYEEID}          xpath:/html/body/div[1]/div/header[1]/div/div/div[2]/div[1]/span[2]
${MAIN_PROFILE_PIC}                 xpath:/html/body/div[1]/div/header[1]/div/div/div[2]/button
${MAIN_LOGOUT}                      xpath:/html/body/div[3]/div[3]/ul/li[3]

## 
${MAIN_TIMESHEET_MODULE}                 xpath://div[./img[contains(@src, "%{TARGET_URL}/Timesheetb.svg")] and h5="Timesheet"]
${MAIN_TIMETRACK_MODULE}                 xpath://div[./img[contains(@src, "%{TARGET_URL}/TimeTrackb.svg")] and h5="Timetrack"]

*** Keywords ***
Get Module Button Text
    [Arguments]                     ${arg0}
    ${value0} =  Get Value          xpath://h5
    RETURN                          ${value0}
