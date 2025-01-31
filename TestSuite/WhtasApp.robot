*** Settings ***
Resource  ../Resources/base.resource

Suite Teardown  Run Keywords  Sleep  30  AND  Close all

*** Test Cases ***
CENÁRIO 01: Fluxo Completo Cadastro medicamento 
    Open whatsApp Web
    Search contact    #nome do contato
    Answer chatbot flow     #identicação do flow    caso de teste



