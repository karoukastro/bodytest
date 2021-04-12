***Settings***
Documentation       Acoes da feature de gestao de alunos

***Variables***
${NAME_FIELD}          css=input[name=name] 
${EMAIL_FIELD}         css=input[name=email] 
${AGE_FIELD}           css=input[name=age]
${WEIGHT_FIELD}        css=input[name=weight]
${FEET_TALL_FIELD}     css=input[name=feet_tall]

**Keywords***
## Forms
Submit Student Form
    #<button color="#4DC097" type="submit" form="formStudent" label="" class="sc-csuQGl iAPAwe"><svg stroke="currentColor" fill="currentColor" stroke-width="0" 
    # viewBox="0 0 24 24" size="24" color="#fff" height="24" width="24" xmlns="http://www.w3.org/2000/svg" style="color: rgb(255, 255, 255);"><path d="M9 16.2L4.8 
    # 12l-1.4 1.4L9 19 21 7l-1.4-1.4L9 16.2z"></path></svg>Salvar</button>
    Click              xpath=//button[contains(text(), "Salvar")]   
    #Click             css=button[form=formStudent]
    #Click             css=button[type=submit]

New Student
    [Arguments]        ${student}

   #<input placeholder="Digite seu nome completo" class="sc-fjdhpX iylogV" id="name" name="name" aria-label="name" value="">
    Fill Text          ${NAME_FIELD}           ${student.name}

    #<input type="email" placeholder="Digite seu endereço de e-Mail" class="sc-fjdhpX iylogV" id="email" name="email" aria-label="email" value="">
    Fill Text          ${EMAIL_FIELD}           ${student.email}

    #<input type="number" placeholder="Sua Idade" class="sc-fjdhpX iylogV" id="age" name="age" aria-label="age" value="">
    Fill Text          ${AGE_FIELD}             ${student.age}

    #<input step="0.01" type="number" placeholder="Seu Peso" class="sc-fjdhpX iylogV" id="weight" name="weight" aria-label="weight" value="">
    Fill Text          ${WEIGHT_FIELD}          ${student.weight}

    #<input step="0.01" type="number" placeholder="Sua Altura" class="sc-fjdhpX iylogV" id="feet_tall" name="feet_tall" aria-label="feet_tall" value="">
    Fill Text          ${FEET_TALL_FIELD}      ${student.feet_tall}

    Submit Student Form

Update a Student
    [Arguments]        ${student}

    Fill Text          ${NAME_FIELD}            ${student['name']}
    Fill Text          ${EMAIL_FIELD}           ${student['email']}
    Fill Text          ${AGE_FIELD}             ${student['age']}
    Fill Text          ${WEIGHT_FIELD}          ${student['weight']}
    Fill Text          ${FEET_TALL_FIELD}       ${student['feet_tall']}

    Submit Student Form

Search Student By Name
    [Arguments]     ${name}

    Fill Text       css=input[placeholder="Buscar aluno"]       ${name}

## Links & Buttons
Go to Form Student
    # <a color="#4DC097" class="sc-cvbbAY glUTun" href="/alunos/new">
    Click                           css=a[href$="alunos/new"]       
    Wait For Elements State         css=h1 >> text=Novo aluno     visible     5  

Go to Student Update Form
    [Arguments]     ${email}

    #<td class="sc-jKJlTe lanLWo">
    #   <a class="edit" href="/alunos/197/edit" style="color: rgb(80, 114, 188);">
    # <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="edit" class="svg-inline--fa fa-edit fa-w-18 " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="currentColor" d="M402.6 83.2l90.2 90.2c3.8 3.8 3.8 10 0 13.8L274.4 405.6l-92.8 10.3c-12.4 1.4-22.9-9.1-21.5-21.5l10.3-92.8L388.8 83.2c3.8-3.8 10-3.8 13.8 0zm162-22.9l-48.8-48.8c-15.2-15.2-39.9-15.2-55.2 0l-35.4 35.4c-3.8 3.8-3.8 10 0 13.8l90.2 90.2c3.8 3.8 10 3.8 13.8 0l35.4-35.4c15.2-15.3 15.2-40 0-55.2zM384 346.2V448H64V128h229.8c3.2 0 6.2-1.3 8.5-3.5l40-40c7.6-7.6 2.2-20.5-8.5-20.5H48C21.5 64 0 85.5 0 112v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V306.2c0-10.7-12.9-16-20.5-8.5l-40 40c-2.2 2.3-3.5 5.3-3.5 8.5z"></path></svg> Editar</a></td>

    Click           xpath=//td[contains(text(), "${email}")]/..//a[@class="edit"]
    Wait For Elements State         css=h1 >> text=Edição de aluno     visible     5  

Request Removal By Email
    [Arguments]         ${email}

    Click               xpath=//td[contains(text(), "${email}")]/../td//button[@id="trash"]

    #Tabela
    #<tr class="sc-ckVGcZ foYhJp">
    #    <td class="sc-jKJlTe lanLWo">Carolina Castro</td>
    #    <td class="sc-jKJlTe lanLWo">carol@test.com</td>
    #    <td class="sc-jKJlTe dLYwSs">35</td>
    #    <td class="sc-jKJlTe lanLWo">
    #        <a class="edit" href="/alunos/96/edit" style="color: rgb(80, 114, 188);"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="edit" class="svg-inline--fa fa-edit fa-w-18 " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="currentColor" d="M402.6 83.2l90.2 90.2c3.8 3.8 3.8 10 0 13.8L274.4 405.6l-92.8 10.3c-12.4 1.4-22.9-9.1-21.5-21.5l10.3-92.8L388.8 83.2c3.8-3.8 10-3.8 13.8 0zm162-22.9l-48.8-48.8c-15.2-15.2-39.9-15.2-55.2 0l-35.4 35.4c-3.8 3.8-3.8 10 0 13.8l90.2 90.2c3.8 3.8 10 3.8 13.8 0l35.4-35.4c15.2-15.3 15.2-40 0-55.2zM384 346.2V448H64V128h229.8c3.2 0 6.2-1.3 8.5-3.5l40-40c7.6-7.6 2.2-20.5-8.5-20.5H48C21.5 64 0 85.5 0 112v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V306.2c0-10.7-12.9-16-20.5-8.5l-40 40c-2.2 2.3-3.5 5.3-3.5 8.5z"></path></svg> Editar</a></td>
    #    <td class="sc-jKJlTe lanLWo">
    #        <button color="#4DC097" id="trash" class="sc-gipzik hrUBYS" style="color: rgb(191, 79, 135);"><span><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="trash" class="svg-inline--fa fa-trash fa-w-14 " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16zM53.2 467a48 48 0 0 0 47.9 45h245.8a48 48 0 0 0 47.9-45L416 128H32z"></path></svg> Apagar</span></button></td></tr>
    
    # xpath=//td[contains(text(), "carol@test.com")]/../td//button[@id="trash"]

Confirm Removal
    Click       text=SIM, pode apagar!

Cancel Removal 
    Click                           text=NÃO

##Validations
Student Should Not Visible
    [Arguments]                 ${email}
    Wait For Elements State     xpath=//td[contains(text(), "${email}")]    detached    5

Student Should Be Visible
    [Arguments]                 ${email}
    Wait For Elements State     xpath=//td[contains(text(), "${email}")]    visible    5


     
Student Name Should Be Visible
    [Arguments]         ${name}
    
    Wait For Elements State     css=table tbody tr >> text=${name}        visible         5

