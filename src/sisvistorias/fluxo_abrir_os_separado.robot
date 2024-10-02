*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}       colocar_url
${USERNAME}  colocar_usuario
${PASSWORD}  colocar_senha
${PLACA}     ABC4606  

*** Test Cases ***
Entrar no site e fazer uma OS
    [Documentation]    Teste completo que realiza login, clica no botão da Holding Nortix, entrar na aba Administrador e verifica se a página foi carregada corretamente.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Aceitar Cookies
    Login
    Senha
    Clicar no Botão de Login
    Verificar Se Login Foi Bem-Sucedido
    Clicar no Botão da Holding Nortix
    Clicar no botao Servico
    Clicar no botao Novo
    Verificar Se Entrou na Aba Novo
    Selecione o servico
    Selecione o tipo de veiculo
    Coloque a placa desejada
    Clicar em iniciar
    Clicar em Confirmar
    Selecionar Vistoriador Solicitante Parceiro - 1 Identificacao
   # Preencher dados do veiculo - 2 Veiculo
    Close Browser

*** Keywords ***
# ----------------------------------------
# Ações de Aceitação de Cookies
# ----------------------------------------
Aceitar Cookies
    [Documentation]    Aceita os cookies na página inicial, se o botão de aceitação estiver visível.
    Wait Until Element Is Visible    xpath=//span[text()='Aceito']    timeout=10
    Click Element    xpath=//span[text()='Aceito']

# ----------------------------------------
# Login
# ----------------------------------------
login
    [Documentation]    Insere o nome de usuário no campo de login.
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='email']    timeout=10
    Input Text    xpath=//input[@formcontrolname='email']    ${USERNAME}

Senha
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

# ----------------------------------------
# Navegação na Página
# ----------------------------------------
Clicar no Botão da Holding Nortix
    [Documentation]    Clica no botão da Holding Nortix para entrar na página correspondente.
    Wait Until Element Is Visible    xpath=//h4[contains(text(),'S J RIO PRETO')]    timeout=10
    Click Element    xpath=//h4[contains(text(),'S J RIO PRETO')]

Clicar no botao Servico
    [Documentation]    Clicar na aba Serviço
    Wait Until Element Is Visible    xpath=//span[contains(text(),"Serviços")]    timeout=20
    Sleep    2s
    Click Element    xpath=//span[contains(text(),"Serviços")]

Clicar no botao Novo
    [Documentation]    Clicar na aba Novo
    Wait Until Element Is Visible    xpath=//span[contains(text(),'Novo')]    timeout=10
    Click Element    xpath=//span[contains(text(),'Novo')]

Verificar Se Entrou na Aba Novo
    [Documentation]    Validar se clicou e entrou na aba Novo
    Wait Until Element Is Visible    xpath=//h4[contains(text(),'Novo laudo')]    timeout=10

# ----------------------------------------
# Seleção de Serviço e Veículo
# ----------------------------------------
Selecione o servico
    [Documentation]    Selecionar o serviço
    Sleep    2s
    Click Element    xpath=//span[contains(text(),"Laudo Cautelar")]
    Sleep    2s
    Click Element    xpath=//span[contains(text(),"Laudo de Vistoria Cautelar")]
    Sleep    2s

Selecione o tipo de veiculo
    [Documentation]    Selecionar o tipo de veiculo
    Click Element    xpath=//span[contains(text(),"Automóvel")]
    Sleep    2s

Coloque a placa desejada
    [Documentation]    Colocar a placa desejada
    Input Text    xpath=//input[@id='inputParametroDeInicio']    ${PLACA}
    Sleep    2s

Clicar em iniciar
    [Documentation]    Clicar no botão iniciar para abrir o laudo
    Scroll Element Into View     xpath=//p[contains(text(),"Iniciar")]
    Sleep    2s
    Click Element    xpath=//button[contains(@class, 'p-button-raised') and contains(@class, 'p-mr-2')]
    Sleep    2s

Clicar em Confirmar
    [Documentation]    Confirmar o inicio de OS
    Click Element    xpath=//button//p[contains(text(), 'Confirmar')]
    Sleep    5s

# ----------------------------------------
# Selecionar Vistoriador e Parceiro
# ----------------------------------------
Selecionar Vistoriador Solicitante Parceiro - 1 Identificacao
    [Documentation]    Nesta etapa iremos validar e selecionar o Vistoriador, solicitante e parceiro
    Scroll Element Into View    xpath=//button//p[contains(text(), 'Selecionar Vistoriador')]
    Sleep    2s
    Click Element    xpath=//button//p[contains(text(), 'Selecionar Vistoriador')]
    Sleep    2s
    Click Element    xpath=//span[contains(@class, 'p-dropdown-label')]
    Sleep    2s
    Click Element    xpath=//span[contains(text(),"Marco Antonio")]
    Sleep    2s
    Click Element    xpath=//span[contains(text(),"Confirmar")]
    Sleep    2s
    Scroll Element Into View    xpath=//button//p[contains(text(), 'Selecionar Solicitante')]
    Sleep    2s
    Click Element    xpath=//button//p[contains(text(), 'Selecionar Solicitante')]
    Sleep    2s
    Click Element    xpath=//button[contains(text(), 'Buscar')]
    Sleep    2s
    Click Element    xpath=//button[@ptooltip='Selecionar cliente']
    Sleep    2s
    Click Element    xpath=//button//p[contains(text(), 'Selecionar Parceiro')]
    Sleep    2s
    Click Element    xpath=//button[contains(text(), 'Buscar')]
    Sleep    2s
    Click Element    xpath=//button[@ptooltip='Selecionar cliente']

# ----------------------------------------
# Preencher dados do veículo
# ----------------------------------------
#Preencher dados do veiculo - 2 Veiculo
#    [Documentation]    Preencher os dados do veículo
 #   Click Element    xpath=//a[contains(@class, 'p-menuitem-link')]//span[text()='Veículo']
  #  Sleep    4s
