-- Database: gravadora

-- DROP DATABASE gravadora;

create table cidades(
idcidade integer primary key,
nome varchar(50));

create table gravadoras(
idGravadora integer primary Key,
razaosocial varchar(100) not null, 
RuaAv varchar(100), 
num varchar(20),
complemento varchar(20),
idcidade integer references cidades(idCidade)); 


create table autores(
idautor integer primary Key, 
nome varchar(100) not null,
DataNascimento date,
cpf bigint,
ruaAv varchar(100),
num varchar(20),
complemento varchar(20));

create table Musicas(
idmusica integer primary Key,
titulo varchar(200) not null,
duracao integer,
ano smallint);

create Table escrevem(
idautor integer references autores,
idmusica integer references musicas)


create table cds(
idCD integer primary key,
titulo varchar(100),
ano smallint, 
banda varchar(100),
possui_idCd integer references cds(idcd),
idGravadora integer references gravadoras(idGravadora));

create table contem(
faixa integer,
idmusica integer references musicas,
idCD integer references Cds); 

select * from cds;
