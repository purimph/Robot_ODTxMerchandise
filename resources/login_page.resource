*** Variables ***
${BASE_URL}    https://merchandise-dev.odds.team/index.html
${USERNAME_FIELD}  id=login-field
${PASSWORD_FIELD}  id=password-field
${LOGIN_BUTTON}  id=submit-button
${SITE_TEXT}    ODT x merchandise

*** Keywords ***
Open ODT x Merchandise website
    Go To   ${BASE_URL}
    Wait For Elements State    text=${SITE_TEXT}  visible
    Wait For Elements State    ${USERNAME_FIELD}    visible
    Wait For Elements State    ${PASSWORD_FIELD}    visible
    Wait For Elements State    ${LOGIN_BUTTON}    visible

User login with valid account
    [Arguments]  ${username}  ${password}
    Fill Text    ${USERNAME_FIELD}    ${username}
    Fill Text    ${PASSWORD_FIELD}    ${password}
    Click    ${LOGIN_BUTTON}
    Wait For Elements State  text=products  visible

