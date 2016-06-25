% Classe com modelo de documento para listas de exercícios e provas.
% Adapta a classe "exam" para mostrar o cabeçalho identificando:
% - instituição
% - departamento
% - disciplina - turma - documento
% - professor
%
% Criado por : Guilherme N. Ramos em 2011
%
% Exemplo de uso:
%\documentclass{UnBExam}%
%
%\disciplina{Estrutura de Dados}%
%\turma{B}%
%\documento{Prova 1}%
%\periodo{2011/2}%
%%\data{\today}%
%\professor{Guilherme N. Ramos}%
%
%\printanswers%
%
%\begin{document}%
%	\begin{questions}%
%		\question[1] Questão 1, valendo 1 ponto.
%			\begin{resposta}[Resposta]%
%				Resposta da questão 1.
%			\end{resposta}%
%		\question[3] Questão 2, valendo 3 pontos.
%			\begin{resposta}%
%				Resposta da questão 3.
%			\end{resposta}%
%		\question[6] Questão 3, valendo 6 pontos.
%			\begin{resposta}%
%				\begin{parts}%
%					\part[5] Primeira parte da resposta da questão 6.
%					\part[1] Segunda parte.
%				\end{parts}%
%			\end{resposta}%
%	\end{questions}%
%\end{document}%

\ProvidesClass{UnBExam}%

%---------- Definindo Opções ----------%
\LoadClass[a4paper,12pt]{exam}%

% ---------- Pacotes ---------- %
\RequirePackage[brazilian]{babel}% 	Português
\RequirePackage[utf8]{inputenc}%	Texto em UTF8
\usepackage{graphicx} %			Marca da UnB
\RequirePackage[top=15mm,
			bottom=15mm,
			left=15mm,
			right=15mm]{geometry}% Formatação do papel

% ---------- Comandos ---------- %
\newcommand{\universidade}[1]{\def\@universidade{#1}}%
\newcommand{\departamento}[1]{\def\@departamento{#1}}%
\newcommand{\disciplina}[1]{\def\@disciplina{#1}}%
\newcommand{\turma}[1]{\def\@turma{#1}}%
\newcommand{\professor}[2][Prof.]{\def\@professor{#1 #2}}%
\newcommand{\professora}[2][Prof.ª]{\def\@professora{#1 #2}}%

\newcommand{\documento}[1]{\def\@documento{#1}}%
\newcommand{\subdoc}[1]{\def\@subdoc{#1}}%
\newcommand{\periodo}[1]{\def\@periodo{#1}}%
\newcommand{\data}[1]{\def\@data{#1}}%

% Inicialização
\universidade{\textbf{Universidade de Brasília}}%
\departamento{Departamento de Ciência da Computação}%
\disciplina{CIC 117251 -- Arquitetura de Processadores Digitais}%
\professor{Diego de Freitas Aranha}%
\turma{A}%
\documento{Prova}%
\subdoc{Gabarito}%
\periodo{}%
\data{}%

\newcommand{\@identificacao}{%
	\@disciplina%
	\ifthenelse{\equal{\@turma}{}}{}{\ - Turma \@turma\\}%
	\ifthenelse{\equal{\@documento}{}}{}{\@documento}%
}%

% ---------- Estilo ---------- %
\newenvironment{resposta}[1][]%
{%
	\ifthenelse{\equal{#1}{}}{}{\renewcommand{\solutiontitle}{\noindent\textbf{#1:}\enspace}}%
	\setlength{\parskip}{0pt}%
	\ifprintanswers
		\vspace{-5mm}%
	\else
		\vspace{-10mm}%
	\fi
	\begin{EnvFullwidth}%
	\begin{solution}%
}%
{%
	\end{solution}%
	\end{EnvFullwidth}%
}%

\pagestyle{head} % every page to have a header but no footer

\let\@oldprintanswers=\printanswers
\renewcommand{\printanswers}{\@oldprintanswers\extraheadheight[25mm]{0mm}}%

% Ajustes a classe Exam
\pointformat{{\small [\textbf{\themarginpoints}]}}
\noprintanswers%
\pointsinmargin%
\renewcommand{\solutiontitle}{}%

% ---------- Definições ---------- %
\extraheadheight[4cm]{0mm}%

\firstpageheader{%
	\begin{minipage}[c]{.15\textwidth}%
		\includegraphics[height=.48\textwidth ]{UnBMarca}%
	\end{minipage}%
	\begin{tabular*}{.85\textwidth}{@{\extracolsep{\fill}} l r}%
		\Large\@universidade & \ifthenelse{\equal{\@data}{}}{}{\normalsize\@data}\\%
		\Large\@departamento & \ifthenelse{\equal{\@periodo}{}}{}{\small(\@periodo)}%
	\end{tabular*}%
	\begin{center}%
		\Large\textbf{\@identificacao}%
	\end{center}%
	\hfill\textit{\@professora}\\%
	\ifprintanswers%
		{\large\vspace{-1\baselineskip}%
		\hfill\textbf{\@subdoc}\hfill}%
	\else%
		\begin{tabular}{| p{.2\textwidth} | p{.75\textwidth} |}%
			\hline%
			\textbf{Matrícula} & \textbf{Nome}\\\hline%
			& \\ \hline%
		\end{tabular}%
	\fi%
}{}{}%