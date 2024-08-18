create table CALCULOS
(id integer not null,
NOME varchar(60),
salario NUMERIC(15,2) NOT NULL DEFAULT 0 CHECK (SALARIO > 0),
cargo varchar(20),
primary key (id));

insert into CALCULOS
VALUES (1,'Roberto',1000,'Gerente');

insert into CALCULOS
VALUES (5,'Roberto Carlos',1000,'Gerente');

insert into CALCULOS
VALUES (2,'Paula',2000,'Gerente');

insert into CALCULOS
VALUES (3,'Jorge',800,'Aux.Adm');

insert into CALCULOS
VALUES (4,'Julia',700,'Aux.Contabilidade');

insert into CALCULOS
VALUES (6,'Julia',720,'Aux.Adm');

update calculos set cargo ='Aux.Adm' where id=6;

insert into CALCULOS
VALUES (7,'JAIRO',3000,'Aux.Adm');

insert into CALCULOS
VALUES (8,'ADRIANA',3000,'Gerente');

Select * from Calculos

select nome, salario from calculos;

select nome as nome_funcionario from calculos;

select nome as "Nome Funcionario" from calculos;


select nome, salario+500 as Salario_Novo from calculos;

select nome, salario, salario+500 as Salario_Novo from calculos;

select nome, salario,salario*12 as "Salario Anual", 
        salario+500 as Salario_Novo, 
        (salario+500) * 12 as "Salario anual Novo" 
         from calculos;

select nome, salario, salario*12 as Salario_Anual  from calculos;

select nome, salario,
       salario*12+salario*0.33+salario   as Salario_Total_anual  
       from calculos;


/* Concatenação*/

select nome || cargo as "PessoaCargo" from calculos; 

select nome || ' ' ||cargo as "Pessoa Cargo" from calculos;

select nome || ' é ' || cargo || ' e ganha ' ||salario|| ' de salário'  as "Situação Pessoa" 
       from calculos 
       where cargo = 'Gerente'

select (nome, salario) from calculos;

select (nome, 'ganha'  ,salario) from calculos;


/* Seleção Condicional */


select * from calculos where nome ='RobeRTo';


select * from calculos where id = 1;


select * from calculos where upper(nome)='ROBERTO';

---função upper transforma pra maiúsculo---

-- o _ equivale a qualquer caracter no local

SELECT * FROM CALCULOS WHERE NOME LIKE 'Rob____'

-- o % equivale a qualquer caracter em qualquer quantidade
SELECT * FROM CALCULOS WHERE NOME LIKE 'Robe____C%',


SELECT * FROM CALCULOS WHERE NOME LIKE lower('%R%')


SELECT * FROM CALCULOS WHERE cargo = 'Gerente'and(NOME LIKE '%a'  or nome like 'R%');



/* Seleção Condicional */


Select * from calculos where salario < 1500 ;

Select * from calculos where salario >= '1000' 
                       and cargo = 'Gerente';

Select * from calculos where salario <= '0800';

Select * from calculos where salario <> '2000';  

Select * from calculos where salario <> '2000';


/* Seleção em Conjuntos */
 
Select nome, salario,cargo  from calculos where salario between 700 and 900;
Select nome, salario from calculos where salario between 750 and 1200;
Select nome, salario from calculos where salario in (700,800,2000);
Select nome, salario from calculos where salario in (750,800,1600);
Select nome, salario from calculos where salario not in (700,800,2000);


/* Classificar */ 

select * from calculos order by nome asc;

select * from calculos order by nome desc;

select nome,cargo from calculos order by cargo, nome;

select * from calculos order by nome asc, salario desc;

select * from calculos order by salario desc, cargo asc;

/* funções */

select sum(salario)from calculos;

select avg(salario)from calculos;

select cargo,sum(salario) from calculos group by cargo order by sum(salario) desc;

select max(salario), cargo , nome from calculos group by cargo, nome order by max(salario) desc;

select min(salario), cargo from calculos group by cargo order by min(salario) asc;


/* GROUP By*/
select max(salario), cargo from calculos 
                           group by cargo 
                           order by Max(salario) 
                           /* Cardinalidade (1:n) => (1:1)*/ 


select nome, max(salario) from calculos; /*erro não é possível */

select nome, max(salario) from calculos 
                          group by nome; /* Não é interesssante */

select nome from calculos where salario = max(salario); /*erro não é possível*/

select nome, salario,cargo from calculos 
       where salario = (select max(salario) from calculos); 




