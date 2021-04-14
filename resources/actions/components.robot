***Settings***
Documentation       Acoes de componentes genericos

***Keywords***
## Validations
Toaster Text Should be
    [Arguments]                 ${expect_text}
    Wait For Elements State     css=.Toastify__toast-body >> text=${expect_text}       visible     5  

#    Wait For Elements State     css=.Toastify__toast-body       visible     5
#    Get Text                    css=.Toastify__toast-body   should be        Usuário ou senha inválido     # Ponto é para classe

Toaster Error Text Should be
    [Arguments]                 ${expect_text}
    Wait For Elements State     css=.Toastify__toast--error >> text=${expect_text}       visible     5  

Alert Text Should Be
    [Arguments]                 ${expect_text}
    Wait For Elements State     css=form span >> text=${expect_text}       visible     5  

Field Should be Type
    [Arguments]         ${element}          ${type}
    ${attr}             Get Attribute       ${element}     type
    Should Be equal     ${attr}         ${type}

Register Should Not Be Found
    Wait For Elements State             css=div >> text=Nenhum registro encontrado.        visible         5
    Wait For Elements State             css=table       detached        5

Total Items Should Be 
    [Arguments]         ${number}

    ${element}          Set Variable       css=#pagination .total

    #<div id="pagination" class="sc-jlyJG fLwDpw">
    #    <strong class="total">Total: 3</strong>
    #    <span class="items">Página: 1/1 itens por página: 5</span></div>
    Wait For Elements State     ${element}        visible         5
    Get Text                    ${element}        ==            Total: ${number}

## Return Elements & Texts
Get Required Alerts
    [Arguments]                 ${index}
        
    ${span}     Get Text        xpath=(//form//span)[${index}]

    [return]    ${span}

## Links & Buttons
Confirm Removal
    Click       text=SIM, pode apagar!

Cancel Removal 
    Click                           text=NÃO