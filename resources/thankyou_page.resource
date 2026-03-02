*** Variables ***

*** Keywords ***
Thank you page should be displayed
    ${GET_TEXT}=  Get Text  text=Thank you for your order.
    Should Be Equal    ${GET_TEXT}  Thank you for your order.
    Wait For Elements State  text=Thank you for your order.  visible
    Wait For Elements State  data-testid=back-to-store-button  visible