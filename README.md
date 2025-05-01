# atividadeMedidor

 Medidor de Progresso Circular

Objetivo
Este projeto Flutter implementa um medidor de progresso circular customizado com animação, utilizando `CustomPainter` e `AnimationController`. O usuário insere uma porcentagem e visualiza o progresso animado até o valor informado.

INSTALAÇÃO

 Requisitos
- Flutter 3.10 ou superior
- Dart SDK

 Passos

git clone https://github.com/joaomferraz/MedidorProgresso.git
cd medidor_progresso_flutter
flutter pub get
flutter run

 Estrutura do Projeto

[estrutura_projeto](screenshots/estrutura.png)

Capturas de Tela

40% de Progresso
[40%](screenshots/40p.jpg)

 75% de Progresso
[75%](screenshots/75p.jpg)

 Dependências
Apenas o SDK do Flutter:

dependencies:
  flutter:
    sdk: flutter


 Uso
O aplicativo inicia com uma tela onde o usuário:
1. Digita um valor percentual (0 a 100);
2. Pressiona "Iniciar";
3. Visualiza a animação circular exibindo o progresso até o valor inserido.

 Observações

- Os dados são validados para garantir entrada entre 0 e 100;
- A lógica de UI e animação está separada em arquivos específicos para manter organização e modularidade.


