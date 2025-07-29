%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Classe de Comandos do Documento (Não edite sem conhecimento)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{comandos}[]
\typeout{PPG-DTECS_Overleaf. Modelo desenvolvido por Matheus Mendonça dos Reis, Ms.}

\makeatletter
\def\@thesislanguage{0}
\newcommand{\thesislanguage}[1]{\def\@thesislanguage{#1}}
\newlength{\oldparindent}
\DeclareOption{Ingles}{
  \thesislanguage{0}
  \typeout{configuracoes: english.}
}
\DeclareOption{Espanhol}{
  \thesislanguage{1}
  \typeout{configuracoes: espanhol.}
}
\DeclareOption{Portugues}{
  \thesislanguage{2}
  \typeout{configuracoes: portugues.}
}
\DeclareOption{Draft}{
  \finalversionfalse
  \typeout{configuracoes: Draft.}
}
\newif\ifprintversion \printversionfalse % Cria o interruptor, desligado por padrão
\DeclareOption{TwoSide}{ % Cria a nova opção
  \printversiontrue
  \typeout{configuracoes: Ativando modo de impressao (twoside).}
}
\newif\iffinalversion
\DeclareOption{Final}{
  \finalversiontrue
  \typeout{configuracoes: versao final.}
}

\newif\ifnofig
\DeclareOption{noFig}{
  \nofigtrue
  \typeout{configuracoes: Draft without figures.}
}

\newif\ifturnitin
\DeclareOption{Turnitin}{
  \turnitintrue
  \typeout{configuracoes: versao para o turnitin.}
}

\ProcessOptions\relax

% Classe base: Relatório (report)
% Se for a versão final, inclui as figuras
\iffinalversion
  \ifprintversion % Verifica se a opção TwoSide foi ativada
    \LoadClass[12pt,a4paper,twoside]{report} % Carrega em modo frente e verso
  \else
    \LoadClass[12pt,a4paper,oneside]{report} % Carrega em modo de um lado
  \fi
  \RequirePackage{silence}
  \WarningsOff[biblatex]
\else % Caso contrário, segue no formato Draft.
  \LoadClass[12pt,a4paper,draft]{report}
  \ifnofig
    \usepackage[allfiguresdraft]{draftfigure}
  \fi
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ------------------------Preambulo------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cria Glossários:
\usepackage[acronym, toc, nonumberlist]{glossaries}
\usepackage[most]{tcolorbox}
\makeglossaries

% Pacotes padrão para as línguas usadas no texto:
\RequirePackage[english,spanish,portuguese,brazil]{babel}

% Pacote para os cabeçalhos:
\RequirePackage{fancyhdr}

% Pacotes necessários para os módulos de personalização
\usepackage{indentfirst}
\setlength{\parindent}{1.25cm}
\usepackage{emptypage}
\usepackage{xstring} % Needed for \StrLastBefore, \StrLastAfter, \StrBehind
\usepackage{pdflscape} % For the landscape environment% Custom environment for exampleinfo
\usepackage{url} % 
\usepackage{lipsum} % 
\usepackage{abstract} % Provides the \keywords command
\usepackage{lastpage} % 
\usepackage{titlesec} %
\usepackage[most]{tcolorbox} % 
\usepackage{ccicons} % For Creative Commons icons
\RequirePackage{cclicenses} % Para creative commons
\RequirePackage{mfirstuc} % Para capitalizar palavras automaticamente
\RequirePackage{fontawesome} % Para ícones como \faInfoCircle
\RequirePackage[most]{tcolorbox} % Para caixas de texto coloridas
\RequirePackage{tabularx} % Para quebra de linhas em tabelas
\RequirePackage{siunitx}
\RequirePackage[acronym, toc, nonumberlist]{glossaries}
\newtcolorbox{exampleinfobox}{colback=blue!5!white,colframe=blue!75!black,boxrule=0.5pt,arc=2pt,left=6pt,right=6pt,top=6pt,bottom=6pt}
% !TEX TS-program = lualatex
\RequirePackage{url} % For \url command
\RequirePackage{tabularx} % For tabularx environment

%\usepackage{microtype}

% Cor para as notas de orientação
\RequirePackage{xcolor}
\definecolor{note}{HTML}{31708f}

% -------------- PACOTES DE FONTE -----------------
\RequirePackage{fontspec} % Pacote principal para controle de fontes em LuaLaTeX/XeLaTeX

% 1. DEFINE A FONTE PRINCIPAL DO DOCUMENTO (CORPO DO TEXTO)
%    Carrega a família "Linux Libertine O" e suas variações (Bold, Italic).
%    Isso garante que \textbf{} e \textit{} funcionem corretamente no texto.
\setmainfont{Linux Libertine O}[
    BoldFont = * Bold,
    ItalicFont = * Italic,
    BoldItalicFont = * Bold Italic
]

% 2. CRIA UM COMANDO ESPECIAL APENAS PARA A FONTE DA CAPA
%    Isso isola a fonte "Source Sans Pro" e garante que ela não afete o resto do documento.
\newfontfamily\fontSourceSans{Source Sans Pro}

%Pacotes para facilitar a inclusão das figuras
\RequirePackage{graphicx}
\graphicspath{{./logotipos/}{./figuras/}}
\PassOptionsToPackage{table}{xcolor}

%Pacotes para incluir os hiperlinks no texto
\RequirePackage[
        pdfdisplaydoctitle = true, 
        pdfstartview={XYZ null null .75} %Abrir em 75% de zoom
    ]{hyperref}
    
%Mantenha o pacote a seguir para incluir a lista de abreviaturas---
\RequirePackage{nomencl} \makenomenclature
\RequirePackage{pdfpages}
\RequirePackage{xspace}
\RequirePackage{setspace}
\RequirePackage{geometry}
\geometry{a4paper,top=30mm,bottom=20mm,left=30mm,right=20mm}
\RequirePackage{csquotes}

% Pacotes para adicionar a bibliografia ---------------------------
% Coloque a opção uniquename=false, se não quiser que o Biblatex faça a desambiguação de nomes.
\RequirePackage[style=abnt,uniquename=init,giveninits,uniquelist=true,maxbibnames=4,repeatfields=true]{biblatex}
% Comandos para ajustar as citacoes para nova normativa ABNT NBR 10520:2023 ----
\makeatletter
\renewcommand*{\UpperOrSC}[1]{#1}
\renewcommand*{\UpperOrSCCite}[1]{#1}

% Pacote para tabelas mais interessantes --------------------------
\RequirePackage{booktabs}
\renewcommand{\arraystretch}{1.2}

\RequirePackage{ifthen}
\makeatletter
\ifcase\@thesislanguage\relax
  %English
  \RequirePackage[english,nameinlink]{cleveref}
  \or%Español
  \RequirePackage[spanish,nameinlink]{cleveref}
  \or%Português 
  \RequirePackage[brazilian,nameinlink,noabbrev]{cleveref}
\fi
  \Crefformat{equation}{#2\Cref@equation@name~#1#3}
  \creflabelformat{equation}{#2\textup{#1}#3}

% Adicionado para símbolos matemáticos, como checkboxes
\RequirePackage{amssymb}

% Definição de novos comandos
\definecolor{dtecs_titulo_azul}{HTML}{1B3D6F}
\definecolor{dtecs_subtitulo_cinza}{HTML}{595959}
\newcommand{\@CIDADE}{Itajubá}
\renewcommand{\@CIDADE}{Itajubá}
\newcommand{\@UNIDADEENSINO}{Programa de Pós-Graduação em Desenvolvimento, Tecnologias e Sociedade}
\newcommand{\@UNIDADEENSINOABREV}{PPG-DTECS}
\newcommand{\@UNIFEI}{Universidade Federal de Itajubá}

% Criação de variáveis para o texto. -----------------------------
\let\@autor\relax
\def\autor#1{\gdef\@autor{#1}}
\author{\@autor}
%
\let\@autora\relax
\def\autora#1{\gdef\@autora{#1}}
%
\let\@titulo\relax
\def\titulo#1{\gdef\@titulo{#1}}
\title{\@titulo}
%
\let\@subtitulo\relax
\def\subtitulo#1{\gdef\@subtitulo{#1}}
%
\def\grau#1{\gdef\@grau{#1}}
%
\newif\ifmaster
%
%%%%
\gdef\bsi{
%added
  \gdef\@textoaviso{\relax\cathpage}
  \if\@autora\relax
  \gdef\@degnamept{Bacharel em XXX} %REESCREVA AQUI
  \gdef\@degnamees{Licenciatura XXX} %REESCREVA AQUI
  \gdef\@artigo{o}
  \else
  \gdef\@degnamept{Bacharela em XXX} %REESCREVA AQUI
  \gdef\@degnamees{Bacharela}
  \gdef\@artigo{a}
  \fi
  \gdef\@degnameen{Bachelor in XXX} %REESCREVA AQUI
  \gdef\@monopt{Monografia}
  \gdef\@monoes{Monografía}
  \gdef\@monoen{Monograph}
  
  \gdef\@nivelEnsino{Graduação}
}

\gdef\tads{
%added
  \gdef\@textoaviso{\relax}
  \if\@autora\relax
  \gdef\@degnamept{Tecnólogo em XXX} %REESCREVA AQUI
  \gdef\@degnamees{Tecnólogo}
  \gdef\@artigo{o}
  \else
  \gdef\@degnamept{Tecnóloga em XXX} %REESCREVA AQUI
  \gdef\@degnamees{Tecnóloga}
  \gdef\@artigo{a}
  \fi
  \gdef\@degnameen{Technologist in XXX} %REESCREVA AQUI
  \gdef\@monopt{Monografia}
  \gdef\@monoes{Monografía}
  \gdef\@monoen{Monograph}
  
  \gdef\@nivelEnsino{Graduação}
}
%%%%
\gdef\qualificacaoMestrado{
%added 
  \gdef\@textoaviso{\clearpage}
  \if\@autora\relax
  \gdef\@degnamept{Mestre em Desenvolvimento, Tecnologias e Sociedade}
  \gdef\@degnamees{Maestro en Desarrollo, Tecnologías y Sociedad}
  \gdef\@artigo{o}
  \else
  \gdef\@degnamept{Mestra em Desenvolvimento, Tecnologias e Sociedade}
  \gdef\@degnamees{Maestra en Desarrollo, Tecnologías y Sociedad}
  \gdef\@artigo{a}
  \fi
  \gdef\@degnameen{Master of Development, Technologies and Society}
  \gdef\@monopt{Monografia de qualificação}
  \gdef\@monoes{Monografía de calificación}
  \gdef\@monoen{Qualification monograph}
  \gdef\@nivelEnsino{Pós-graduação}
}
%%%%
\gdef\qualificacaoDoutorado{
%added 
  \gdef\@textoaviso{\clearpage}
  \if\@autora\relax
  \gdef\@degnamept{Doutor em Desenvolvimento, Tecnologias e Sociedade}
  \gdef\@degnamees{Doctor en Desarrollo, Tecnologías y Sociedad}
  \gdef\@artigo{o}
  \else
  \gdef\@degnamept{Doutora em Desenvolvimento, Tecnologias e Sociedade}
  \gdef\@degnamees{Doctora en Desarrollo, Tecnologías y Sociedad}
  \gdef\@artigo{a}
  \fi
  \gdef\@degnameen{Doctor in Development, Technologies and Society}
  \gdef\@monopt{Monografia de qualificação}
  \gdef\@monoes{Monografía de calificación}
  \gdef\@monoen{Qualification monograph}
  \gdef\@nivelEnsino{Pós-graduação}
}
\gdef\mestrado{
%added 
  \gdef\@textoaviso{\clearpage \cathpage}
  \if\@autora\relax
  \gdef\@degnamept{Mestre em Desenvolvimento, Tecnologias e Sociedade}
  \gdef\@degnamees{Maestro en Desarrollo, Tecnologías y Sociedad}
  \gdef\@artigo{o}
  \else
  \gdef\@degnamept{Mestra em Desenvolvimento, Tecnologias e Sociedade}
  \gdef\@degnamees{Maestra en Desarrollo, Tecnologías y Sociedad}
  \gdef\@artigo{a}
  \fi
  \gdef\@degnameen{Master in Development, Technologies and Society}
  \gdef\@monopt{Dissertação}
  \gdef\@monoes{Dissertacíon}
  \gdef\@monoen{Thesis}
  \gdef\@nivelEnsino{Pós-graduação}
}
%%%%
\gdef\doutorado{
%added 
  \gdef\@textoaviso{\clearpage \cathpage}
  \if\@autora\relax
  \gdef\@degnamept{Doutor em Desenvolvimento, Tecnologias e Sociedade}
  \gdef\@degnamees{Doctor en Desarrollo, Tecnologías y Sociedad}
  \gdef\@artigo{o}
  \else
  \gdef\@degnamept{Doutora em Desenvolvimento, Tecnologias e Sociedade}
  \gdef\@degnamees{Doctora en Desarrollo, Tecnologías y Sociedad}
  \gdef\@artigo{a}
  \fi
  \gdef\@degnameen{Doctor in Development, Technologies and Society}
  \gdef\@monopt{Tese}
  \gdef\@monoes{Tesis}
  \gdef\@monoen{Thesis}
  \gdef\@nivelEnsino{Pós-graduação}
}
%added 
\let\@orientador\relax
\def\orientador#1{\gdef\@orientador{#1}}

\let\@orientadora\relax
\def\orientadora#1{\gdef\@orientadora{#1}}

\gdef\@advisors{1}
\let\@coorientador\relax
\def\coorientador#1{\gdef\@coorientador{#1}\gdef\@advisors{2}}

\let\@coorientadora\relax
\def\coorientadora#1{\gdef\@coorientadora{#1}\gdef\@advisors{2}}

\def\datadadefesa#1#2#3{
  \gdef\@dia{#1}
  \gdef\@mes{#2}
  \gdef\@ano{#3}
}

\let\@fichaCatalografica\relax
\def\fichaCatalografica#1{\gdef\@fichacatalografica{#1}}

\let\@avalA\relax
\let\@avalB\relax
\let\@avalC\relax
\let\@avalD\relax
\let\@avalE\relax
\let\@avalF\relax
\let\@avalG\relax
\let\@avalH\relax
\let\@instavalA\relax
\let\@instavalB\relax
\let\@instavalC\relax
\let\@instavalD\relax
\let\@instavalE\relax
\let\@instavalF\relax
\let\@instavalG\relax
\let\@instavalH\relax

\def\avaliadorA#1#2{\gdef\@avalA{#1}\gdef\@instavalA{#2}}
\def\avaliadorB#1#2{\gdef\@avalB{#1}\gdef\@instavalB{#2}}
\def\avaliadorC#1#2{\gdef\@avalC{#1}\gdef\@instavalC{#2}}
\def\avaliadorD#1#2{\gdef\@avalD{#1}\gdef\@instavalD{#2}}
\def\avaliadorE#1#2{\gdef\@avalE{#1}\gdef\@instavalE{#2}}
\def\avaliadorF#1#2{\gdef\@avalF{#1}\gdef\@instavalF{#2}}
\def\avaliadorG#1#2{\gdef\@avalG{#1}\gdef\@instavalG{#2}}
\def\avaliadorH#1#2{\gdef\@avalH{#1}\gdef\@instavalH{#2}}

\let\@cotutela\relax
\def\cotutela#1{\gdef\@cotutela{#1}}

\let\@areaConcentracao\relax
\def\areaConcentracao#1{\gdef\@areaConcentracao{#1}}

% resumos
\def\prefacesection#1{
  \chapter*{#1}
  \pagestyle{empty}
  \thispagestyle{empty}
}

% idiomas
\gdef\resetlang{
  \ifcase\@thesislanguage\relax
  \selectlanguage{english}
  \or\selectlanguage{spanish}
  \or\selectlanguage{brazil}
  \fi
}

% hifenizacao
\gdef\suppresshyphens{
  \tolerance=1
  \emergencystretch=\maxdimen
  \hyphenpenalty=10000
  \hbadness=10000
}

% --- COMANDOS MANUAIS PARA NOMES ---
\let\@autorprenome\relax
\def\autorprenome#1{\gdef\@autorprenome{#1}}
\let\@autorsobrenome\relax
\def\autorsobrenome#1{\gdef\@autorsobrenome{#1}}

\let\@orientadorprenome\relax
\def\orientadorprenome#1{\gdef\@orientadorprenome{#1}}
\let\@orientadorsobrenome\relax
\def\orientadorsobrenome#1{\gdef\@orientadorsobrenome{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Comando que gera TODOS os elementos pré-textuais na ordem correta ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\paginasiniciais}{
  \ifturnitin
    \relax
  \else
    \pagestyle{empty} % Garante que TODAS as páginas pré-textuais não tenham numeração
    \thispagestyle{empty}
    
    % --- Elementos iniciais ---
    \input{Elementos/capa}
    \cleardoublepage
    \input{Elementos/folhaRosto}
    \cleardoublepage 
    \input{Elementos/fichaCatalografica}
    \cleardoublepage
    \input{Elementos/folhaAprovacao}
    \cleardoublepage 
    \input{Elementos/declaracaoIA}
    \input{Elementos/dedicatoria}
    \input{Elementos/agradecimentos}
    \input{Elementos/Epigrafe}
    \input{Elementos/resumos}
    \cleardoublepage
    \thispagestyle{empty}
    
    % --- Redefinição de Títulos dependentes do idioma ---
    \ifcase\@thesislanguage\relax % English
      \renewcommand{\nomname}{List of Acronyms}
    \or % Español
      \renewcommand{\nomname}{Lista de abreviaturas y acrónimos}
    \or % Português 
      \renewcommand{\nomname}{Lista de Abreviaturas e Siglas}
    \fi % --- FIM DO BLOCO CONDICIONAL ---
    
    % --- Listas e Sumário (agora sob o efeito do \pagestyle{empty}) ---
    \input{Elementos/listaFiguras}\thispagestyle{empty} %  thispage aplicado
    \input{Elementos/listaTabelas}\thispagestyle{empty} %  evita numero na
    \input{Elementos/listaSimbolos}\thispagestyle{empty} % pagina selecionada
    \printnomenclature[3cm]\thispagestyle{empty}
    \imprimirglossario\thispagestyle{empty}
    \cleardoublepage 
    \tableofcontents
    \pagestyle{empty}
    \thispagestyle{empty}
  \fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- PACOTES ADICIONAIS PARA A CAPA PERSONALIZADA ----------------------
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{eso-pic}
\RequirePackage{setspace}
\RequirePackage{geometry}
\RequirePackage{csquotes}

% Pacotes extras necessários para a nova capa
\RequirePackage{tikz}
\RequirePackage{eso-pic}
\usetikzlibrary{calc}

% --- COMANDO DA CAPA ------
\def\openningpage{
  \input{Elementos/capa}
}

% Define a Folha de Rosto:
\def\titlepage{
  \input{Elementos/folhaRosto}
}

% Define a Ficha catalográfica:
\def\cathpage{
  \input{Elementos/fichaCatalografica}
}

% Define a Folha de Aprovação:
\def\approvalpage{
  \input{Elementos/folhaAprovacao}
}

% Definição dos Elementos Pré-textuais -----------------------------------------------------
\newenvironment{resumo}{\prefacesection{Resumo}\selectlanguage{brazil}}{\resetlang \newpage}
\renewenvironment{abstract}{\prefacesection{Abstract}\selectlanguage{english}}{\resetlang \newpage}
\newenvironment{resumen}{\prefacesection{Resumen}\selectlanguage{spanish}}{\resetlang \newpage}

\newenvironment{epigrafeformat}{\newpage\mbox{}\vfill\hfill\begin{minipage}[t]{0.5\textwidth}} % Fim do bloco BEGIN.
                          {\end{minipage}\newpage}


\newcommand{\fimdaspaginasiniciais}{
\newpage
\makeatletter
% Adição importante para o cleveref
\let\ps@plain\ps@mystyle
\makeatother

%Definição das primeiras páginas dos capítulos -----------------------------------------------
\fancypagestyle{plain}{
  \fancyhf{}% Limpa todos os campos
  \fancyhead[R]{\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\headheight}{14.49999pt}%
}

%Definição das demais páginas do texto --------------------------------------------------------
\fancypagestyle{headings}{%
  \fancyhf{}% Limpa todos os campos
  
  \ifprintversion % SE o modo TwoSide estiver ATIVO
    % Cabeçalho para impressão frente e verso (estilo livro)
    \fancyhead[LE]{\thepage \hspace{1em} \textsc{\nouppercase{\leftmark}}} % Pág. Par (Esquerda): Número | Título do Capítulo
    \fancyhead[RO]{\textsc{\nouppercase{\rightmark}} \hspace{1em} \thepage} % Pág. Ímpar (Direita): Título da Seção | Número
  \else % SE for o modo padrão (oneside)
    % Cabeçalho padrão para leitura em tela
    \fancyhead[L]{\textsc{\nouppercase{\leftmark}}}
    \fancyhead[R]{\thepage}
  \fi
  
  \renewcommand{\headrulewidth}{1pt}%
  \renewcommand{\headheight}{14.49999pt}%
}

\pagestyle{headings}

\setstretch{1.5} %Definido espaçamento entre linhas de 1,5
}

% Definição do comando para dedicatoria --------------------------------------------------------
\newcommand{\dedicatoria}[1]{
    %% O comando \ifturnitin a seguir é obrigatório para o controle 
    %% da opção "turnitin". Não o remova!
    \ifturnitin 
      \relax
    \else
      %\pagestyle{empty}
      %\thispagestyle{empty}
      \vspace*{\fill}
      \begin{flushright}
         \begin{minipage}{15em}
            #1
         \end{minipage}
       \end{flushright}
    \fi
} % Fim definição comando \dedicatoria

% Definição do comando para epigrafe --------------------------------------------------------
\newcommand{\epigrafe}[2]{
  \ifturnitin 
      \relax
  \else
     \begin{epigrafeformat}
       #2
       % A linha em branco a seguir é importante

       \hfill (#1)
     \end{epigrafeformat}
   \fi
}

%controle de linhas órfãs e viúvas.
\widowpenalty10000
\clubpenalty10000

%Comandos específicos para referenciar Figuras, Tabelas, Seções etc.
\newcommand{\Capitulo}[1] {\Cref{#1}}
\newcommand{\capitulos}[1]{\cref{#1}}
\newcommand{\Secao}[1]    {\Cref{#1}}
\newcommand{\secoes}[1]   {\cref{#1}}
\newcommand{\Figura}[1]   {\Cref{#1}}
\newcommand{\figuras}[1]  {\cref{#1}}
\newcommand{\Tabela}[1]   {\Cref{#1}}
\newcommand{\tabelas}[1]  {\cref{#1}}
\newcommand{\Equacao}[1]  {\Cref{#1}}
\newcommand{\equacoes}[1] {\cref{#1}}

%Comando para Glossario automático
\newcommand{\imprimirglossario}{\printglossaries}
%Como Usar:
%No seu texto: Para citar um termo, use \gls{cts} ou \gls{abnt}. O pacote se encarrega de usar o nome completo na primeira vez e a forma curta nas seguintes, se for uma sigla.

%Para exibir a lista: No seu documento (por exemplo, após a lista de abreviaturas), adicione o comando \imprimirglossario.

%Comandos para abreviações especiais
\newcommand{\ie}{i.\,e.\xspace}
\newcommand{\eg}{e.\,g.\xspace}
\newcommand{\pex}{p.\,ex.\xspace}

%Comandos para adição de siglas 
\newcommand{\Sigla}[2]{#1 (#2)\nomenclature{#2}{#1}}
\newcommand{\SiglaHifen}[2]{#1 -- #2\nomenclature{#2}{#1}}

% --- COMANDO PARA QUARTA CAPA PERSONALIZADA ---
\newcommand{\quartacapa}{
  \cleardoublepage
  \includepdf[pages=1]{Elementos/logotipos/dtecs-QuartaCapa.pdf}
}

% ===================================================================
% --- BLOCO DE PERSONALIZAÇÕES AVANÇADAS DO TEMPLATE ---
% ===================================================================
\makeatletter

% --- Módulo de Palavras-Chave (com lógica de idioma corrigida) ---
\newcommand{\palavraschave}[3]{
  \def\@palavrachaveum{#1}
  \def\@palavrachavedois{#2}
  \def\@palavrachavetres{#3}
}

\newcommand{\imprimirpalavraschave}{
  \par\addvspace{\baselineskip}
  \noindent
  \textbf{%
    \iflanguage{portuguese}{Palavras-chave:}{%
    \iflanguage{brazil}{Palavras-chave:}{%
    \iflanguage{english}{Keywords:}{%
    \iflanguage{spanish}{Palabras clave:}{Palavras-chave:}}}}%
  } % Fim do \textbf
  \@palavrachaveum. \@palavrachavedois. \@palavrachavetres.
}

% --- Módulo: Controle de início de capítulo para modo TwoSide ---
\let\originalchapter\chapter % Guarda o comando \chapter original
\newcommand{\patchedchapter}{\cleardoublepage\originalchapter} % Cria a nossa versão modificada

% Ativa a modificação no final dos elementos pré-textuais
\gappto\fimdaspaginasiniciais{%
  \ifprintversion
    \let\chapter\patchedchapter
  \fi
}

% Desativa a modificação antes dos apêndices
\gappto\@appendix{%
  \ifprintversion
    \let\chapter\originalchapter
  \fi
}

% --- Módulo: Garante que páginas em branco inseridas sejam limpas ---
\ifprintversion % Executa apenas se a opção TwoSide estiver ativa
  \let\oldcleardoublepage\cleardoublepage
  \renewcommand{\cleardoublepage}{\oldcleardoublepage\thispagestyle{empty}}
\fi

% Sistema de Temas de Cores ---
\definecolor{dtecs_azul}{HTML}{1B3D6F}
%\definecolor{dtecs_verde}{HTML}{4CAF50}
%\definecolor{dtecs_cinza}{HTML}{607D8B}
\colorlet{accentcolor}{dtecs_azul} % Cor padrão
%\DeclareOption{ThemeGreen}{\colorlet{accentcolor}{dtecs_verde}\typeout{configuracoes: Ativando tema Verde.}}
%\DeclareOption{ThemeGray}{\colorlet{accentcolor}{dtecs_cinza}\typeout{configuracoes: Ativando tema Cinza.}}

% O comando \listadeentrevistas foi removido pois este novo estilo não é numerado.

% Comando para criar a "Lista de Entrevistas", que volta a funcionar
\newcommand{\listadeentrevistas}{
  \tcblistof[\chapter*]{entrevistas}{Lista de Entrevistas}
}

% 2. Cria o AMBIENTE "entrevista" que usa o estilo acima
\newenvironment{entrevista}[1]
  {\begin{tcolorbox}[estiloentrevista]
   \noindent\fontSourceSans\color{accentcolor!85!black}\small\bfseries[Fonte: #1]\par\smallskip\noindent}
  {\end{tcolorbox}}

% Comando para notas de orientação (BOLINHA "i")
\newcommand{\guideinfo}[1]{%
  \noindent\textcolor{note}{\faInfoCircle\ \bfseries
    \iflanguage{portuguese}{Dica de Escrita}{%
    \iflanguage{brazil}{Dica de Escrita}{%
    \iflanguage{english}{Writing Guidance}{%
    \iflanguage{spanish}{Guía de Escritura}{Orientação}% Fallback
    }}}%
  }\\[.55em]%
  \noindent#1%
}

% Comando para exemplos de utilização (BOLINHA "i")
\newcommand{\exampleinfo}[1]{%
  \noindent\textcolor{black}{\faInfoCircle\ \bfseries
    \iflanguage{portuguese}{Exemplo de Utilização}{%
    \iflanguage{brazil}{Exemplo de Utilização}{%
    \iflanguage{english}{Example of Use}{%
    \iflanguage{spanish}{Ejemplo de Uso}{Exemplo}% Fallback
    }}}%
  }\\[.55em]%
  \noindent#1%
}

\makeatother
% ===================================================================
% --- FIM DO BLOCO DE PERSONALIZAÇÕES ---
% ===================================================================