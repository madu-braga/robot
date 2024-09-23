*** Settings ***
Resource    keywords.robot
Library     YAML
#Variables   variables.yaml

*** Test Cases ***
Realizar login no sistema e navegar pelos módulos
    [Documentation]    Caso de teste para realizar login e navegar pelos módulos principais.
    Dado que o sistema está acessível na página de login
    Quando eu fizer login com credenciais válidas
    Então o sistema deve permitir a navegação pelos módulos principais

Adicionar um novo funcionário na seção PIM
    [Documentation]    Caso de teste para adicionar um novo funcionário.
    Dado que estou na página PIM
    Quando eu preencher os dados do novo funcionário e salvar
    Então o funcionário deve ser adicionado com sucesso

Editar dados de um funcionário existente
    [Documentation]    Caso de teste para editar um funcionário existente.
    Dado que estou na página de detalhes do funcionário
    Quando eu modificar os dados e salvar
    Então os dados do funcionário devem ser atualizados com sucesso

Excluir um funcionário existente
    [Documentation]    Caso de teste para excluir um funcionário.
    Dado que estou na lista de funcionários
    Quando eu selecionar um funcionário para exclusão
    Então o funcionário deve ser removido com sucesso

Sair do sistema
    [Documentation]    Caso de teste para realizar logout do sistema.
    Dado que estou logado no sistema
    Quando eu realizar o logout
    Então o navegador deve ser fechado
