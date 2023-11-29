*** Settings ***
Library    SeleniumLibrary
Resource    ../main.robot

*** Variables ***
${BROWSER}                   Chrome
${URL}                       https://www.google.com.br/
${FIELD_SEARCH_GOOGLE}       id:APjFqb
${LINK_AMAZON}               xpath://*[@id="tads"]/div/div/div/div/div[1]/a/div[1]/span  
${FIELD_SEARCH_AMAZON}       id:twotabsearchtextbox
${BTN_SEARCH_AMAZON}         id:nav-search-submit-button 

*** Keywords ***

Dado que acesso o site amazon.com.br
    Open Browser  url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Input Text         ${FIELD_SEARCH_GOOGLE}      Amazon Brasil
    Press Keys         ${FIELD_SEARCH_GOOGLE}      ENTER
    Sleep    2s
    Click Element      ${LINK_AMAZON}  
    Sleep    2s
    Input Text         ${FIELD_SEARCH_AMAZON}      IPhone    
    Click Button       ${BTN_SEARCH_AMAZON} 
Fechar o navegador
    Close Browser    