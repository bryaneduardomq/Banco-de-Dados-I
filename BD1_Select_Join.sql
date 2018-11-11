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


select OID,nome_pais from pais

select * from pais
select * from subregiao
select * from cidade


SELECT * FROM cidade CROSS JOIN subregiao
---errado pois combina todos com todos

SELECT * FROM cidade CROSS JOIN subregiao 
	WHERE cidade.codigo_subregiao = subregiao.codigo_subregiao


SELECT * FROM cidade, subregiao, pais 
	where cidade.codigo_subregiao = subregiao.codigo_subregiao 
	and subregiao.codigo_pais = pais.codigo_pais

SELECT * FROM cidade CROSS JOIN (subregiao CROSS JOIN pais)

SELECT * FROM cidade CROSS JOIN subregiao

SELECT * FROM cidade INNER JOIN subregiao ON TRUE

SELECT * FROM cidade INNER JOIN subregiao ON
cidade.codigo_subregiao = subregiao.codigo_subregiao


SELECT * FROM subregiao INNER JOIN cidade USING (codigo_subregiao)


SELECT * FROM subregiao NATURAL INNER JOIN cidade natural inner join pais

SELECT * FROM subregiao NATURAL INNER JOIN cidade
where nome_subregiao = 'California' order by nome_cidade asc


--busca subregiao (left) que não tem cidade
select * from subregiao left outer join cidade using (codigo_subregiao)


--busca cidade (right) que não tem subregiao
select * from subregiao right outer join cidade using (codigo_subregiao)


--buscar paises e subregioes ligadas
SELECT * FROM pais NATURAL INNER JOIN subregiao
select * from pais join subregiao using (codigo_pais)
select * from pais join subregiao on (pais.codigo_pais = subregiao.codigo_subregiao)
select * from pais, subregiao where (pais.codigo_pais = subregiao.codigo_subregiao)


--todos os paises (LEFT) independente se tem subregiao
select * from pais left outer join subregiao using (codigo_pais)


--busca todos os paises e subregioes
select * from subregiao full outer join pais using (codigo_pais)


select count(*) from pais left outer join subregiao using (codigo_pais)
		where nome_pais = 'Brasil'










