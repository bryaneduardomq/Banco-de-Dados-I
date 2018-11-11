create table distribuidores(
idDistribuidor integer,
razaoSocial varchar(50)); 
insert into distribuidores values (1,'xyz Ltda',NULL,NULL,1);

select * from distribuidores

ALTER TABLE distribuidores 
            ADD COLUMN endereco VARCHAR(30);

ALTER TABLE fornecedores;
      RENAME COLUMN endereco TO ender;    

ALTER TABLE fornecedores
            RENAME TO fornecedores;  
select * from fornecedores; 

alter table fornecedores
add column cep char(9);

ALTER TABLE fornecedores
      ADD CONSTRAINT 
      cep_chk CHECK (char_length(cep) = 8);
      
update fornecedores set cep='90320072' where 
       idDistribuidor = 1

update fornecedores set cep='90320-072' where 
       idDistribuidor = 1

update fornecedores set cep='90320' where 
       idDistribuidor = 1

select character_length(Cep)from fornecedores

select * from fornecedores
insert into Fornecedores values (1,'xyz Ltda',NULL,NULL,1)

alter table fornecedores 
      add column kkk integer  NULL;
select * from fornecedores

alter table fornecedores 
      drop column kkk; 

       

alter table fornecedores 
      add column tipo integer  NULL;  

update  fornecedores set tipo = 1             
select * from fornecedores
--alterar coluna tipo para restrição NOT NULL
-- É necessário que todos os registros tenham
-- algum valor 
update  fornecedores set tipo = 1
 ALTER table fornecedores 
       alter column tipo SET NOT NULL
       
update  fornecedores set tipo = NULL; 
--ERRO:  valor nulo na coluna "tipo" viola a restrição não-nula
DETAIL:  Failing row contains (2, KLM, null, null, null, null, null).


--********** Error **********
insert into fornecedores values (2,'KLM')
--ERRO: valor nulo na coluna "tipo" viola a restrição não-nula
--SQL state: 23502
--Detail: Failing row contains (2, KLM, null, null, null, null, null).


insert into fornecedores 
   (idDistribuidor, razaosocial,tipo)
    values (2,'KLM',1)
--Query returned successfully: one row affected, 31 ms execution time.
select * from fornecedores
-- para adicionar Primary Key a coluna da tabela
-- NÃO pode ter valores repetidos nem valores NULL
alter table fornecedores 
    add constraint 
    PK primary Key (idDistribuidor)

create table Tipo(
idtipo integer primary key, 
descricao varchar (50) not null);

insert into tipo values (1,'Hortfrut'),
                        (2,'cereais'),
                        (3,'Conservas'),
                        (4,'Limpeza');
select * from tipo 
select * from fornecedores
update fornecedores set tipo = 2 
                    where iddistribuidor =2

ALTER TABLE fornecedores 
           ADD CONSTRAINT fk_tipo 
           FOREIGN KEY (tipo) 
           REFERENCES tipo(idtipo);

 select razaosocial, descricao 
           from fornecedores join tipo
                on tipo = idtipo
select * from fornecedores

insert into fornecedores 
      (iddistribuidor,ender,tipo,cep,razaosocial)
       values 
      (3,'rua dos patos',3,'90450099','industria tabajara')

insert into fornecedores 
      (iddistribuidor,ender,tipo,cep,razaosocial)
       values 
      (4,NULL,3,'90450099','Capivara SA')


insert into fornecedores 
      (iddistribuidor,tipo,cep,razaosocial)
       values 
      (5,3,'90450099','MS SA')

insert into fornecedores 
      (iddistribuidor,tipo,razaosocial)
       values 
      (6,4,'Oracle SA')      

 insert into fornecedores 
        values 
        (7,'apple sa','California','39848888',1);

 insert into fornecedores 
        values 
        (8,'Intel sa',null,null,3);




create table cidades(
idCidade serial primary Key,
Municipio varchar (50), 
UF char(2)); 

insert into cidades (municipio,UF) 
       values ('Porto Alegre','RS'),
              ('canoas','RS'),
              ('Gravataí','RS'); 
select * from cidades


drop table cidades
create table cidades(
Municipio varchar (50), 
UF char(2),
idCidade serial primary Key); 

insert into cidades  
       values ('Porto Alegre','RS'),
              ('canoas','RS'),
              ('Gravataí','RS'); 

insert into fornecedores values 
       (9,'AMD')      


       select * from fornecedores
       

--cuidado com a seleção do WHERE

delete from fornecedores where tipo =3  
               
delete from tipo where idtipo=3  on cascade 



create table distribuidores(
idDistribuidor integer,
razaoSocial varchar(50),
tipo integer references tipo(idtipo) on delete cascade);

drop table fornecedores 
 
insert into distribuidores values (1,'xyz Ltda',1),
                                  (2,'klm',2),
                                  (3,'Tabajara',2),
                                  (4,'capivara',2);

  select * from distribuidores
  select * from tipo 

  delete from tipo where idtipo =2
