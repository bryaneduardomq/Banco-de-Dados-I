CREATE TABLE Pessoa (
Nome varchar(30),
CPF integer PRIMARY KEY,
idReceita integer
)

insert into pessoa values ('Bryan', '1122334455', '1500');

select * from pessoa

CREATE TABLE Conta (
apelidoConta varchar(20),
titularidade boolean,
númeroConta integer PRIMARY KEY,
idBanco integer
)

insert into conta values ('contavazia', '0' ,'137652', 386 );

update conta set titularidade = '1' where titularidade = '0';

select * from conta

CREATE TABLE TipoConta (
idTipoConta integer PRIMARY KEY
)

insert into TipoConta values ('1');

--tipo conta 1: conta corrente--

CREATE TABLE possui (
númeroConta integer,
idTipoConta integer,
FOREIGN KEY(númeroConta) REFERENCES Conta (númeroConta),
FOREIGN KEY(idTipoConta) REFERENCES TipoConta (idTipoConta)
)

insert into possui values ('137652', '1');

select * from possui


CREATE TABLE Saldo (
dataInicial integer PRIMARY KEY
)

insert into Saldo values ('20150107');

CREATE TABLE TiposDesp (
idTipo integer PRIMARY KEY,
Saúde varchar(50),
Eventual varchar(50),
Lazer varchar(50),
Fixa varchar(50),
Emergência varchar(50)
)

CREATE TABLE CaracteristicasInvest (
idCaracInvest integer PRIMARY KEY,
descricao varchar(50)
)

insert into CaracteristicasInvest values ('1', 'tipo rendimento mensal' );

--idTipoInvest 1 = rendimento mensal--

CREATE TABLE TipoInvest (
idTipoInvest integer PRIMARY KEY,
descricao varchar(50)
)

insert into tipoinvest values ('1', 'tipo poupança de investimento' );

--idTipoInvest 1 = Poupança--

CREATE TABLE Banco (
Nome varchar(20),
Agência integer,
idBanco integer PRIMARY KEY
)

insert into banco values ('Caixa Econômica', '27', 386);

CREATE TABLE Receitas (
idReceita integer PRIMARY KEY,
CEP integer,
Número integer,
Rua varchar(40),
Datarealizada date,
Dataprevista date,
Valorprevisto varchar(15),
Valorrealizado varchar(15)
)

insert into receitas values (1500,'91760490','45','Rua Cristóvão Colombo', 
'2015-01-05' , '2015-01-02' , '800' , '1500');

CREATE TABLE ModoDespesas (
contaCorrente varchar(30),
Dinheiro varchar(50),
Crédito varchar(50),
idModoDespesas integer PRIMARY KEY
)

insert into mododespesas ();

CREATE TABLE Despesas (
idDespesas integer PRIMARY KEY,
Valor varchar(10),
Data date
)

insert into despesas values (2,'800','2014-12-28');

CREATE TABLE Causa (
idDespesas integer,
CPF integer,
FOREIGN KEY(idDespesas) REFERENCES Despesas (idDespesas),
FOREIGN KEY(CPF) REFERENCES Pessoa (CPF)
)

insert into causa values (2,'1122334455');

CREATE TABLE contem (
númeroConta integer,
dataInicial integer,
FOREIGN KEY(númeroConta) REFERENCES Conta (númeroConta),
FOREIGN KEY(dataInicial) REFERENCES Saldo (dataInicial)
)

insert into contem values ('137652', '20150107');

CREATE TABLE dispoe (
idTipoInvest integer,
idTipoConta integer,
FOREIGN KEY(idTipoInvest) REFERENCES TipoInvest (idTipoInvest),
FOREIGN KEY(idTipoConta) REFERENCES TipoConta (idTipoConta)
)

insert into dispoe values ('1', '1');

CREATE TABLE origina (
idTipoInvest integer,
idCaracInvest integer,
FOREIGN KEY(idTipoInvest) REFERENCES TipoInvest (idTipoInvest),
FOREIGN KEY(idCaracInvest) REFERENCES CaracteristicasInvest (idCaracInvest)
)

insert into origina values ('1', '1');

CREATE TABLE usufrui (
CPF integer,
númeroConta integer,
FOREIGN KEY(CPF) REFERENCES Pessoa (CPF),
FOREIGN KEY(númeroConta) REFERENCES Conta (númeroConta)
)

insert into usufrui values ('1122334455', '137652');

CREATE TABLE AumentaSaldo (
idReceita integer,
númeroConta integer,
FOREIGN KEY(idReceita) REFERENCES Receitas (idReceita),
FOREIGN KEY(númeroConta) REFERENCES Conta (númeroConta)
)

insert into aumentasaldo values (1500 ,'137652');

CREATE TABLE DiminuiSaldo (
númeroConta integer,
idDespesas integer,
FOREIGN KEY(númeroConta) REFERENCES Conta (númeroConta),
FOREIGN KEY(idDespesas) REFERENCES Despesas (idDespesas)
)

insert into diminuisaldo values ('137652',2);

CREATE TABLE Tem (
idTipo integer,
idModoDespesas integer,
idDespesas integer,
PRIMARY KEY(idTipo,idModoDespesas,idDespesas)
)

ALTER TABLE Conta ADD FOREIGN KEY(idBanco) REFERENCES Banco (idBanco);
ALTER TABLE Pessoa ADD FOREIGN KEY(idReceita) REFERENCES Receitas (idReceita);

