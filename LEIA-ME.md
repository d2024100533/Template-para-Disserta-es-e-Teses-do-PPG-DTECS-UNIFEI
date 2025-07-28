Bem-vindo(a) ao template LaTeX do PPG-DTECS. Este ficheiro é um guia de consulta rápida para o ajudar a começar. A filosofia deste modelo é simples: configure uma vez, use em todo o lado.


1. Estrutura de Ficheiros Essencial
***********************************
Para começar, você só precisa de se preocupar com os seguintes ficheiros e pastas:

- configuracoes.tex: É aqui que todas as informações principais do seu trabalho são definidas. Comece por este ficheiro.

- Capitulos/: Pasta onde a sua escrita realmente acontece. Cada capítulo tem o seu próprio ficheiro .tex.

- Elementos/: Contém os ficheiros para os elementos pré-textuais (agradecimentos, dedicatória, resumos, etc.).

- bibliografia.bib: A sua base de dados de referências. Recomenda-se o uso do Zotero para a gerir e exportar automaticamente.

- Figuras/: Coloque todos os seus ficheiros de imagem (.jpg, .png, .pdf) nesta pasta para manter o projeto organizado.

**Atenção**: NÃO EDITE o ficheiro comandos.cls. Ele é o motor que faz toda a formatação funcionar automaticamente.

2. Configuração Inicial (Apenas uma vez)
****************************************
Abra o ficheiro configuracoes.tex e preencha as seguintes informações nos campos apropriados:

Autor e Orientador:

\autor{Nome Completo do Autor}

\autorprenome{Nome}

\autorsobrenome{Completo do Autor}

(Faça o mesmo para \orientador, \orientadorprenome e \orientadorsobrenome)

Informações do Trabalho:

\titulo{O título do seu trabalho}

\subtitulo{O subtítulo, se houver}

\palavraschave{Primeira}{Segunda}{Terceira}

\datadadefesa{dd}{mm}{aaaa}

Escolha \mestrado ou \doutorado (descomente a linha correta e comente a outra).

3. Escrita e Estrutura do Texto
*******************************
Nos ficheiros dentro da pasta Capitulos/, utilize os comandos padrão do LaTeX para estruturar o seu texto. A numeração e a inclusão no Sumário são automáticas.

\chapter{Nome do Capítulo}

\section{Nome da Secção}

\subsection{Nome da Subsecção}

4. Citações e Referências (ABNT)
********************************
O template formata as citações no texto e a lista de referências final de forma automática, seguindo as normas da ABNT.

Para uma citação entre parênteses (Autor, ANO), use:

\cite{chave_zotero}

Para uma citação integrada ao texto, como "Segundo Autor (ANO)...", use:

Segundo \textcite{chave_zotero}...

5. Figuras e Tabelas
********************
As listas de figuras e tabelas são geradas automaticamente a partir das legendas.

Para inserir uma Figura:

\begin{figure}[!htb]
    \centering
    \includegraphics[width=0.8\textwidth]{Figuras/nome_da_imagem.jpg}
    \caption{Legenda descritiva da sua figura.}
    \label{fig:rotulo_unico_da_figura}
\end{figure}

Para referenciar no texto, use \Figura{rotulo_unico_da_figura}.

Para inserir uma Tabela (com quebra de linha automática):

\begin{table}[!htb]
    \centering
    \caption{Legenda descritiva da sua tabela.}
    \label{tab:rotulo_unico_da_tabela}
    \begin{tabularx}{\textwidth}{l X}
        \toprule
        Cabeçalho 1 & Cabeçalho da coluna com texto longo \\
        \midrule
        Item A & Este texto pode ser muito longo e será automaticamente quebrado em várias linhas. \\
        \bottomrule
    \end{tabularx}
\end{table}

Para referenciar no texto, use \Tabela{rotulo_unico_da_tabela}.

Tabelas são um dos elementos mais difíceis de formatar bem. O pacote booktabs, que já está no seu template, incentiva a criação de tabelas limpas e profissionais, sem poluição visual. Para tabelas de alta qualidade, o template utiliza o pacote booktabs. A sua filosofia é a simplicidade e a clareza. Siga estas três regras:

Nunca use linhas verticais: A separação entre colunas deve ser dada pelo espaçamento, não por linhas.

Use apenas linhas horizontais essenciais:

\toprule: para a linha de topo (mais espessa).

\midrule: para a linha que separa o cabeçalho do corpo da tabela.

\bottomrule: para a linha de fundo (mais espessa).

\addlinespace: para adicionar um pequeno respiro entre linhas de dados, se necessário.

Use tabularx para texto longo: Como já documentado, para tabelas com texto que precisa de quebrar em várias linhas, use sempre o ambiente tabularx.

6. Listas Automáticas
*********************
Lista de Siglas: Na primeira vez que usar uma sigla, utilize o comando \Sigla.

Exemplo: ... a Associação Brasileira de Normas Técnicas (\Sigla{Associação Brasileira de Normas Técnicas}{ABNT}) ...

O template irá escrever o nome por extenso seguido da sigla e adicionará o item à Lista de Abreviaturas e Siglas automaticamente.

Glossário: É um processo de duas etapas:

Defina os seus termos no ficheiro Elementos/glossario.tex.

No texto, chame o termo usando \gls{rotulo_do_termo}.

7. Outras Ferramentas
*********************
No seu texto, em vez de escrever os valores diretamente, use o comando \SI{<número>}{<unidade>}.

Exemplos:

Para "20 %", escreva: \SI{20}{\percent}

Para "50 kg", escreva: \SI{50}{\kilo\gram}

Para "25 °C", escreva: \SI{25}{\degreeCelsius}

Para "3 cm x 4 cm", escreva: \SI{3x4}{\centi\meter}

O resultado é uma formatação tipograficamente perfeita e consistente em todo o documento.


Este template foi desenhado para cuidar de toda a complexidade da formatação, permitindo que você se concentre no mais importante: a sua pesquisa.