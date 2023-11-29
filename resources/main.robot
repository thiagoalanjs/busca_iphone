*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_BR
Library    RequestsLibrary
Library    Collections
Resource    shared/setup_teardown.robot
Resource    pages/busca_produto_page.robot