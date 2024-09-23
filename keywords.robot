*** Settings ***
Library    SeleniumLibrary
Variables    variables.py

*** Keywords ***
# Keywords de Login e Navegação
Dado que o sistema está acessível na página de login
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Page Contains Element       //input[@name="username"]       120s

Quando eu fizer login com credenciais válidas
    Input Text    //input[@name="username"]    ${USERNAME} 
    Input Text    //input[@name="password"]    ${PASSWORD}
    Click Element    //button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"]

Então o sistema deve permitir a navegação pelos módulos principais
    Wait Until Page Contains Element    //a[@href="/web/index.php/admin/viewAdminModule"] 
    Click Link    //a[@href="/web/index.php/admin/viewAdminModule"]
    Wait Until Page Contains Element    //a[@href="/web/index.php/pim/viewPimModule"]
    Click Link    //a[@href="/web/index.php/pim/viewPimModule"]
    Capture Page Screenshot    Dashboard.png

# Keywords para Adicionar Funcionário
Dado que estou na página PIM
    Wait Until Page Contains Element    //a[@href="/web/index.php/pim/viewPimModule"]
    Click Link    //a[@href="/web/index.php/pim/viewPimModule"]

Quando eu preencher os dados do novo funcionário e salvar
    Wait Until Page Contains Element      (//button[@type="button"])[5]     120s
    Click Element                (//button[@type="button"])[5]   
    Wait Until Page Contains Element     //input[@name="firstName"]     
    Input Text    //input[@name="firstName"]    Test
    Input Text    //input[@name="lastName"]    Automation
    Click Element    //button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]

Então o funcionário deve ser adicionado com sucesso
    Capture Page Screenshot    2.NovoFuncionario.png

# Keywords para Excluir Funcionário
Dado que estou na lista de funcionários
    Wait Until Page Contains Element    //i[@class="oxd-icon bi-trash"]

Quando eu selecionar um funcionário para exclusão
    Click Element    //i[@class="oxd-icon bi-trash"]
    Click Element    //button[@class="oxd-button oxd-button--medium oxd-button--label-danger orangehrm-button-margin"]

Então o funcionário deve ser removido com sucesso
    Capture Page Screenshot    4.ExcluirFuncionario.png

# Keywords para Logout
Dado que estou logado no sistema
    # Placeholder caso haja verificação de login

Quando eu realizar o logout
    #Realizar logout

Então o navegador deve ser fechado
    Close Browser
