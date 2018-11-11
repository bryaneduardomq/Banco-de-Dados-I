
CREATE TABLE Medicos (
crm integer PRIMARY KEY,
nome varchar(50),
salario decimal (10,2)
)

CREATE TABLE contato (
descricao varchar(50),
obs varchar(200),
crm integer,
FOREIGN KEY(crm) REFERENCES Medicos (crm)
)

CREATE TABLE Paciente (
CPF bigint PRIMARY KEY,
Nome varchar(50),
dataNasc date,
RG bigint,
HorarioMedico time,
crm integer,
FOREIGN KEY(crm) REFERENCES Medicos (crm)
)

CREATE TABLE contatos (
contatos varchar(50),
CPF bigint,
foreign key (CPF) references Paciente (CPF)
)


CREATE TABLE quarto (
andar integer,
numero integer PRIMARY KEY
)

CREATE TABLE especialidade (
idEspecialidade integer PRIMARY KEY,
descricao varchar(50)
)

CREATE TABLE tem (
exerce boolean,
idEspecialidade integer,
crm integer,
FOREIGN KEY(idEspecialidade) REFERENCES especialidade (idEspecialidade),
FOREIGN KEY(crm) REFERENCES Medicos (crm)
)

CREATE TABLE tratamento (
CPF bigint,
crm integer,
FOREIGN KEY(CPF) REFERENCES Paciente (CPF),
FOREIGN KEY(crm) REFERENCES Medicos (crm)
)

CREATE TABLE hospedado (
dataInternacao date PRIMARY KEY,
dataAlta date,
numero integer,
CPF bigint,
FOREIGN KEY(numero) REFERENCES quarto (numero),
FOREIGN KEY(CPF) REFERENCES Paciente (CPF)
)

