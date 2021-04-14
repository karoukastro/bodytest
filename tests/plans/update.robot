***Settings***
Documentation       Atualizacao de Planos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Atualizar um plano já cadastrado

    ${fixture}      Get JSON        plans-update.json

    ${fat}      Set Variable    ${fixture['before']}
    ${slim}     Set Variable    ${fixture['after']}

    Remove Plan                      ${fat['title']}
    Remove Plan                      ${slim['title']}

    Insert Plan                      ${fat}
    Go to Plans
    Search Plan By Title             ${fat['title']}   
    Go to Plan Update Form           ${fat['title']} 
    Update a Plan                    ${slim} 
    Toaster Text Should be           Plano Atualizado com sucesso

    [Teardown]                     Thinking And Taking Screenshot  2