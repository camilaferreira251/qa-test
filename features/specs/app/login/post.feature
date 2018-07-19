#language: pt

Funcionalidade: Autenticação de usuário na API
    Sendo uma aplicação cliente
    Posso solicitar requisições POST para o serviço Authentication
    Para que o usuário faça a autenticação na API

    @vcr@login
    Cenário: Autenticar usuário na API

        Dado que o usuário se informou os seguintes dados:
            | email      | qa@veek.com.br |
            | password   | 123456         |
        Quando eu faço uma solicitação POST para o serviço Authentication
        Então o código de resposta HTTP deve ser igual a "200"
        E no corpo da resposta devo visualizar o token do usuário

    @vcr@login_invalid
    Esquema do Cenário: Autenticação com dados inválidos/incompletos

        Dado que o usuário se informou os seguintes dados:
            | username   |  <username>   |
            | email      |  <email>      |
            | password   |  <password>   |
            | client_id  |  <client_id>  |
            | grant_type |  <grant_type> |
        Quando eu faço uma solicitação POST para o serviço Authentication
        Então o código de resposta HTTP deve ser igual a "<status_code>"
        E no corpo da resposta devo ver a mensagem "<message>"

        Exemplos:
        | email          | password | status_code | message                   |
        | qaveek.com.br  | 123456   | 422         | Invalid email             |
        |                | 123456   | 422         | Email is required         |
        | qa@veek.com.br | 12345    | 422         | Invalid password          |
        | qa@veek.com.br |          | 422         | Password is required      |
