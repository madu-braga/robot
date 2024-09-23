*** Settings ***
Library    SeleniumLibrary
Variables    variables.py

*** Keywords ***
# Keywords de Login e Navegação
Dado que o sistema está acessível na página de login
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Page Contains Element    xpath=//input[@name="username"]

Quando eu fizer login com credenciais válidas
    Input Text    xpath=//input[@name="username"]    ${USERNAME}
    Input Text    xpath=//input[@name="password"]    ${PASSWORD}
    Click Element    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"]

Então o sistema deve permitir a navegação pelos módulos principais
    Wait Until Page Contains Element    xpath=//a[@href="/web/index.php/admin/viewAdminModule"] 
    Click Link    xpath=//a[@href="/web/index.php/admin/viewAdminModule"]
    Wait Until Page Contains Element    xpath=//a[@href="/web/index.php/pim/viewPimModule"]
    Click Link    xpath=//a[@href="/web/index.php/pim/viewPimModule"]
    Capture Page Screenshot    1.Dashboard.png

# Keywords para Adicionar Funcionário
Dado que estou na página PIM
    Wait Until Page Contains Element    xpath=//a[@href="/web/index.php/pim/viewPimModule"]
    Click Link    xpath=//a[@href="/web/index.php/pim/viewPimModule"]

Quando eu preencher os dados do novo funcionário e salvar
    Wait Until Page Contains Element    xpath=//input[@name="firstName"]
    Input Text    xpath=//input[@name="firstName"]    Test
    Input Text    xpath=//input[@name="lastName"]    Automation
    Input Text    xpath=//input[@class="oxd-input oxd-input--focus"]    12345
    Click Element    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]

Então o funcionário deve ser adicionado com sucesso
    Capture Page Screenshot    2.NovoFuncionario.png

# Keywords para Editar Funcionário
Dado que estou na página de detalhes do funcionário
    Wait Until Page Contains Element    xpath=//a[@href="/web/index.php/pim/viewPersonalDetails/empNumber/208"]
    Click Link    xpath=//a[@href="/web/index.php/pim/viewPersonalDetails/empNumber/208"]

Quando eu modificar os dados e salvar
    Input Text    xpath=(//input)[2]    Test Automation Updated
    Click Element    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]

Então os dados do funcionário devem ser atualizados com sucesso
    Capture Page Screenshot    3.EditarFuncionario.png

# Keywords para Excluir Funcionário
Dado que estou na lista de funcionários
    Wait Until Page Contains Element    xpath=//i[@class="oxd-icon bi-trash"]

Quando eu selecionar um funcionário para exclusão
    Click Element    xpath=//i[@class="oxd-icon bi-trash"]
    Click Element    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--label-danger orangehrm-button-margin"]

Então o funcionário deve ser removido com sucesso
    Capture Page Screenshot    4.ExcluirFuncionario.png

# Keywords para Logout
Dado que estou logado no sistema
    # Placeholder caso haja verificação de login

Quando eu realizar o logout
    Close Browser
