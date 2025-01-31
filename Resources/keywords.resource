*** Settings ***
Resource    ../Resources/base.resource

*** Keywords ***
Open whatsApp web
    Set Global Variable    ${DOWNLOAD_DIR}    ${CURDIR}${/}Downloads
    ${prefs}    Create Dictionary    download.default_directory=${DOWNLOAD_DIR}    safebrowsing.enabled=false
    ${options}    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    ${user_data_path}    Set Variable        ~/Library/Application Support/Google/Chrome
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --user-data-dir\=${user_data_path}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Open Browser    https://web.whatsapp.com/    chrome    options=${options}
    Set Selenium Timeout    60
    Maximize Browser Window

Search contact 
    [Arguments]  ${contact_name}
    
    Wait Until Element Is Visible    ${contact_search_input}    30
    Input Text    ${contact_search_input}    ${contact_name}
    Wait Until Element Is Enabled    ${contact_box.format(text='${contact_name}')}    8
    Sleep    3
    Click Element    ${contact_box.format(text='${contact_name}')}
    Set Suite Variable    ${contact_name}

Send message 
    [Arguments]    ${message}

    Wait Until Element Is Enabled   ${message_input}    8
    Input Text    ${message_input}   ${message}
    Press Keys    none    RETURN
    Sleep    1

Answer chatbot flow 
    [Arguments]    ${flow}    ${test_case}

    ${cpf_fake}    FakerLibrary.cpf
    ${nome_fake}    FakerLibrary.Name

    ${file}    Load JSON From File    ${CURDIR}${/}flows${/}${flow}{/}${test_case}.json    UTF-8

    ${question_and_answer_of_cpf}    Create List    ${file["cpf_paciente"][0]}    ${cpf_fake}
    Set To Dictionary    ${file}    cpf_paciente=${question_and_answer_of_cpf}

    ${question_and_answer_of_nome}    Create List    ${file["nome_completo"][0]}    ${nome_fake}
    Set To Dictionary    ${file}    nome_paciente=${question_and_answer_of_nome}

    FOR    ${value}    IN    @{file.values()}
        Sleep    2

        ${question}    Set Variable    ${value}[0]
        ${answer}    Set Variable    ${value}[1]

        Wait Until Element Is Visible    ${bot_message.format(text='${question}')}    15
        Send message   ${answer}
    END

Close all
    Capture Page Screenshot
    Close All Browsers

