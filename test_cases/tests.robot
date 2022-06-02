*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    Chrome
${url}    https://robotframework.org
${reference installation command}    pip install robotframework
${reference version command}    robot --version
${pass status}    PASS

*** Test Cases ***
Check the site header buttons
    Open Roboframework
    sleep    1
    click button    go-to-Getting started
    sleep    1
    click button    go-to-Resources
    sleep    1
    click button    go-to-Community
    sleep    1
    click button    go-to-Development
    sleep    1
    click button    Docs
    sleep    1
    click button    External sites
    sleep    1
    close browser

Check the work of the editor
    Open Roboframework
    click button    go-to-Getting started
    sleep    1
    click button    Learn
    sleep    1
    click button    Install
    sleep    1
    ${installation command}    get text    //*[@id="app"]/div[5]/div[2]/div[2]/div/div[2]/div/pre[1]
    Should Be Equal As Strings    ${installation command}    ${reference installation command}
    ${version command}    get text    //*[@id="app"]/div[5]/div[2]/div[2]/div/div[2]/div/pre[2]
    Should Be Equal As Strings    ${version command}    ${reference version command}
    click button    Editor
    sleep    1
    click button    Run
    sleep    20
    ${status 1}    get text    //*[@id="output"]/span[1]
    Should Be Equal As Strings    ${status 1}    ${pass status}
    ${status 2}    get text    //*[@id="output"]/span[2]
    Should Be Equal As Strings    ${status 2}    ${pass status}
    ${status 3}    get text    //*[@id="output"]/span[3]
    Should Be Equal As Strings    ${status 3}    ${pass status}
    ${status 4}    get text    //*[@id="output"]/span[4]
    Should Be Equal As Strings    ${status 4}    ${pass status}
    click button    next: Simple Example 2
    sleep    1
    click button    Run
    sleep    7
    click button     next: Advanced Example
    sleep    1
    click button    Run
    sleep    7
    click button    next: BDD-Example
    sleep    1
    click button    Run
    sleep    7
    click button    next: Variables
    sleep    1
    click button    Run
    sleep    10
    click button    next: FOR-Loops
    sleep    1
    click button    Run
    sleep    25
    click button    next: IF-Expression
    sleep    1
    click button    Run
    sleep    7
    click button    next: Custom
    sleep    1
    click button    Run
    sleep    7

    close browser

Test Case
    Open Roboframework
    click button     go-to-Resources
    sleep    1
    click button     Show more
    sleep    1
    click button     Built-in
    sleep    1
    click button     Show more
    sleep    1
    click button     Tools
    sleep    1
    click button     Show more
    sleep    1

    close browser


*** Keywords ***
Open Roboframework
    Open Browser  ${url}  ${browser}
    maximize browser window
