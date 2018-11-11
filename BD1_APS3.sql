CREATE TABLE Classe (
idClasse integer PRIMARY KEY,
descricao varchar(100),
idReserva integer
)

CREATE TABLE Aeronave (
idAeronave integer PRIMARY KEY,
modelo varchar(10)
)

CREATE TABLE Passageiro (
CPF varchar(12) PRIMARY KEY,
nome varchar(100)
)

CREATE TABLE Reserva (
assento varchar(10),
idReserva integer PRIMARY KEY,
validade date,
CPF varchar(12),
FOREIGN KEY(CPF) REFERENCES Passageiro (CPF)
)

CREATE TABLE Cidade (
idCidade integer PRIMARY KEY,
nome varchar(20)
)

CREATE TABLE Voo (
idVoo integer PRIMARY KEY,
hora time,
data date,
idAeroporto integer
)

CREATE TABLE Aeroporto (
idAeroporto integer PRIMARY KEY,
nome varchar(100),
cep varchar(10),
idCidade integer,
FOREIGN KEY(idCidade) REFERENCES Cidade (idCidade)
)

CREATE TABLE compreende (
idVoo integer,
idReserva integer,
FOREIGN KEY(idVoo) REFERENCES Voo (idVoo),
FOREIGN KEY(idReserva) REFERENCES Reserva (idReserva)
)

CREATE TABLE utiliza (
idVoo integer,
idAeronave integer,
FOREIGN KEY(idVoo) REFERENCES Voo (idVoo),
FOREIGN KEY(idAeronave) REFERENCES Aeronave (idAeronave)
)

ALTER TABLE Classe ADD FOREIGN KEY(idReserva) REFERENCES Reserva (idReserva)
ALTER TABLE Voo ADD FOREIGN KEY(idAeroporto) REFERENCES Aeroporto (idAeroporto)
ALTER TABLE Voo ADD FOREIGN KEY(idAeroporto) REFERENCES Aeroporto (idAeroporto)

