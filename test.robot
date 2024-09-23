*** Settings ***
Library 	SeleniumLibrary

*** Variables ***
${BROWSER}        edge
${URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAME}       Admin
${PASSWORD}       admin123
${TESTE}            123

*** Test Cases ***
Login e Navegação no Sistema
    [Documentation]    Caso de teste para login e navegação no OrangeHRM Demo.
    # Abrir o navegador e acessar a URL
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Page Contains Element          xpath=//input[@name="username"]   
    # Realizar login
    Input Text    xpath=//input[@name="username"]    ${USERNAME}
    Input Text    xpath=//input[@name="password"]    ${PASSWORD}
    Click Element              xpath=//button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"]
    Capture Page Screenshot    1.Login.png

Navegação
    # Navegar pelas seções principais do dashboard
    Wait Until Page Contains Element          xpath=//a[@href="/web/index.php/admin/viewAdminModule"] 
    Click Link            xpath=//a[@href="/web/index.php/admin/viewAdminModule"]  # Admin
    Wait Until Page Contains Element         xpath=//a[@href="/web/index.php/pim/viewPimModule"] 
    Click Link    xpath=//a[@href="/web/index.php/pim/viewPimModule"]      # PIM
    Wait Until Page Contains Element                xpath=//a[@href="/web/index.php/dashboard/index"]        
    Click Link    xpath=//a[@href="/web/index.php/dashboard/index"]        # Dashboard
    Wait Until Page Contains Element                 xpath=//a[@href="/web/index.php/directory/viewDirectory"]    
    Click Link    xpath=//a[@href="/web/index.php/directory/viewDirectory"] # Directory
    Capture Page Screenshot    2.Dashs.png

Adicionar Novo Funcionário
    [Documentation]    Adicionar novo funcionário na seção PIM. 
    # Navegar para a seção de PIM e adicionar novo funcionário
    Wait Until Page Contains Element                 xpath=//a[@href="/web/index.php/pim/viewPimModule"]       
    Click Link              xpath=//a[@href="/web/index.php/pim/viewPimModule"]
    Wait Until Page Contains Element                 xpath=(//button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"])[1]              
    Click Element    xpath=(//button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"])[1]  # Add Employee  
    # Preencher os detalhes do novo funcionário
    Wait Until Page Contains Element              xpath=//input[@name="firstName"] 
    Input Text    xpath=//input[@name="firstName"]    Test
    Input Text    xpath=//input[@name="lastName"]     Automation
    Input Text    xpath=//input[@class="oxd-input oxd-input--focus"]    12345  # Employee ID
    Wait Until Page Contains Element                      xpath=//button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]                  
    Click Element    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]  # Save
    Capture Page Screenshot    2.NovoFuncionario.png

Editar Dados do Funcionário
    [Documentation]    Editar informações de um funcionário existente.
    # Selecionar o funcionário na lista e editar os detalhes
    Wait Until Page Contains Element                        xpath=//a[@href="/web/index.php/pim/viewPersonalDetails/empNumber/208"]                    
    Click Link    xpath=//a[@href="/web/index.php/pim/viewPersonalDetails/empNumber/208"]
    Wait Until Page Contains Element                    Input Text    xpath=(//input)[2]                 
    Input Text    xpath=(//input)[2]    Test Automation Updated
    Wait Until Page Contains Element                    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]                
    Click Element    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]  # Save Changes

Excluir Funcionário
    [Documentation]    Excluir um funcionário.
    # Selecionar o funcionário para exclusão
    Wait Until Page Contains Element               xpath=//i[@class="oxd-icon bi-trash"]
    Click Element    xpath=//i[@class="oxd-icon bi-trash"]
    Wait Until Page Contains Element              xpath=//i[@class="oxd-icon bi-trash"]               
    Click Element    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--label-danger orangehrm-button-margin"]  # Confirm Delete

Sair
    [Documentation]    Sair 
    # Sair
    Close Browser
