-- Database: "clínica"

-- DROP DATABASE "clínica";

-- Geração de Modelo físico
--Administradora 2



CREATE TABLE Administradora (
idAdm integer PRIMARY KEY,
rua varchar(50),
numero varchar(10),
complemento varchar(10),
razao_social varchar(50)
);

CREATE TABLE condominios (
idcondominio integer PRIMARY KEY,
rua varchar(50),
numero varchar(10),
complemento varchar(10),
idAdm integer,
FOREIGN KEY(idAdm) REFERENCES Administradora (idAdm)
);

CREATE TABLE Lotes (
idlote integer PRIMARY KEY,
descrição  Text,
idcondominio integer,
FOREIGN KEY(idcondominio) REFERENCES condominios (idcondominio)
);

CREATE TABLE pessoas (
nome varchar(50),
cpf bigint PRIMARY KEY,
telefone varchar(15)
);

CREATE TABLE possuem (
percent decimal(5,2),
cpf bigint,
idlote integer,
FOREIGN KEY(cpf) REFERENCES pessoas (cpf),
FOREIGN KEY(idlote) REFERENCES Lotes (idlote)
);

CREATE TABLE alugam (
dataInicio date,
dataFim date,
cpf bigint,
idlote integer,
PRIMARY KEY(dataInicio,dataFim),
FOREIGN KEY(cpf) REFERENCES pessoas (cpf),
FOREIGN KEY(idlote) REFERENCES Lotes (idlote)
);

