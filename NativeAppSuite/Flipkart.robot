*** Settings ***
Library    AppiumLibrary    


*** Test Cases ***
TC1_Verify_Invalid_login
    Open Application    http://localhost:4726/wd/hub    
    ...    platformName=android
    ...    deviceName=oneplus
    ...    appPackage=com.flipkart.android
    ...    appActivity=com.flipkart.android.SplashActivity
    ...    noReset=True
    
    Set Appium Timeout    30s
    Run Keyword And Ignore Error    Click Element    //*[@text="English"]
    Run Keyword And Ignore Error    Click Element    //*[@text="CONTINUE"]    
    Run Keyword And Ignore Error    Click Element    //*[contains(@text,"08655118611")]
    Wait Until Page Contains Element    //*[contains(@text,"Search for Products, Brands and More")]
    Click Element    //*[contains(@text,"Search for Products, Brands and More")]
    Input Text    //*[contains(@text,"Search for Products, Brands and More")]    Reebok mens shoes
    Click Element    //*[@text="reebok shoes men running"]
    Run Keyword And Ignore Error    Click Element    //*[@text="CONTINUE"]    #Kyrus 1.0 Running Shoes For Men Total Amount
    
    FOR    ${i}    IN RANGE    0    999
        ${output}    Run Keyword And Ignore Error    Click Element    //*[contains(@text,"Kyrus 1.0 Running Shoes For Men")]        
        Swipe By Percent    50    75    50    25    1000    
        Exit For Loop If    '${output}[0]'=='PASS'
    END
    Click Element    //*[contains(@text,"ADD TO CART")]
    Wait Until Page Contains Element    //*[@text="9"]
    Click Element    //*[@text="9"]
    Wait Until Page Contains Element    //*[contains(@text,"CONTINUE")]
    Click Element    //*[contains(@text,"CONTINUE")]
    Wait Until Page Contains Element    //*[contains(@text,"GO TO CART")]    
    Click Element    //*[contains(@text,"GO TO CART")]
    Wait Until Page Contains Element    //*[@text="Qty: 1"]    
    Element Should Contain Text    //*[@text="Qty: 1"]    1
    Element Should Contain Text    //*[contains(@text,"REEBOK Kyrus 1.0 Running Shoes For Men")]    REEBOK Kyrus 1.0 Running Shoes For Men
    Element Should Contain Text    //*[contains(@text,"2,079")]    2,079
    Click Element    //*[contains(@text,"Remove")]
    #Click A Point    756    1268    1000
    Wait Until Page Contains Element    xpath=(//*[contains(@text,"Remove")])[2]    
    Click Element    xpath=(//*[contains(@text,"Remove")])[2]    