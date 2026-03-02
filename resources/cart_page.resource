*** Variables ***

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
    Fill Text  data-testid=firstname-field  QA
    Fill Text  data-testid=lastname-field   Automation
    Fill Text  data-testid=email-field  automation@mailinator.com
    Fill Text  data-testid=zipcode-field  12345

Click confirm payment button
    Click  data-testid=confirm-payment-button
    Wait For Elements State  text=Thank you for your order  visible
