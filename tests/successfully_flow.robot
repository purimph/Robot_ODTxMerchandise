*** Settings ***
Library    Browser
Resource  ../resources/common.resource
Resource  ../resources/login_page.resource
Resource  ../resources/product_list_page.resource
Resource  ../resources/cart_page.resource
Suite Setup      Open Browser To ODT
Suite Teardown   Close Browser

*** Variables ***
${USERNAME}  customer1
${PASSWORD}  password
${SKU_PRODUCT_1}  0000000001
${SKU_PRODUCT_2}  0000000002

*** Test Cases ***
ODT x Merchandise website
    Open ODT x Merchandise website
    User login with valid account  ${USERNAME}  ${PASSWORD}

Product list page
    Redirect to product list page
    Product list should be displayed
    Add product to cart  ${SKU_PRODUCT_1}
    Click cart

Cart page
    Product in cart should be correct  ${SKU_PRODUCT_1}
# Product list page is displayed
#     ${URL_STORE}=  Get Url 
#     Should Contain    ${URL_STORE}  store
#     ${TITLE_PRODUCT}=    Get Text  text=products
#     Should Be Equal    ${TITLE_PRODUCT}  products