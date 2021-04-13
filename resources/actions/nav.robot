***Settings***
Documentation       Acoes do menu superior de navegacao

***Keywords***
User Should Be Logged In
    [Arguments]     ${user_name}
    Get Text        css=aside strong    should be   Administrador

Go to Students
    # $ termina com alunos    <a class="sc-EHOje iSDdWL active" href="/alunos" aria-current="page" style="color: rgb(25, 25, 32);">ALUNOS</a>
    Click                           css=a[href$=alunos]   
    # <h1 class="sc-chPdSV esgOZN">Gestão de Alunos</h1>
    Wait For Elements State         css=h1 >> text=Gestão de Alunos     visible     5 

Go to Plans
    Click                           css=a[href$=planos]   
    Wait For Elements State         css=h1 >> text=Gestão de Planos     visible     5 

Go to Enrolls
    Click                           css=a[href$=matriculas]   
    Wait For Elements State         css=h1 >> text=Gestão de Matrículas     visible     5 