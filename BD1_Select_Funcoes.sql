-- Database: "selectFuncoes"

-- DROP DATABASE "selectFuncoes";


select 'Hello world '|| 5*5;
select 'Hello SENAC '||current_date;

select current_time;

select current_timestamp;


select current_date;

select extract(day from current_date)||'/'||
       extract(month from current_date)||'/'||
       extract(Year from current_date);

select To_char(current_date,'DD/MM/YYYY')
select To_char(current_date,'DD/month/YY')
       

select extract(month from current_date);



select extract(day from current_date);

select extract(Year from current_date);


select To_char(current_date,'DD/MM/YYYY')

select To_char(current_date,'day d ww ddd dd/MM/YYYY')
select extract(Hour from current_time);

select extract(minute from current_timestamp);
select session_user;

CREATE TABLE "public"."cidade" (
"codigo_cidade" SERIAL, 
"nome_cidade" VARCHAR(50), 
"codigo_subregiao" INTEGER, 
CONSTRAINT "cidade_pkey" PRIMARY KEY("codigo_cidade")
) WITH OIDS;


CREATE TABLE "public"."subregiao" (
"codigo_subregiao" SERIAL, 
"nome_subregiao" VARCHAR(50), 
"codigo_pais" INTEGER, 
CONSTRAINT "subregiao_pkey" PRIMARY KEY("codigo_subregiao")
) WITH OIDS;

CREATE TABLE "public"."pais" (
"codigo_pais" SERIAL, 
"nome_pais" VARCHAR(50), 
CONSTRAINT "pais_pkey" PRIMARY KEY("codigo_pais")
) WITH OIDS;


INSERT INTO pais (nome_pais) VALUES ('Brasil');
INSERT INTO pais (nome_pais) VALUES ('Argentina');
INSERT INTO pais (nome_pais) VALUES ('Estados Unidos');
INSERT INTO pais (nome_pais) VALUES ('Italia');
INSERT INTO pais (nome_pais) VALUES ('Franca');
INSERT INTO pais (nome_pais) VALUES ('Noruega');

INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES ( 'Parana', 1);
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES ( 'Sao Paulo', 1);
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES ( 'Rio Grande do Sul', 1);
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES ( 'Buenos Aires', 2);
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES ( 'Cordoba', 2);
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES ( 'California', 3);
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES ( 'Florida', 3);
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES ( 'Toscana', 4);
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES ( 'Lombardia', 4);
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES ( 'Aquitania', 5);
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES ( 'Borgonha', 5);
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES ( 'Calabria', 5);
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES ( 'Massachussetts', 3);
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES ( 'Chiapas', NULL);


select * from subregiao where oid = 67137
select * from pais where oid = 67136

INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES ('Curitiba', 1);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES ('Sao Paulo', 2);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES ('Guarulhos', 2);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES ('Buenos Aires', 4);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES ('La Plata', 4);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES ('Cordoba', 5);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES ('Los Angeles', 6);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES ('San Francisco', 6);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES ('Orlando', 7);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES ('Miami', 7);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES ('Siena', 8);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES ('Florenca', 8);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES ('Milao', 9);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES ('Yokohama', NULL);


select * from pais
select * from subregiao
select * from cidade

SELECT * FROM cidade CROSS JOIN subregiao 
--errado pois combida todos com todo

SELECT * FROM cidade CROSS JOIN subregiao 
         WHERE cidade.codigo_subregiao = subregiao.codigo_subregiao
         
SELECT * FROM cidade CROSS JOIN (subregiao CROSS JOIN pais)
--ERRADO Pois CRUZA TODOS COM TODOS

SELECT * FROM cidade, subregiao,pais
         where cidade.codigo_subregiao = subregiao.codigo_subregiao
         and   subregiao.codigo_pais = pais.codigo_pais

SELECT * FROM cidade INNER JOIN subregiao ON TRUE   

SELECT * FROM cidade INNER JOIN subregiao ON
cidade.codigo_subregiao = subregiao.codigo_subregiao

SELECT * FROM subregiao INNER JOIN cidade USING (codigo_subregiao)
SELECT * FROM subregiao  JOIN cidade USING (codigo_subregiao) 

SELECT * FROM subregiao  JOIN cidade USING (codigo_subregiao)
                         join pais using (codigo_pais) 


SELECT * FROM subregiao NATURAL INNER JOIN cidade 

SELECT * FROM subregiao NATURAL INNER JOIN cidade 
                        natural inner join Pais      

 SELECT * FROM subregiao NATURAL INNER JOIN cidade
          where nome_subregiao = 'California' 
          order by nome_cidade desc
 

 SELECT * FROM subregiao NATURAL JOIN cidade
          where nome_subregiao = 'California' 
          order by nome_cidade desc   

  
-- busca Subregiao (LEFT) que não tem cidades                                                                   
 SELECT * FROM subregiao LEFT OUTER JOIN cidade 
          USING (codigo_subregiao)

-- busca Cidades  (RIGHT) que não tem Subregiao
 SELECT * FROM subregiao right OUTER JOIN cidade 
          USING (codigo_subregiao)

--buscar paises e subregioes LIGADAS
select * from pais natural inner join subregiao 
select * from pais join subregiao using (codigo_pais)
select * from pais join subregiao on (pais.codigo_pais = subregiao.codigo_pais)
select * from pais, subregiao where (pais.codigo_pais = subregiao.codigo_pais)

--todos os paises (LEFT) independente se tem Subregiao
select * from pais left outer join subregiao using (codigo_pais)
--todos os subregioes (right) independente se ter pais
select * from pais right outer join subregiao using (codigo_pais)


--Busca todos paises e subregioes 
SELECT * FROM subregiao FULL OUTER JOIN pais USING (codigo_pais)


select count(*) from pais full outer join subregiao USING (codigo_pais)
                where nome_pais = 'Noruega'

select count(*) from pais LEFT outer join subregiao USING (codigo_pais)
                where nome_pais = 'Noruega'
                
select count(*) from pais  join subregiao USING (codigo_pais)
                where nome_pais = 'Noruega'                


SELECT nome_cidade, nome_subregiao FROM cidade INNER JOIN subregiao 
USING (codigo_subregiao) WHERE nome_subregiao = 'Toscana'


SELECT nome_cidade, nome_subregiao FROM cidade LEFT outer JOIN subregiao 
USING (codigo_subregiao) WHERE nome_subregiao = 'Toscana'
                         or nome_subregiao is NULL

