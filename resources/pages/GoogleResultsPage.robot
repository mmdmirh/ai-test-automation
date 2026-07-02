*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${RESULTS_CONTAINER}    id=search

*** Keywords ***
Verify Search Results Page Finished Loading
    Wait Until Page Contains Element    ${RESULTS_CONTAINER}    timeout=10s

Verify Search Results Contain Text
    [Arguments]    ${expected_text}
    Wait Until Page Contains    ${expected_text}    timeout=5s

Verify Result Header Contains
    [Arguments]    ${expected_text}
    # Wait for the result headers to appear and verify that the specified text is present in one of them
    Wait Until Element Is Visible    xpath=//h3    timeout=5s
    Page Should Contain Element      xpath=//h3[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '${expected_text.lower()}')]
