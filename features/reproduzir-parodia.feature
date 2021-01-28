#language: pt

Funcionalidade: Reproduzir Paródia
    Sendo um usuário cadastrado
    Quero reproduzir musicas no player do Parodify
    Para que eu possa ouvir as paródias das minhas bandas favoritas

    # isso é uma pré-condição
    Contexto: Login 
        * Login com "petherson@gmail.com" e "pet123"
        # OBS: eu posso colocar tbm nesse campo "Dado que estou logado com "petherson@gmail.com""
        # se eu fizer isso no step "Dado que eu gosto muito de "Rock"" tenho que trocar para "E que eu gosto muito de "Rock""

    Cenário: Ouvir Paródia
        Dado que eu gosto muito de "Rock"
        Quando toco a seguinte canção:
            |parodia | Sprints de Luta Sprints de Gloria |
            |banda   | Charlie Brown Bug                 |
        Então essa paródia deve ficar em modo de reprodução