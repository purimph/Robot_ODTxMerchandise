*** Settings ***
Library    Browser
Resource  ../resources/common.resource
Resource  ../resources/login_page.resource
Resource  ../resources/variables.robot
Resource  ../resources/cart_page.resource
Resource  ../resources/product_list_page.resource

Suite Setup      Open Browser To ODT
Suite Teardown   Close Browser

*** Test Cases ***
ODT x Merchandise website
    Open ODT x Merchandise website
    User login with valid account  ${USERNAME}  ${PASSWORD}

Click cart with empty cart
    Click cart
    Empty cart
