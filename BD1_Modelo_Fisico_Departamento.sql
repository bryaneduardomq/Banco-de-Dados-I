create table departamentos(
NomeDepto varchar(10), 
idDepto Integer Primary Key,
idGerente integer);


Create Table Empregados(
CPF varchar(14),
idEmpregado integer Primary Key,
nome varchar(50),
CNH integer,
rua Varchar(50),
numero varchar(10),
complemento varchar(15),
Bairro varchar(50),
cep Integer, 
celular varchar(15), 
idDeptoLOtado Integer references Departamentos(idDepto));

create table Projetos(
dataInicio date,
idProjeto integer primary Key,
NomedoProjeto varchar(50),
idCoordenador integer references 
                      empregados(idEmpregado)
);

create table participam(
datainicio date,
idprojeto integer references projetos,
idempregado integer references empregados(idempregado));



select * from empregados;

insert into empregados (cpf,idempregado,nome,iddeptolotado)
values ('88855533377',4,'FLAVIO',1);

insert into empregados (cpf,idempregados,nome,iddeptolotado) values ('11166749832',3,'Jair',2);

insert into empregados (cpf,idempregados,nome,iddeptolotado) values ('44499988821',5,'Jonas',3);

update empregados set idsupervisor = 2 where idempregados = 5;
update empregados set idsupervisor = 5 where idempregados = 1;
update empregados set idsupervisor = 3 where idempregados = 2;
update empregados set idsupervisor = 1 where idempregados = 4;


alter table empregados
	add column idsupervisor integer
		references empregados(idempregados);


select * from Departamentos;

insert into Departamentos
		(NomeDepto,idDepto) values ('engenharia',1)

insert into Departamentos
		(NomeDepto,idDepto) values ('TI',2),('RH',3);


insert into empregados (cpf, idempregados, nome, iddeptolotado) 
values ('11122233344',1,'Fabio Armani',2), ('33311133355',2,'Leonardo',1);

select nome, idempregados, idsupervisor from empregados

select e.idempregados, e.nome "nome empregado", e.idsupervisor, s.nome "supervisor" from empregados e, empregados s where e.idsupervisor = s.idempregados


create table cidades(
idcidade integer primary key,
municipio varchar(50));

create table distribuidores(
iddistribuidores integer primary key,
razaoSocial varchar(50));

create table Produtos(
idproduto integer primary key,
descição varchar(50));

create table distribuem(
dataContrato date,
idcidade integer references cidades(idcidade),
iddistribuidores integer references distribuidores(iddistribuidores),
idproduto integer references Produtos(idproduto),
primary key (idcidade, iddistribuidores, idproduto));

