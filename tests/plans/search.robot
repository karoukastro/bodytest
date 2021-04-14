***Settings***
Documentation       Buscar Planos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Busca exata
    &{plan}     Create Dictionary       title=Plano Busca      duration=8     price=35.89

    Insert Plan                      ${plan}
    Go to Plans
    Search Plan By Title             ${plan['title']}   
    Plan Should Be Visible           ${plan['title']}
    Total Items Should Be               1

Cenario: Registro não encontrado
    ${title}        Set Variable     Plano dos Gordinhos

    Go to Plans
    Search Plan By Title             ${title}   
    Register Should Not Be Found

Cenario: Busca alunos por um único termo

    ${fixture}       Get JSON        plans-search.json
    
    ${plans}         Set Variable    ${fixture['plans']}
    ${word}          Set Variable    ${fixture['word']}
    ${total}         Set Variable    ${fixture['total']}

    FOR     ${item}     IN      @{plans}
        Insert Plan      ${item}
    END

    Go to Plans
    Search Plan By Title             ${word}  

    FOR     ${item}     IN      @{plans}
        Plan Should Be Visible      ${item['title']}
    END
    Total Items Should Be       ${total}     