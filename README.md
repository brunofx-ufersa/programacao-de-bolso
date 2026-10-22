# Programação de Bolso
## Usando o celular como laboratório de programação

A ação de ensino "Programação de Bolso" busca ensinar programação usando o celular. O aparelho móvel passa a ser o laboratório, o dispositivo de entrada, a tela, o sensor e o objeto programável. O aluno, que pode ser um iniciante absoluto em programação, não precisa de computador em nenhum momento. Cada módulo é um projeto que usa um recurso do celular e ensina um conceito. O celular não é só tela, mas um computador com GPS, acelerômetro, câmera, microfone, bússola, vibração, internet e tela sensível ao toque. 

Dessa forma, a proposta é transformar o _smartphone_ de um simples dispositivo de consumo em uma estação de desenvolvimento portátil. Para este fim, usaremos um interpretador BASIC (RFO Basic) que roda em Android, com um editor de texto, que permite que programadores escrevam rapidamente aplicativos com acesso à maioria dos recursos do dispositivo. 

A RFO Basic pode ser classificada principalmente como uma linguagem imperativa e procedural, com uma abordagem de programação orientada a comandos e APIs do dispositivo. Imperativo, pois descrevemos uma sequência de instruções que modificam o estado do programa: variáveis, posições, pontuações, estados de jogo etc. Procedural, porque organizamos o código em rotinas e sub-rotinas, com chamadas, parâmetros e estruturas de controle. O diferencial desta abordagem é a orientação a serviços. Comandos específicos permitem trabalhar com tela, interface gráfica, áudio, síntese de voz, localização e sensores, por exemplo. 

Portanto, não trata-se de um curso convencional de linguagem de programação, mas aprender algoritmos construindo coisas que interagem com o mundo físico por meio do celular. Há também uma diferença importante de motivação. Um programa em Python que imprime números na tela pode ser um excelente exercício de algoritmos, mas um programa em RFO BASIC que utiliza o acelerômetro para movimentar um personagem oferece uma experiência imediatamente tangível. Isso não torna uma linguagem intrinsecamente melhor para aprender programação. São maneiras diferentes de aproximar o estudante dos conceitos. 

# Material

O material de estudo foi escrito em [Typst](https://typst.app/). O Typst é uma linguagem de marcação e um sistema de composição tipográfica voltado à criação de documentos com aparência profissional. Ela é uma alternativa moderna ao LaTeX, mas com uma sintaxe mais simples e uma experiência de edição mais próxima da de uma linguagem de programação.

O conteúdo usa a primeira disponível das seguintes fontes:

- Texto: Inter, Liberation Sans
- Código: JetBrains Mono, Fira Code e DejaVu Sans Mono

Para visualização do documento, usamos o plugin `Tinymist Typst` do VS Code. Já para compilar para PDF, execute o comando `typst compile arquivo.typ`. Não esqueça de instalar o [compilador](https://typst.app/open-source/).

Caso não queira editar este curso e fazer contribuições, você pode encontrar as aulas em `.pdf` e os códigos dos programas na aba *Actions* (ações). Clica no _workflow_ mais recente com o _ticket_ verde. No final da página você vai encontrar os *Artifacts* (artefatos) para _download_.


# Organização do Conteúdo


| Etapa  | Conceitos e Recursos |
|--------|----------------------|
| Aula 00 | Instalação e configuração do ambiente |
| Aula 01 | Entrada de dados, exibição na tela, tomada de decisão e síntese de voz |
| Aula 02 | Expressões, números aleatórios, formatação de texto e caixa de diálogo |
| Aula 03 | Laço `for`, acumulador e quiz da tabuada |
| Aula 04 | Laço `while`, sentinela, laços aninhados e quiz da tabuada turbinado |
| Aula 05 | Laço `do`, açúcar sintático, acelerômetro e variável de estado |
| Aula 06 | Tela gráfica, formas geométricas, coordenadas, animação e colisão |
| Aula 07 | Funções, parâmetros, escopo, retorno e `include` |




 



