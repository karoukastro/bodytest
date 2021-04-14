***Settings***
Documentation       Remover Planos

Resource            ${EXECDIR}/resources/base.robot

Test Setup          Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Remover plano cadastrado

    &{plan}         Create Dictionary       title=Plano Del      duration=24     price=10.00

    Insert Plan                      ${plan}

    Go to Plans
    Search Plan By Title             ${plan['title']}
    Request Removal By Title         ${plan['title']}
    Confirm Removal
    Toaster Text Should be           Plano removido com sucesso

Cenario: Desistir da exclusão de Plano
    
    &{plan}         Create Dictionary       title=Plano Cancel     duration=11     price=55.00

    Insert Plan                      ${plan}

    Go to Plans
    Search Plan By Title             ${plan['title']}
    Request Removal By Title         ${plan['title']}
    Cancel Removal
    Plan Should Be Visible           ${plan['title']}
