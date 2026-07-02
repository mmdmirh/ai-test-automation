*** Settings ***
Documentation    A test suite for Google Search using the Page Object Model (POM).
Resource         ../resources/Common.robot
Resource         ../resources/pages/GoogleSearchPage.robot
Resource         ../resources/pages/GoogleResultsPage.robot

Test Setup       Start Web Test
Test Teardown    End Web Test

*** Variables ***
${SEARCH_TERM}          Robot Framework
${EXPECTED_RESULT}      robotframework.org

*** Test Cases ***
Search Google For Robot Framework And Verify Result Website
    [Documentation]    Verifies that searching Google for "Robot Framework" returns the official website in results.
    # Excluded in CI: Google often blocks datacenter IPs (CAPTCHA), making it flaky on GitHub runners.
    [Tags]    local-only
    Verify Google Search Page Is Open
    Enter Search Term    ${SEARCH_TERM}
    Submit Search
    Verify Search Results Page Finished Loading
    Verify Search Results Contain Text    ${EXPECTED_RESULT}
    Verify Result Header Contains         Robot Framework
