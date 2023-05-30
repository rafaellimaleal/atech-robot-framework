*** Settings ***
Documentation    Conexao banco

Library   RobotMongoDBLibrary.Insert
Library   RobotMongoDBLibrary.Update
Library   RobotMongoDBLibrary.Find
Library   RobotMongoDBLibrary.Delete

*** Variables ***
&{MONGODB_CONNECT_STRING}=   connection=mongodb+srv://qax:xperience@cluster0.3jcda8x.mongodb.net/markdb?retryWrites=true&w=majority    database=markdb   collection=users

*** Keywords ***

Consulta usuário banco de dados
    [Arguments]        ${email}
    &{FILLTER}     Create Dictionary   ${email}
    ${RESULTS}     Find    ${MONGODB_CONNECT_STRING}    ${FILLTER}
    FOR    ${RESULT}    IN    @{RESULTS}
           Log To Console    Email:${RESULT["email"]} Nome: ${RESULT["nome"]}
    END

Deleta usuário banco de dados
    [Arguments]        ${email}
    &{FILLTER}     Create Dictionary   email=${email}
    ${MSG}     Delete One    ${MONGODB_CONNECT_STRING}    ${FILLTER}
    Log    ${MSG}