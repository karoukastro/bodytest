***Settings***
Documentation       Buscar Alunos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Busca exata

    &{student}          Create Dictionary   name=Steve Jobs     email=jobs@test.com     age=70       weight=89      feet_tall=1.80

    Remove Student By Name              ${student.name}
    Insert student                      ${student} 
    Go to Students
    Search Student By Name              ${student.name}    
    Student Name Should Be Visible      ${student.name}
    Total Items Should Be               1

Cenario: Registro não encontrado
    ${name}             Set Variable    Barão Zemo
    Remove Student By Name              ${name}  
    Go to Students
    Search Student By Name              ${name} 
    Register Should Not Be Found

Cenario: Busca alunos por um único termo

    ${fixture}          Get JSON        students-search.json
    ${students}         Set Variable    ${fixture['students']}

    ${word}          Set Variable    ${fixture['word']}
    ${total}         Set Variable    ${fixture['total']}

    Remove Student By Name              ${word}

    #Log to Console      ${json_object['students']}

    FOR     ${item}     IN      @{students}
        Insert Student      ${item}
    END

    Go to Students
    Search Student By Name      ${word} 

    FOR     ${item}     IN      @{students}
        Student Name Should Be Visible      ${item['name']}
    END
    Total Items Should Be       ${total}     
