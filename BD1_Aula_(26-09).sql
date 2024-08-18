
CREATE TABLE produtos1 (
cod_prod integer,
nome text,
preco numeric CHECK (preco > 0)
);

insert into produtos1 values (4,'Mouse',19);
insert into produtos1 values (2,'Mouse ps2',2);
insert into produtos1 values (3,'Mouse USB',-2);

select * from produtos1


drop table produtos1
CREATE TABLE produtos1 (
cod_prod integer,
nome text,
-- constraint pertmite dar um NOME para restrição
preco numeric CONSTRAINT chk_preco_positivo CHECK (preco > 0)
);

drop table produtos1;

CREATE TABLE produtos1 (
cod_prod integer,
nome text,
preco numeric CHECK (preco > 0),
preco_com_desconto numeric CHECK (preco_com_desconto > 0),
CHECK (preco > preco_com_desconto)
);
insert into produtos1 values 
            (1,'Mouse',19,9)
insert into produtos1 values 
            (2,'Mouse PS2',19,0)
insert into produtos1 values 
            (2,'Mouse PS2',9,19)
insert into produtos1 values 
            (2,'Mouse PS2',0,0)            
            select * from produtos1


drop table produtos1;

CREATE TABLE produtos1 (
cod_prod integer,
nome text,
preco numeric,
preco_com_desconto numeric,
CHECK (preco > 0),
CHECK (preco_com_desconto > 0),
CHECK (preco > preco_com_desconto)
);
drop table produtos1;
CREATE TABLE produtos1 (
cod_prod integer,
nome text,
preco numeric CHECK (preco > 0),
preco_com_desconto numeric,
CHECK (preco_com_desconto > 0 AND preco > preco_com_desconto)
);

drop table produtos1;

CREATE TABLE produtos1 (
cod_prod integer,
nome text,
preco numeric,
CHECK (preco > 0),
preco_com_desconto numeric,
CHECK (preco_com_desconto > 0),
-- constraint pertmite dar um NOME para restrição
CONSTRAINT chk_desconto_valido CHECK (preco > preco_com_desconto)
);
--NULL  /   NOT NULL
CREATE TABLE produtos2 (
cod_prod integer NOT NULL,
nome text NOT NULL,
preco numeric
);

insert into produtos2 values (NULL, Null, 0)
insert into produtos2 values (0, '', 0)
insert into produtos2 (cod_prod,preco) values (1,4)


select * from Produtos2
-- pode acumular restrições nas colunas
drop table produtos2; 
CREATE TABLE produtos2 (
cod_prod integer NOT NULL,
nome text NOT NULL,
preco numeric NOT NULL CHECK (preco > 0)
);

-- RESTRIÇÂO  NULL (permite o valor NULL) - não é Obrigatório

drop table produtos2; 

CREATE TABLE produtos2 (
cod_prod integer NULL,
nome text NULL,
preco numeric NULL
);

-- UNIQUE  restrição de UNICIDADE Não pode repetir
CREATE TABLE produtos3 (
cod_prod integer UNIQUE,
nome text,
preco numeric
);


quando escrita como restrição de coluna, e
CREATE TABLE produtos3 (
cod_prod integer,
nome text,
preco numeric,
UNIQUE (cod_prod)
);




-- UNIQUE composto só aceita uma combinação igual, mas permite outras combinações

CREATE TABLE produtos3 (
cod_prod integer,
nome text,
preco numeric,
UNIQUE (cod_prod,nome)
);

insert into produtos3 values (1,'Mouse',19);
-- só não aceita quando os dois forem iguais
insert into produtos3 values (1,'Mouse',19);
--Aceita quando um for diferente, mas somente uma vez
Insert Into produtos3 values (1,'Mouse Usb',19);
Insert Into produtos3 values (2,'Mouse Usb',19);
select * from produtos3

--UNIQUE INDIVIDUAL  só aceita um item de cada coluna
drop table Produtos3
CREATE TABLE produtos3 (
cod_prod integer UNIQUE,
nome text UNIQUE,
preco numeric
);
--ACEITA
insert into produtos3 values (1,'Mouse',19);

--Não aceita já existe cod_prod =1
insert into produtos3 values (1,'Mouse',19);
--Não aceita já existe cod_prod =1
Insert Into produtos3 values (1,'Mouse Usb',19);

--aceita
Insert Into produtos3 values (2,'Mouse Usb',19);

--Não aceita já existe cod_prod =1
Insert Into produtos3 values (1,'Mouse Usb',19);
--Não aceita já existe nome = 'Mouse'
Insert Into produtos3 values (3,'Mouse',19);

-- CONSTRAINT nomeia a RESTRIÇÃO
CREATE TABLE produtos (
cod_prod integer CONSTRAINT unq_cod_prod UNIQUE,
nome text,
preco numeric
);   


--PRIMARY KEY  será sempre UNIQUE E NOT NULL 
-- SOmente uma PK por tabela
CREATE TABLE produtos4 (
cod_prod integer PRIMARY KEY,
nome text,
preco numeric
);         
--não aceita insert sem PK
insert into produtos4 (nome,preco) values ('mouse', 19)
insert into produtos4  values (1,'mouse', 19)
insert into produtos4  values (2,'teclado', 25)

--Não aceita repetir PK
insert into produtos4  values (1,'mouse USB', 21)

--PK composta segue mesmas regras do UNIQUE composto
CREATE TABLE exemplo (
a integer,
b integer,
c integer,
PRIMARY KEY (a, c)
);

select cod_prod, nome "produto", preco "preço" from produtos4


--Chave Estrangeira (FK) se referencia a uma PK em outra tabela
CREATE TABLE pedidos (
cod_pedido integer PRIMARY KEY,
cod_prod integer REFERENCES produtos4 (cod_prod),
quantidade integer
);

select * from produtos4
select * from pedidos

insert into pedidos values (1,1,33)

insert into pedidos values (2,2,50)
--Não permite inclusão se não existir o cod_prod na tabela
-- Produtos4
insert into pedidos values (3,34,50)
--ERRO:  inserção ou atualização em tabela "pedidos" viola restrição de chave estrangeira "pedidos_cod_prod_fkey"
--DETAIL:  Chave (cod_prod)=(34) não está presente na tabela "produtos4".


CREATE TABLE produtos5 (
cod_prod integer PRIMARY KEY,
nome text,
preco numeric
);
CREATE TABLE pedidos5 (
cod_pedido integer PRIMARY KEY,
endereco_entrega text,
data_entrega date
);
drop table itens_pedidos
insert into pedidos5 values (1,'xyz','2016-09-26');
insert into pedidos5 values (2,'KLM','2016-09-26');
select * from pedidos5

CREATE TABLE itens_pedidos (
cod_prod integer REFERENCES produtos4,
cod_pedido integer REFERENCES pedidos5,
quantidade integer,
PRIMARY KEY (cod_prod, cod_pedido)
);
insert into itens_pedidos values (1,1,3);
insert into itens_pedidos values (2,1,1);
insert into itens_pedidos values (2,2,4);
--Não aceita 
insert into itens_pedidos values (2,2,5);

select * from produtos4

drop table Itens_pedidos
CREATE TABLE itens_pedidos (
cod_prod integer REFERENCES produtos4 ON DELETE RESTRICT,
cod_pedido integer REFERENCES pedidos5 ON DELETE CASCADE,
quantidade integer,
PRIMARY KEY (cod_prod, cod_pedido)
);
insert into itens_pedidos values (1,1,3);
insert into itens_pedidos values (2,1,1);
insert into itens_pedidos values (2,2,4);
select * from itens_pedidos
select * from produtos4

delete from produtos4 where cod_prod=1
--ERRO:  atualização ou exclusão em tabela "produtos4" viola restrição de chave estrangeira "pedidos_cod_prod_fkey" em "pedidos"
--DETAIL:  Chave (cod_prod)=(1) ainda é referenciada pela tabela "pedidos".


--********** Error **********

--ERRO: atualização ou exclusão em tabela "produtos4" viola restrição de chave estrangeira "pedidos_cod_prod_fkey" em "pedidos"
--SQL state: 23503
--Detail: Chave (cod_prod)=(1) ainda é referenciada pela tabela "pedidos".



Select * from pedidos5

-- Cascade Força a deleção dos Itens_pedidos ligados ao Pedido DELETADO
delete from pedidos5 where cod_pedido = 1

Select * from pedidos5
Select * from itens_pedidos 