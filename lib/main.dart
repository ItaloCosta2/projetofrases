import 'package:flutter/material.dart'; // Importa os widgets do Flutter
import 'dart:math'; // Importa a biblioteca para gerar números aleatórios

void main(){
  runApp(MaterialApp( // Inicializa o app usando o Material Design
    home: Home(), // Define a tela inicial como o widget Home
    debugShowCheckedModeBanner: false, // Remove a faixa "Debug" no canto da tela
  ));
}

class Home extends StatefulWidget { // Cria um widget com estado dinâmico
  @override
  _HomeState createState() => _HomeState(); // Cria o estado do widget
}

class _HomeState extends State<Home> { // Define o estado da tela principal

  // Lista de frases que serão exibidas aleatoriamente
  var _frases = [
    "Sou apenas um pequeno planeta que se perde diariamente em todo o seu universo.",
    "Novas amizades serão sempre bem-vindas para darem cor e alegria ao meu dia a dia.",
    "Gratidão não é pagamento, mas um reconhecimento que se demonstra no dia a dia.",
    "Nem toda mudança importante acontece de repente e faz barulho, algumas são silenciosas e vão se fazendo no dia a dia."
  ];

  // Frase inicial exibida na tela
  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  // Função para gerar uma frase aleatória
  void _gerarFrase(){
    var numeroSorteado = Random().nextInt(_frases.length); // Gera um número aleatório entre 0 e 3

    setState(() { // Atualiza o estado do widget para refletir na tela
      _fraseGerada = _frases[numeroSorteado]; // Define a nova frase
    });
  }

  @override
  Widget build(BuildContext context) { // Monta a interface do app
    return Scaffold( // Estrutura principal da tela
      appBar: AppBar( // Barra superior do aplicativo
        title: Text("Frases do dia"), // Título da barra superior
        backgroundColor: Colors.green, // Cor da barra superior
      ),
      body: Center( // Centraliza o conteúdo na tela
        child: Container( // Container para organizar os elementos
          padding: EdgeInsets.all(16), // Adiciona espaçamento interno
          child: Column( // Organiza os elementos na vertical
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribui os elementos igualmente na tela
            crossAxisAlignment: CrossAxisAlignment.center, // Centraliza os elementos horizontalmente
            children: <Widget>[
              Image.asset("images/logo.png"), // Exibe uma imagem localizada na pasta "images"

              Text( // Exibe a frase atual
                _fraseGerada, // Texto da frase gerada
                textAlign: TextAlign.justify, // Justifica o texto
                style: TextStyle( // Define o estilo do texto
                    fontSize: 25, // Tamanho da fonte
                    fontStyle: FontStyle.italic, // Fonte em itálico
                    color: Colors.black // Cor do texto
                ),
              ),

              ElevatedButton( // Botão para gerar uma nova frase
                child: Text( // Texto dentro do botão
                  "Nova Frase",
                  style: TextStyle(
                      fontSize: 25, // Tamanho do texto
                      color: Colors.white, // Cor do texto
                      fontWeight: FontWeight.bold // Texto em negrito
                  ),
                ),
                onPressed: _gerarFrase, // Chama a função _gerarFrase ao clicar no botão
              )
            ],
          ),
        ),
      ),
    );
  }
}
