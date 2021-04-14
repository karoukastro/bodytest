***Settings***
Documentation       Ações da feature de gestão de planos

***Variables***
${TITLE_FIELD}      id=title
${DURATION_FIELD}   id=duration
${PRICE_FIELD}      css=input[name=price]
${TOTAL_FIELD}      css=input[name=total]

***Keywords***
## Forms
Submit Plan Form
    Click           xpath=//button[contains(text(), "Salvar")]

Fill Plan Form
    [Arguments]     ${plan}

    Fill Text       ${TITLE_FIELD}        ${plan.title}
    Fill Text       ${DURATION_FIELD}     ${plan.duration}
    Fill Text       ${PRICE_FIELD}        ${plan.price}

Search Plan By Title
    [Arguments]     ${title}

    Fill Text       css=input[placeholder="Buscar plano"]       ${title}

Update a Plan
    [Arguments]        ${plan}

    Fill Text          ${TITLE_FIELD}            ${plan['title']}
    Fill Text          ${DURATION_FIELD}         ${plan['duration']}
    Fill Text          ${PRICE_FIELD}            ${plan['price']}

    Submit Plan Form

## Links & Buttons
Go To Form Plan
    Click       css=a[href$="planos/new"]
    Wait For Elements State     css=h1 >> text=Novo plano     visible     5

Go to Plan Update Form
    [Arguments]     ${title}

    Click           xpath=//td[contains( text(), "${title}")]/..//a[@class="edit"]
    Wait For Elements State         css=h1 >> text=Edição de plano     visible     5  

## Validations
Total Plan Should Be
    [Arguments]     ${total}

    Get Attribute       ${TOTAL_FIELD}      value    ==    ${total}   
