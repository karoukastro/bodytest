***Settings***
Documentation       Cadastro de Planos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Calcular preço total do plano

    &{plan}     Create Dictionary       title=Carol Teste   duration=12     price=19,99    total=R$ 239,88
    
    Go to Plans
    Go to Form Plan
    Fill Plan Form          ${plan}
    Total Plan Should Be    ${plan.total}
