*** Variables ***
${BASE_URL}    https://merchandise-dev.odds.team/index.html

*** Keywords ***
Open Browser To ODT
    New Browser    chromium    headless=False
    New Context
    New Page    ${BASE_URL}