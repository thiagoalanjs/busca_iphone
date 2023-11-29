*** Settings ***
Resource    ../main.robot
Library    XML

*** Variables ***
 
${SELECT_PRICE}              id:a-autoid-0 
${SELECT_HIGH_PRICE}         id:s-result-sort-select_2
${SELECT_LOW_PRICE}          id:s-result-sort-select_1
${RESULT_TEXT}               xpath://*[@id="search"]/span[2]/div/h1/div/div[1]/div/div
${RESULT_LINE}               css:span[contains(@class, a-size-base-plus a-color-base a-text-normal)]
${TOTAL_IPHONE}              xpath://h2/a/span[contains(text(), 'Apple')]  
${GET_HIGH_PRICE}            xpath://*[@id="search"]/div[1]/div[1]/div/span[1]/div[1]/div[3]/div/div/span/div/div/div[2]/div[2]/div/div[1]/a/span/span[2]/span[2]             
${OTHER_PRODUCT}             css:div > div:nth-child(1) > a > span > span:nth-child(2) > span.a-price-whole
${URL_API}                   https://open.er-api.com/v6    
${BASE_CURRANCY}             BRL
${TARGET_CURRANCY}           USD
${API_KEY}                   0fe2076a30acc7ab76dcd9b52a0f6d01

*** Keywords ***



Dado verifico total de produtos que retornaram da busca      
    ${text1}=   Get Text   ${RESULT_TEXT}
    Log To Console       ${text1}

E verifico o total de Iphones encontrados
    ${Total_iphone}=    Get Length    ${TOTAL_IPHONE}  
    Log To Console    "Total e Iphones que retornaram da busca: "${Total_iphone}
    
Então valido que 80% dos itens encontrados devem ser iphone
    ${Total_iphone}=    Get Length    ${TOTAL_IPHONE}  
    ${Total_line}=      Get Length     ${RESULT_LINE}
    ${Result}=          Set Variable     ${${Total_iphone} * 100 / ${Total_line}}  
    ${formatted_percentage}=    Evaluate    round(${Result}, 2)
    Log To Console    "Percentual de Iphone retornado na tela: ${formatted_percentage}%"
    ${is_greater_or_equal}    Evaluate    ${formatted_percentage} >= 80  
    Should Be True    ${is_greater_or_equal}

Quando pesquiso Iphone mais caro
    Click Element     ${SELECT_PRICE}
    Click Element     ${SELECT_HIGH_PRICE}
    Sleep    4s
    ${iphone_high_price}=     Get Text    ${GET_HIGH_PRICE}
    Log To Console    ${iphone_high_price} 

Então o valor dele convertido para US$ deverá ser menor que US$2000 
    ${iphone_high_price}=     Get Text                ${GET_HIGH_PRICE} 
    ${price_float}=           Set Variable            ${iphone_high_price.replace('.', '').replace(',', '.')}
    Create Session    Exchangeratesapi    ${URL_API}    verify=true
    ${response}=    GET On Session   Exchangeratesapi    url=/latest/${BASE_CURRANCY}?apikey=${API_KEY}&symbols=${TARGET_CURRANCY}  
    Should Be Equal As Strings    ${response.status_code}    200 
    ${exchange_rate}    Set Variable    ${response.json()['rates']['${TARGET_CURRANCY}']}
    ${amount_in_brl}    Set Variable    ${price_float}
    Set Global Variable      ${amount_in_brl}
    ${amount_in_usd}    Evaluate    ${amount_in_brl} * ${exchange_rate}
    ${converted_result}=     Evaluate     round(${amount_in_usd}, 2)
    Log To Console   Valor do Iphone mais caro ${amount_in_brl} de BRL para USD: ${converted_result}    
    ${is_greater_or_equal}    Evaluate    ${converted_result} <= 2000  
    Should Be True    ${is_greater_or_equal} 
Quando verifico produtos que não são Iphone
    Click Element     ${SELECT_PRICE}
    Click Element     ${SELECT_LOW_PRICE}
    Sleep    4s 
    
Então verifico que o valor é menor que o Iphone 
    ${get_price_other_product}=     Get Text     ${OTHER_PRODUCT}  
    Log To Console    "Valor do produto mais barato que não é iPhone R$ ${get_price_other_product} "  
    Log To Console    "Valor iPhone R$ ${amount_in_brl}"
    ${is_greater_or_equal}    Evaluate    ${get_price_other_product} <= ${amount_in_brl}
    Should Be True    ${is_greater_or_equal} 

    