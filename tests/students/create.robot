***Settings***
Documentation       Cadastro de Alunos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Novo Aluno

    &{student}                      Create Dictionary   name=Carolina Castro     email=carol@test.com     age=35       weight=53      feet_tall=1.59 

    Remove Student                  ${student.email}
    Go to Students
    Go to Form Student
    New Student                     ${student}        

    #Toaster de Sucesso
    #<div role="alert" class="Toastify__toast-body">Aluno cadastrado com sucesso.</div>
    Toaster Text Should be         Aluno cadastrado com sucesso.

    [Teardown]                     Thinking And Taking Screenshot  2

Cenario: Nao deve permitir email duplicado
    [tags]      dup
    &{student}                      Create Dictionary   name=Caio Marcio     email=caio@test.com     age=36       weight=80      feet_tall=1.73 

    Insert Student                  ${student}
    Go to Students
    Go to Form Student
    New Student                     ${student}        

    Toaster Text Should be         Email já existe no sistema.

    [Teardown]                     Thinking And Taking Screenshot  2

Cenario: Todos os campos devem ser obrigatorios
    @{expect_alerts}                Set Variable        Nome é obrigatório      O e-mail é obrigatório      idade é obrigatória     o peso é obrigatório    a Altura é obrigatória
    @{got_alerts}                   Create List         

    Go to Students
    Go to Form Student
    Submit Student Form

#    FOR         ${alert}    IN      @{expect_alerts}
#    Alert Text Should Be            ${alert}                     
#    END

    FOR     ${index}        IN RANGE    1   6
        ${span}             Get Required Alerts     ${index}
        Append To List      ${got_alerts}          ${span}
    END

    Log     ${expect_alerts}  
    Log     ${got_alerts}  

    Lists should be equal       ${expect_alerts}        ${got_alerts} 

Cenario: Validacao dos campos numericos
    [tags]          temp
    [Template]      Check Type Filed on Student Form
    ${AGE_FIELD}             number
    ${WEIGHT_FIELD}          number
    ${FEET_TALL_FIELD}       number

Cenario: Validar campo do tipo email
    [tags]          temp
    [Template]      Check Type Filed on Student Form
    ${EMAIL_FIELD}           email

Cenario: Menor de 14 anos não pode fazer cadastro
    &{student}                      Create Dictionary   name=Livia da Silva     email=livia@test.com     age=13       weight=45      feet_tall=1.55 

    Go to Students
    Go to Form Student
    New Student                     ${student}        
    Alert Text Should Be            A idade deve ser maior ou igual 14 anos


***Keywords***
Check Type Filed on Student Form
    [Arguments]                 ${element}      ${type}

    Go to Students
    Go to Form Student
    Field Should be Type        ${element}      ${type}
