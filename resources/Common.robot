*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            https://www.google.com
${HEADLESS}       ${False}

*** Keywords ***
Start Web Test
    [Arguments]    ${start_url}=${URL}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-blink-features\=AutomationControlled
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    user-agent\=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36
    Run Keyword If    ${HEADLESS}    Call Method    ${options}    add_argument    --headless\=new
    Open Browser    ${start_url}    ${BROWSER}    options=${options}
    Maximize Browser Window
    Bypass Consent If Present

End Web Test
    Close Browser

Bypass Consent If Present
    # Google sometimes displays a consent popup. We handle it here if it exists.
    # The 'Accept all' button ID is usually L2AGLb.
    ${consent_present}=    Run Keyword And Return Status    Wait Until Page Contains Element    id=L2AGLb    timeout=3s
    Run Keyword If    ${consent_present}    Click Button    id=L2AGLb
