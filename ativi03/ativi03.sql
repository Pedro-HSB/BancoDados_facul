CREATE DATABASE IF NOT EXISTS ativ01;

USE ativ01;

CREATE TABLE IF NOT EXISTS departamento (
 idDepto integer not null primary key,
 nomeDepto varchar(15) not null,
 gerente integer not null,
 divisao varchar(10) not null,
 local varchar(15) not null
);


CREATE TABLE IF NOT EXISTS empregado (
 IdEmpregado integer not null,
 NomeEmpregado varchar(20) not null,
 IdDepto integer not null,
 Cargo varchar(6) not null,
 Tempo_Emp integer null,
 Salario decimal(10,2) null,
 Comissao decimal(10,2) null,
 primary key (IdEmpregado)
);


insert into departamento (iddepto, nomedepto, gerente, divisao, local) values (1, 'RH', 1, 'Adm', 'Diadema');
insert into departamento (iddepto, nomedepto, gerente, divisao, local) values (2, 'C.Rec.', 3, 'Adm', 'Diadema');
insert into departamento (iddepto, nomedepto, gerente, divisao, local) values (3, 'CP', 2, 'Adm', 'Diadema');
insert into departamento (iddepto, nomedepto, gerente, divisao, local) values (4, 'Financeiro', 4, 'Fin', 'São Paulo');
insert into departamento (iddepto, nomedepto, gerente, divisao, local) values (5, 'TI', 5, 'Tec', 'São Paulo');
insert into departamento (iddepto, nomedepto, gerente, divisao, local) values (6, 'Vendas', 6, 'Ven', 'Rio de Janeiro');
insert into departamento (iddepto, nomedepto, gerente, divisao, local) values (7, 'Marketing', 7, 'Mkt', 'Rio de Janeiro');
insert into departamento (iddepto, nomedepto, gerente, divisao, local) values (8, 'Produção', 8, 'Prod', 'Belo Horizonte');




insert into empregado (idempregado, nomeempregado, iddepto, cargo, tempo_emp, salario, comissao) values (7, 'Lucas', 4, 'Prof', 3, 2200.00, 18);
insert into empregado (idempregado, nomeempregado, iddepto, cargo, tempo_emp, salario, comissao) values (8, 'Carla', 5, 'Aux.', 2, 1700.00, 10);
insert into empregado (idempregado, nomeempregado, iddepto, cargo, tempo_emp, salario, comissao) values (1, 'Marcos', 1, 'Prof', 10, 1800.00, 10);
insert into empregado (idempregado, nomeempregado, iddepto, cargo, tempo_emp, salario, comissao) values (2, 'Maria', 1, 'Aux.', 1, 1500.00, 10);
insert into empregado (idempregado, nomeempregado, iddepto, cargo, tempo_emp, salario, comissao) values (3, 'Juliana', 2, 'Aux.', 1, 1500.00, 10);
insert into empregado (idempregado, nomeempregado, iddepto, cargo, tempo_emp, salario, comissao) values (4, 'João', 2, 'Prof', 5, 2000.00, 15);
insert into empregado (idempregado, nomeempregado, iddepto, cargo, tempo_emp, salario, comissao) values (5, 'Ana', 2, 'Aux.', 2, 1600.00, 10);
insert into empregado (idempregado, nomeempregado, iddepto, cargo, tempo_emp, salario, comissao) values (6, 'Pedro', 3, 'Prof', 8, 1900.00, 12);



-- 33. Listar a coluna Divisao da tabela Departamento.

    SELECT Divisao FROM Departamento;

-- 34. Listar a coluna Divisao da tabela Departamento, porém mostre somente linhas distintas (sem repetição).

    SELECT DISTINCT Divisao FROM Departamento;

-- 36. 10 % a mais do Salario Salario * 1.1 ‘Salário Mais 10%’

    SELECT Salario*1.1 AS "Salário Mais 10%" FROM Empregado;

-- 36. 20 % a mais do Salario Salario * 1.2 ‘Salário Mais 20%’

    SELECT Salario*1.2 AS "Salário Mais 20%" FROM Empregado;

-- 36. 10 % a menos do Salario Salario * 0.9 ‘Salário Menos 10%’

    SELECT Salario*0.9 AS "Salário Menos 10%" FROM Empregado;

-- 36. 20 % a menos do Salario Salario * 0.8 ‘Salário Menos 20%’

    SELECT Salario*0.8 AS "Salário Menos 20%" FROM Empregado;

-- 37. lista salario total de empregados
    SELECT NomeEmpregado,(Salario + Comissao) AS "Salário Total"FROM Empregado;

-- 37. lista salario total anual de empregados

    SELECT NomeEmpregado,((Salario + Comissao) * 12) AS "Salário Total Anual"FROM Empregado;

-- 37. lista salario Desconto Imposto de Renda de empregados

    SELECT NomeEmpregado,((Salario + Comissao) * 0.05) AS "Valor Desconto Imposto de Renda"FROM Empregado;

-- 37. listar Valor Desconto Plano de Saúde de empregados

 SELECT NomeEmpregado,((Salario + Comissao) * 0.02) AS "Valor Desconto Plano de Saúde"FROM Empregado;

-- 37. listar Valor Desconto Alimentação de empregados

 SELECT NomeEmpregado,((Salario + Comissao) * 0.015) AS "Valor Desconto Alimentação"FROM Empregado;

-- 37. listar Salário Liquido  de empregados

 SELECT NomeEmpregado,((Salario + Comissao) - ((Salario + Comissao) * (0.05 + 0.02 + 0.015))) AS "Salário Liquido"FROM Empregado;

-- 37. listar Salário Diário de empregados

 SELECT NomeEmpregado,Salario / 30 AS 'Salário Diário'FROM Empregado;

-- 37. listar Salário por Hora

 SELECT NomeEmpregado,Salario / 30 / 8 AS 'Salário por Hora'FROM Empregado;

-- 37. listar Salário por Minuto

 SELECT NomeEmpregado,Salario / 30 / 8 / 60 AS 'Salário por Minuto'FROM Empregado;

-- 37. listar Salário por Segundo

 SELECT NomeEmpregado,Salario / 30 / 8 / 60 / 60 AS 'Salário por Segundo' FROM Empregado;