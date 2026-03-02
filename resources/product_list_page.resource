*** Variables ***
${SITE_TEXT}    ODT x merchandise
${PRODUCT_NAME_1}  TerraFlex Hoodie
${PRODUCT_NAME_2}  NordicPeak Jacket


*** Keywords ***
Redirect to product list page
    ${URL_STORE}=  Get Url
    Should Contain    ${URL_STORE}  store
    ${TITLE_PRODUCT}=    Get Text  text=products
    Should Be Equal    ${TITLE_PRODUCT}  products
    Wait For Elements State  data-testid=cart  visible

Product list should be displayed
    ${PRODUCT_1}=  Get Text  text=${PRODUCT_NAME_1}
    Should Be Equal    ${PRODUCT_1}  ${PRODUCT_NAME_1}
    ${PRODUCT_2}=  Get Text  text=${PRODUCT_NAME_2}
    Should Be Equal    ${PRODUCT_2}  ${PRODUCT_NAME_2}

Add product to cart
    [Arguments]  ${SKU}
    Click    css=div[data-sku="${SKU}"] >> data-testid=add-to-cart-button
    Wait For Elements State  data-testid=cart-items-count  visible

Click cart
    Click    data-testid=cart
    ${URL_CART}=  Get Url
    Should Contain    ${URL_CART}  cart
    Wait For Elements State  text=your cart  visible
    Wait For Elements State  data-testid=checkout-button  visible