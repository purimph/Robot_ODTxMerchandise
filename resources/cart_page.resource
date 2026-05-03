*** Settings ***
Resource  ../resources/variables.robot

*** Variables ***
${FIRST_NAME_FIELD}  data-testid=firstname-field
${LAST_NAME_FIELD}  data-testid=lastname-field
${EMAIL_FIELD}  data-testid=email-field
${ZIP_CODE_FIELD}  data-testid=zipcode-field
${CONFIRM_PAYMENT_BUTTON}  data-testid=confirm-payment-button

*** Keywords ***
Product in cart should be correct
    Wait For Elements State  data-testid=cart-item  visible
    [Arguments]  ${SKU}
    ${SKU_PRODUCT_CART}=  Get Attribute  data-testid=cart-item  data-sku
    Should Be Equal    ${SKU_PRODUCT_CART}  ${SKU}

Click checkout button
    Click    data-testid=checkout-button
    ${URL_CHECKOUT}=  Get Url
    Should Contain    ${URL_CHECKOUT}  check-out
    
Fill shipping address
    Fill Text  ${FIRST_NAME_FIELD}  ${FIRST_NAME}
    Fill Text  ${LAST_NAME_FIELD}   ${LAST_NAME}
    Fill Text  ${EMAIL_FIELD}  ${EMAIL}
    Fill Text  ${ZIP_CODE_FIELD}  ${ZIP_CODE}

Click confirm payment button
    Click  ${CONFIRM_PAYMENT_BUTTON}
    Wait For Elements State  text=Thank you for your order  visible

Empty cart
    Click  data-testid=cart
    Wait For Elements State  text=No item in cart.  visible

Continue shopping form cart page
    Click  data-testid=continue-shopping-link
    ${URL_STORE}=  Get Url
    Should Contain    ${URL_STORE}  store