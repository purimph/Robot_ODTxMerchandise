*** Variables ***

*** Keywords ***
Click cart
    Click    data-testid=cart
    ${URL_CART}=  Get Url
    Should Contain    ${URL_CART}  cart
    Wait For Elements State  text=your cart  visible
    Wait For Elements State  data-testid=checkout-button  visible

Product in cart should be correct
    Wait For Elements State  data-testid=cart-item  visible
    [Arguments]  ${SKU}
    ${SKU_PRODUCT_CART}=  Get Attribute  data-testid=cart-item  data-sku
    Should Be Equal    ${SKU_PRODUCT_CART}  ${SKU}
    