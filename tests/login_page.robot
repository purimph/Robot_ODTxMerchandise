*** Settings ***
Library    Browser

*** Variables ***
${SITE_TEXT}    ODT x merchandise
${URL}     https://merchandise-dev.odds.team/index.html
${USERNAME}  customer1
${PASSWORD}  password

*** Test Cases ***
Check ODT x Merchandise website
    Open ODT x Merchandise website
    User login with valid account
    Close Browser
*** Keywords ***
Open ODT x Merchandise website
    New Browser    chromium    headless=False
    New Context
    New Page    ${URL}
    ${TITLE}=    Get Text  text=${SITE_TEXT}
    Should Be Equal    ${TITLE}  ${SITE_TEXT}

    Wait For Elements State    id=login-field    visible
    Wait For Elements State    id=password-field    visible
    Wait For Elements State    id=submit-button    visible
User login with valid account
    Fill Text    id=login-field    ${USERNAME}
    Fill Text    id=password-field    ${PASSWORD}
    Click    id=submit-button
    Wait For Elements State  data-testid=cart  visible
    ${URL_STORE}=  Get Url 
    Should Contain    ${URL_STORE}  store
    ${TITLE_PRODUCT}=    Get Text  text=products
    Should Be Equal    ${TITLE_PRODUCT}  products