*** Settings ***
Documentation       Test checkboxes

Library             Browser


*** Variables ***
${PAGE}              checkboxes
${FIRST_CHECKBOX}    *css=#checkboxes > :nth-child(1)


*** Tasks ***
Checkboxes
    Open A Page ${PAGE}
    Checkbox Is Unchecked
    Click The First Checkbox


*** Keywords ***
Open A Page ${PAGE}
    New Browser    browser=%{BROWSER}    headless=%{HEADLESS}
    New Page       %{BASE_URL}/${PAGE}

Click The First Checkbox
    Check Checkbox       ${FIRST_CHECKBOX}

Checkbox Is Unchecked
    ${CHECKBOX_STATE}    Get Checkbox State    ${FIRST_CHECKBOX}
    Should Be Equal      "${CHECKBOX_STATE}"    "False"

Checkbox Is Checked
    ${CHECKBOX_STATE}    Get Checkbox State    ${FIRST_CHECKBOX}
    Should Be Equal      "${CHECKBOX_STATE}"    "True"

Post-conditions
    Close Browser
