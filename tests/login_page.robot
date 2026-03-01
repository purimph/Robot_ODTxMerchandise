*** Settings ***
Library    Browser

*** Variables ***
${text}    ODT x merchandise
${url}     https://merchandise-dev.odds.team/index.html


*** Test Cases ***
Check ODT x Merchandise website
    New Browser    chromium    headless=False
    New Context
    New Page    ${url}
    ${title}=    Get Text  text=ODT x merchandise
    Should Be Equal    ${title}  ${text}

    Wait For Elements State    id=login-field    visible
    Wait For Elements State    id=password-field    visible
    Wait For Elements State    id=submit-button    visible

    Close Browser
