***Settings***
Documentation      Tudo comeca aqui, meu arquivo base do projeto de automacao

Library         Browser
Library         Collections
Library         libs/DeloreanLibrary.py
Library         OperatingSystem

Resource        actions/auth.robot
Resource        actions/nav.robot
Resource        actions/students.robot
Resource        actions/components.robot
Resource        actions/plans.robot

***Keywords***
Start Browser Session
    New Browser     chromium    False
    New Page        about:blank

Start Admin Session
    Start Browser Session
    Go To Login Page
    auth.Login With                 admin@bodytest.com     pwd123
    User Should Be Logged In        Administrador

Clear LS And Take Screenshot
    Take Screenshot
    LocalStorage Clear

Thinking And Taking Screenshot
    [Arguments]     ${timeout}

    Sleep       ${timeout}
    Take Screenshot

###Helpers
Get JSON 
    [Arguments]     ${file_name}

    ${file}=            Get File                 ${EXECDIR}/resources/fixtures/${file_name}
    ${json_object}      Evaluate                json.loads($file)       json
    [return]            ${json_object}
 