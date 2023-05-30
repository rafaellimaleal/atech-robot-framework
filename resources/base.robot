*** Settings ***
Documentation    Tudo começa aqui

Library   Browser
Resource   ../resources/RobotMongoDB.robot
Resource   pages/signup.robot

*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000/