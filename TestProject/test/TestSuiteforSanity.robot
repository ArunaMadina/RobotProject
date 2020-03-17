*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem   

Suite Setup    Log    I am inside Test Suite Setup
Suite Teardown    Log    I am inside Test Suite Teardown    
Test Setup    Log    I am inside Test case setup
Test Teardown    Log    I am inside Test case teardown  

Default Tags    sanity

*** Variables ***
#Scalar 
${URL}    http://cgu:Ebix754bat@172.16.45.122/CguB2B/Default_s.aspx?referrer=CGUDIR
#list
@{CREDENTIALS}    -test-insnet    testuser
#Dictionary
&{LOGINDATA}    username=-test-insnet    password=testuser

*** Keywords ***
LoginKW
    Input Text    name=userId    @{CREDENTIALS}[0]
    Input Text    id=password    &{LOGINDATA}[password]
    Click Link    id=login     
    

*** Test Cases ***
MyFirstTest
    [Tags]    smoke
    Log    Hello World... 
    Open Browser     https://google.com    chrome
    Set Browser Implicit Wait    5
    Input Text    name=q    Automation
    Press Keys    name=q    ENTER
    Sleep    2    
    Close Browser
          
    
SampleLoginTest
    [Documentation]    login
    Open Browser    ${URL}   Chrome
    Sleep    2
    # user defined keyword LoginKW
    LoginKW
    Close Browser
    Log    Test Completed
#Environment varaibles
    Log    This text was executed by %{username} on %{os}  
    
SampleTest
    Log    Sample test   
    Set Tags    regression1
    Remove Tags    regression1

LastTest
    Log    I am inside last test
    
        
    

        
    