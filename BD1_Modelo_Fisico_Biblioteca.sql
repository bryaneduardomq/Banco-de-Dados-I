-- dbDesigner modelo fisico --

CREATE TABLE Autor (
  idAutor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(idAutor)
);

CREATE TABLE Autor_escreve_Livro (
  Autor_idAutor INTEGER UNSIGNED NOT NULL,
  Livro_idLivro INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Autor_idAutor, Livro_idLivro),
  INDEX Autor_has_Livro_FKIndex1(Autor_idAutor),
  INDEX Autor_has_Livro_FKIndex2(Livro_idLivro)
);

CREATE TABLE Biblioteca (
  idBiblioteca INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(idBiblioteca)
);

CREATE TABLE Bibliotecaria (
  idBibliotecaria INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NULL,
  PRIMARY KEY(idBibliotecaria)
);

CREATE TABLE Bibliotecaria_trabalha_Biblioteca (
  Bibliotecaria_idBibliotecaria INTEGER UNSIGNED NOT NULL,
  Biblioteca_idBiblioteca INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Bibliotecaria_idBibliotecaria, Biblioteca_idBiblioteca),
  INDEX Bibliotecaria_has_Biblioteca_FKIndex1(Bibliotecaria_idBibliotecaria),
  INDEX Bibliotecaria_has_Biblioteca_FKIndex2(Biblioteca_idBiblioteca)
);

CREATE TABLE Biblioteca_mantem_Livro (
  Biblioteca_idBiblioteca INTEGER UNSIGNED NOT NULL,
  Livro_idLivro INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Biblioteca_idBiblioteca, Livro_idLivro),
  INDEX Biblioteca_has_Livro_FKIndex1(Biblioteca_idBiblioteca),
  INDEX Biblioteca_has_Livro_FKIndex2(Livro_idLivro)
);

CREATE TABLE Categoria (
  idCategoria INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(50) NULL,
  PRIMARY KEY(idCategoria)
);

CREATE TABLE Categoria_esta_Estante (
  Categoria_idCategoria INTEGER UNSIGNED NOT NULL,
  Estante_idEstante INTEGER UNSIGNED NOT NULL,
  Bibliotecaria_idBibliotecaria INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Categoria_idCategoria, Estante_idEstante, Bibliotecaria_idBibliotecaria),
  INDEX Categoria_has_Estante_FKIndex1(Categoria_idCategoria),
  INDEX Categoria_has_Estante_FKIndex2(Estante_idEstante),
  INDEX Categoria_esta_Estante_FKIndex3(Bibliotecaria_idBibliotecaria)
);

CREATE TABLE Cliente (
  idCliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NULL,
  PRIMARY KEY(idCliente)
);

CREATE TABLE Editora (
  idEditora INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(idEditora)
);

CREATE TABLE Efetiva (
  Bibliotecaria_idBibliotecaria INTEGER UNSIGNED NOT NULL,
  INDEX Efetiva_FKIndex1(Bibliotecaria_idBibliotecaria)
);

CREATE TABLE Emprestimo (
  Livro_idLivro INTEGER UNSIGNED NOT NULL,
  Estante_idEstante INTEGER UNSIGNED NOT NULL,
  Cliente_idCliente INTEGER UNSIGNED NOT NULL,
  Bibliotecaria_idBibliotecaria INTEGER UNSIGNED NOT NULL,
  dataDevolucao DATE NULL,
  valorMulta VARCHAR(10) NULL,
  PRIMARY KEY(Livro_idLivro, Estante_idEstante, Cliente_idCliente, Bibliotecaria_idBibliotecaria),
  INDEX Emprestimo_FKIndex1(Livro_idLivro),
  INDEX Emprestimo_FKIndex2(Estante_idEstante),
  INDEX Emprestimo_FKIndex3(Cliente_idCliente),
  INDEX Emprestimo_FKIndex4(Bibliotecaria_idBibliotecaria)
);

CREATE TABLE Estagiaria (
  idEstagiaria INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Bibliotecaria_idBibliotecaria INTEGER UNSIGNED NOT NULL,
  Instituicao_idInstituicao INTEGER UNSIGNED NOT NULL,
  nome VARCHAR(50) NULL,
  idade VARCHAR(2) NULL,
  PRIMARY KEY(idEstagiaria),
  INDEX Estagiaria_FKIndex1(Instituicao_idInstituicao),
  INDEX Estagiaria_FKIndex2(Bibliotecaria_idBibliotecaria)
);

CREATE TABLE Estante (
  idEstante INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(idEstante)
);

CREATE TABLE Instituicao (
  idInstituicao INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  CEP VARCHAR(10) NULL,
  rua VARCHAR(100) NULL,
  numero VARCHAR(10) NULL,
  PRIMARY KEY(idInstituicao)
);

CREATE TABLE Livro (
  idLivro INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Editora_idEditora INTEGER UNSIGNED NOT NULL,
  nome VARCHAR(50) NULL,
  quantidadePaginas VARCHAR(4) NULL,
  PRIMARY KEY(idLivro),
  INDEX Livro_FKIndex1(Editora_idEditora)
);

CREATE TABLE Livro_tem_Categoria (
  Livro_idLivro INTEGER UNSIGNED NOT NULL,
  Categoria_idCategoria INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Livro_idLivro, Categoria_idCategoria),
  INDEX Livro_has_Categoria_FKIndex1(Livro_idLivro),
  INDEX Livro_has_Categoria_FKIndex2(Categoria_idCategoria)
);


brModelo Modelo físico

-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Instituição (
idInstituicao integer PRIMARY KEY,
Rua Texto(1),
Numero Texto(1),
CEP Texto(1)
)

CREATE TABLE Estagiária (
Nome Texto(1),
idade Texto(1),
idEstagiaria integer PRIMARY KEY,
idBibliotecaria integer,
idInstituicao integer,
FOREIGN KEY(idInstituicao) REFERENCES Instituição (idInstituicao)
)

CREATE TABLE Estantes+Bibliotecária (
idEstante integer,
nome Texto(1),
idBibliotecaria integer,
PRIMARY KEY(idEstante,idBibliotecaria)
)

CREATE TABLE Cliente (
nome Texto(1),
idCliente integer PRIMARY KEY
)

CREATE TABLE Categorias (
descricao Texto(1),
idCategoria integer PRIMARY KEY
)

CREATE TABLE Livros (
nome Texto(1),
qtPáginas Texto(1),
idLivro integer PRIMARY KEY,
idEditora integer
)

CREATE TABLE Autor (
idAutor integer PRIMARY KEY
)

CREATE TABLE Editora (
idEditora integer PRIMARY KEY
)

CREATE TABLE Biblioteca (
idBiblioteca integer PRIMARY KEY
)

CREATE TABLE Efetiva (
idBibliotecaria integer,
FOREIGN KEY(/*erro: ??*/) REFERENCES Estantes+Bibliotecária (idEstante,idBibliotecaria)
)

CREATE TABLE Tem (
idLivro integer,
idCategoria integer,
FOREIGN KEY(idLivro) REFERENCES Livros (idLivro),
FOREIGN KEY(idCategoria) REFERENCES Categorias (idCategoria)
)

CREATE TABLE Trabalham (
idBibliotecaria integer,
idBiblioteca integer,
FOREIGN KEY(/*erro: ??*/) REFERENCES Estantes+Bibliotecária (idEstante,idBibliotecaria),
FOREIGN KEY(idBiblioteca) REFERENCES Biblioteca (idBiblioteca)
)

CREATE TABLE Mantem (
idLivro integer,
idBiblioteca integer,
FOREIGN KEY(idLivro) REFERENCES Livros (idLivro),
FOREIGN KEY(idBiblioteca) REFERENCES Biblioteca (idBiblioteca)
)

CREATE TABLE Escrito (
idAutor integer,
idLivro integer,
FOREIGN KEY(idAutor) REFERENCES Autor (idAutor),
FOREIGN KEY(idLivro) REFERENCES Livros (idLivro)
)

CREATE TABLE Empréstimo (
dataDevolucao Texto(1),
valorMulta Texto(1),
idLivro integer,
idCliente integer,
idEstante integer,
idBibliotecaria integer,
PRIMARY KEY(idLivro,idCliente,idEstante,idBibliotecaria)
)

CREATE TABLE Estão (
idCategoria integer,
idEstante integer,
idBibliotecaria integer,
FOREIGN KEY(idCategoria) REFERENCES Categorias (idCategoria),
FOREIGN KEY(idBibliotecaria,,) REFERENCES Estantes+Bibliotecária (idEstante,idBibliotecaria)
)

ALTER TABLE Estagiária ADD FOREIGN KEY(/*erro: ??*/) REFERENCES Estantes+Bibliotecária (idEstante,idBibliotecaria)
ALTER TABLE Livros ADD FOREIGN KEY(idEditora) REFERENCES Editora (idEditora)
