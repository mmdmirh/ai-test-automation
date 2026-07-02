*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SEARCH_BOX}       name=q
${SEARCH_BUTTON}    name=btnK

*** Keywords ***
Verify Google Search Page Is Open
    Wait Until Page Contains Element    ${SEARCH_BOX}    timeout=5s

Enter Search Term
    [Arguments]    ${search_term}
    Wait Until Element Is Visible    ${SEARCH_BOX}    timeout=5s
    Input Text    ${SEARCH_BOX}    ${search_term}

Submit Search
    # Pressing Enter is more reliable than clicking the button since the autocomplete list can overlay it.
    Press Keys    ${SEARCH_BOX}    ENTER
