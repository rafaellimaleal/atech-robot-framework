*** Settings ***

Resource    ../resources/base.robot

*** Test Cases ***
Deve cadastrar um novo usuário
    &{user}    Create Dictionary    name=Rafa Leal    email=teste@gmail.com    password=teste1234
    Deleta usuário banco de dados    ${user}[email]    
    Start Session
    Go to signup
    Register user    ${user} 
    Notice should be    Boas vindas ao Mark85, o seu gerenciador de tarefas.    

Usuário duplicado
    &{user}    Create Dictionary    name=Nome Duplicado    email=duplicidade@gmail.com    password=teste1234
    Deleta usuário banco de dados    ${user}[email]   
    Start Session
    Go to signup
    Register user    ${user} 
    Register user    ${user} 
    Notice should be    Oops! Já existe um cadastro com e-mail informado.

Nome deve ser obrigatório
    &{user}    Create Dictionary    name=${EMPTY}    email=nomeobrigatorio@gmail.com    password=teste1234
    Start Session
    Go to signup
    Register user    ${user}
    Field Mandatory should be    Informe seu nome completo


Email deve ser obrigatório
    &{user}    Create Dictionary    name=Homer Simpson    email=${EMPTY}    password=teste1234
    Start Session
    Go to signup
    Register user    ${user}
    Field Mandatory should be    Informe seu e-email

Senha deve ser obrigatória
    &{user}    Create Dictionary    name=Homer Simpson    email=homer@gmail.com    password=${EMPTY}
    Start Session
    Go to signup
    Register user    ${user}
    Field Mandatory should be    Informe uma senha com pelo menos 6 digitos