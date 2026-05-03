*** Settings ***
Library    Browser
Resource  ../resources/common.resource
Resource  ../resources/login_page.resource
Resource  ../resources/product_list_page.resource
Resource  ../resources/cart_page.resource
Resource  ../resources/variables.robot

Suite Setup      Open Browser To ODT
Suite Teardown   Close Browser

*** Test Cases ***
ODT x Merchandise website
    Open ODT x Merchandise website
    User login with valid account  ${USERNAME}  ${PASSWORD}

Add product to cart
    Redirect to product list page
    Product list should be displayed
    Add product to cart  ${SKU_PRODUCT_1}
    Click cart

Check out with invalid email address
    Product in cart should be correct  ${SKU_PRODUCT_1}
    Click checkout button
    Fill shipping address with invalid email
    Error message for invalid email should be displayed