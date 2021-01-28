#language: pt

Funcionalidade: Cadastro de Usuários
    Sendo um visitiante do site Parodify
    Quero fazer o meu cadastro
    Para que eu possa ouvir minhas músicas favoritas

    @happy
    Cenário: Cadastro
        Dado que acesso a página de cadastro
        Quando submeto o meu cadastro com:
            | email           | petherson@gmail.com |
            | senha           | pet123              |
            | senhas_confirma | pet123              |
        Então devo ser redirecionado para a área logada

    Esquema do Cenário: Tentativa de Cadastro

        Dado que acesso a página de cadastro
        Quando submeto o meu cadastro com:
            | email           | <email>           |
            | senha           | <senha>           |
            | senhas_confirma | <senhas_confirma> |
        Então devo ver a mensagem: "<mensagem_saida>"

        Exemplos:
            | email            | senha  | senhas_confirma | mensagem_saida                       |
            |                  | pet123 | pet123          | Oops! Informe seu email.             |
            | pet123@gmail.com |        |                 | Oops! Informe sua senha.             |
            | pet123@gmail.com | pet123 | 123pet          | Oops! Senhas não são iguais.         |
            |                  |        |                 | Oops! Informe seu email e sua senha. |

    @temp
    Cenário: Validação do campo email

        Quando acesso a página de cadastro
        Então deve exibir o seguinte css: "input[type=email]"