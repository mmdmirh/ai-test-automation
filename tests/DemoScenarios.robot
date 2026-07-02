*** Settings ***
Documentation    Demo scenarios used to showcase test reporting in the CI workflow:
...              one happy-path test that passes and one test that fails on purpose.
Resource         ../resources/Common.robot

Test Setup       Start Web Test    ${DEMO_URL}
Test Teardown    End Web Test

*** Variables ***
${DEMO_URL}    https://example.com

*** Test Cases ***
Happy Scenario - Example Page Loads Successfully
    [Documentation]    Happy path: the page loads and shows its expected heading.
    [Tags]    demo    happy
    Wait Until Element Is Visible    xpath=//h1    timeout=10s
    Element Text Should Be    xpath=//h1    Example Domain
    Page Should Contain    for use in documentation examples

Failed Scenario - Expected Text Is Missing
    [Documentation]    Deliberately failing test: it asserts text that does not exist on the page,
    ...                so the report always shows a failure.
    [Tags]    demo    failing
    Wait Until Element Is Visible    xpath=//h1    timeout=10s
    Page Should Contain    This text intentionally does not exist on the page
