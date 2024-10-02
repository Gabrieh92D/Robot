*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}       colocar_url
${USERNAME}  colocar_usuario
${PASSWORD}  colocar_senha
${PLACA}     ABC4606  

*** Test Cases ***
Aceitar Cookies, Testar Login, Entrar na Holding Nortix e clicar na aba Administrador
    [Documentation]    Teste completo que realiza login, clica no botão da Holding Nortix, entrar na aba Administrador e verifica se a página foi carregada corretamente.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Aceitar Cookies
    Input Username
    Input Password
    Clicar no Botão de Login
    Verificar Se Login Foi Bem-Sucedido
    Usar o scroll ate achar o Holding Nortix
    Clicar no Botão da Holding Nortix
    Verificar Se Entrou na Holding Nortix
    Clicar no botao Administrador
    Close Browser

*** Keywords ***
Aceitar Cookies
    [Documentation]    Aceita os cookies na página inicial, se o botão de aceitação estiver visível.
    Wait Until Element Is Visible    xpath=//span[text()='Aceito']    timeout=10
    Click Element    xpath=//span[text()='Aceito']

Input Username
    [Documentation]    Insere o nome de usuário no campo de login.
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='email']    timeout=10
    Input Text    xpath=//input[@formcontrolname='email']    ${USERNAME}

Input Password
    [Documentation]    Insere a senha no campo de senha.
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='password']    timeout=10
    Input Text    xpath=//input[@formcontrolname='password']    ${PASSWORD}

Clicar no Botão de Login
    [Documentation]    Clica no botão de login para submeter as credenciais.
    Wait Until Element Is Visible    xpath=//button[@type='submit']    timeout=10
    Click Button    xpath=//button[@type='submit']

Verificar Se Login Foi Bem-Sucedido
    [Documentation]    Verifica se o login foi bem-sucedido ao checar se a página de seleção de acesso foi carregada.
    Wait Until Element Is Visible    xpath=//h4[contains(text(), 'Selecione um acesso para continuar:')]    timeout=10

Usar o scroll ate achar o Holding Nortix
    [Documentation]    Procurar na pagina o botão Holding Nortix
    Scroll Element Into View     xpath=//h4[contains(text(),'Holding Nortix')]

Clicar no Botão da Holding Nortix
    [Documentation]    Clica no botão da Holding Nortix para entrar na página correspondente.
    Wait Until Element Is Visible    xpath=//h4[contains(text(),'Holding Nortix')]    timeout=10
    Click Element    xpath=//h4[contains(text(),'Holding Nortix')]

Clicar no botao Administrador
    [Documentation]    Clicar na aba Administrador
    Wait Until Element Is Visible    xpath=//span[contains(text(),'Administrador')]    timeout=10
    Click Element    xpath=//span[contains(text(),'Administrador')]
    Wait Until Element Is Visible    xpath=//span[contains(text(),'Módulo')]    timeout=10

Verificar Se Entrou na Holding Nortix
    [Documentation]    Verifica se a página da Holding Nortix foi carregada corretamente ao procurar pelo título da página.
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Dashboard')]    timeout=10
