Dado('Login com {string} e {string}') do |email, password|
    visit "http://parodify.qaninja.com.br/"
    click_on "Login"

    find('#user_email').set email
    find('#user_password').set password
    click_on "Log in"
end
  
Dado('que eu gosto muito de {string}') do |categoria|
    find("a[href='/search/new']").click
    find("img[src$='#{categoria.downcase}.png']").click
end
  
Quando('toco a seguinte canção:') do |table|
   
#    eu só tenho acesso a variavel parody dentro desse Step (quando) para eu ter acesso em outros Step (então) eu tive que colocar o @ na frente
    @parody = table.rows_hash

    #    A automação do próximo click é uma estratégia de escopo
    #    a automação vai busacar o elemento 'a' que tem o texto [:banda] essa banda está devinida no arquivo reproduzir-parodia.feature é uma palavra chave
   find('a', text: @parody[:banda]).click

    #    Só buscar por '.fa-play-circle' não iria adiantar pois tinha em mais de um lugar usei o elemento pai
    #    Na linha a seguir estou buscando pela classe '.song-item' que tem o texto parodia [:parodia] essa parodia está definida no arquivo reproduzir-parodia.feature é uma palavra chave
    #    guardei a busca que fiz (chamado tbm de elemento) dentro de uma variavel que chamei de song
    #    então somente dentro de song(song é um elemento) eu vou buscar por '.fa-play-circle'
   song = find('.song-item', text: @parody[:parodia])
   song.find('.fa-play-circle').click
    #    esse .click é um pouco diferente do .click_on , esse clicl_on serve para clicar em um botão com texto
end
  
Então('essa paródia deve ficar em modo de reprodução') do

    #   Quando eu cliquei no icone do play o site acrescentou uma nova classe
    #   eu busquei por um elemento que tem a classe '.playing' e quardei dentro da variavel song_play
    #   Em seguida eu fiz uma validação. eu busquei por um elemento que está em execução e pergunto se dentro do elemento tem o texto [:parodia]
    song_play = find('.playing')
    expect(song_play).to have_text @parody[:parodia]
end