***Settings***
Documentation       Gestão de matrículas

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Deve exibir data inicial e final conforme o plano escolhido
    
    ${fixture}                  Get JSON        enroll-dates.json
    ${john}                     Set Variable    ${fixture['student']}
    ${black}                    Set Variable    ${fixture['plan']}

    Insert Student              ${john}
    Insert Plan                 ${black}

    Go to Enrolls
    Go to Form Enrolls
    Select Student              ${john['name']}
    Select Plan                 ${black['title']}
    Start Date Should Be Today
    End Date Should Be          ${fixture['days']}

Cenario: Deve matricular um aluno em um plano

    ${fixture}                  Get JSON        enroll-create.json
    ${sara}                     Set Variable    ${fixture['student']}
    ${fit}                      Set Variable    ${fixture['plan']}

    Insert Student              ${sara}
    Insert Plan                 ${fit}
 
    Go to Enrolls
    Go to Form Enrolls
    Select Student              ${sara['name']}
    Select Plan                 ${fit['title']}
    Submit Enrolls Form
    Toaster Text Should be      Matrícula cadastrada com sucesso

    [Teardown]                  Thinking And Taking Screenshot      5