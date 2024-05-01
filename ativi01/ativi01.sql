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



    -- Lista Nome e salário de todos os Empregados.
 
 
SELECT NomeEmpregado, Salario
FROM Empregado;

    -- Lista Nome e Local de todos os Departamentos.
 
 
SELECT nomeDepto, local
FROM departamento;

    -- Lista Nome, salário e comissão dos Empregados com salário maior que 1.800.
 
 
SELECT NomeEmpregado, Salario, Comissao
FROM Empregado
WHERE Salario > 1800;

    -- Lista Nome, divisão e Local dos Departamentos da divisão SUL.
 
 
SELECT nomeDepto, divisao, local
FROM departamento
WHERE divisao = 'SUL';

    -- Lista Nome, departamento, salario e cargo dos Empregados com cargo GER e salário menor que 2.000.
 
 
SELECT NomeEmpregado, departamento.nomeDepto, Salario, Cargo
FROM Empregado
INNER JOIN departamento ON Empregado.IdDepto = departamento.idDepto
WHERE Cargo = 'GER' AND Salario < 2000;

    -- Lista todos os dados dos Empregados com cargo ATEND ou salário entre 1.800 e 2.000.
 
 
SELECT *
FROM Empregado
WHERE Cargo = 'ATEND' OR (Salario BETWEEN 1800 AND 2000);

    -- Lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados.
 
 
SELECT NomeEmpregado, Salario, Comissao, (Salario + IFNULL(Comissao, 0)) AS Remuneracao_Total
FROM Empregado;

    -- Lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados com salário maior que 2.000 ou comissão maior que 700.
 
 
SELECT NomeEmpregado, Salario, Comissao, (Salario + IFNULL(Comissao, 0)) AS Remuneracao_Total
FROM Empregado
WHERE Salario > 2000 OR Comissao > 700;

    -- Lista Nome, Salário, comissão e remuneração total de todos os empregados com remuneração total menor que 1.800.
 
 
SELECT NomeEmpregado, Salario, Comissao, (Salario + IFNULL(Comissao, 0)) AS Remuneracao_Total
FROM Empregado
WHERE (Salario + IFNULL(Comissao, 0)) < 1800;

    -- Lista Nome e cargo dos Empregados que o nome comece com a letra D.
 
 
SELECT NomeEmpregado, Cargo
FROM Empregado
WHERE NomeEmpregado LIKE 'D%';

    -- Lista Nome e cargo dos Empregados que o nome tenha N como terceira letra.
 
 
SELECT NomeEmpregado, Cargo
FROM Empregado
WHERE NomeEmpregado LIKE '__N%';

    -- Lista Nome e cargo dos Empregados que o nome tenha N (maiúscula ou minúscula) como terceira letra.
 
 
SELECT NomeEmpregado, Cargo
FROM Empregado
WHERE NomeEmpregado LIKE '__[nN]%';
 
    -- Lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem alfabética de nome.
 
 
SELECT NomeEmpregado, Salario, Comissao, (Salario + IFNULL(Comissao, 0)) AS Remuneracao_Total
FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY NomeEmpregado;
    -- Lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem crescente de salário.
 
 
SELECT NomeEmpregado, Salario, Comissao, (Salario + IFNULL(Comissao, 0)) AS Remuneracao_Total
FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY Salario;
    -- Lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem decrescente de salário.
 
 
SELECT NomeEmpregado, Salario, Comissao, (Salario + IFNULL(Comissao, 0)) AS Remuneracao_Total
FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY Salario DESC;
    -- Lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem crescente de remuneração total.
 
 
SELECT NomeEmpregado, Salario, Comissao, (Salario + IFNULL(Comissao, 0)) AS Remuneracao_Total
FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY (Salario + IFNULL(Comissao, 0));
    -- Lista Nome, Salário, comissão e remuneração total de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem crescente de departamento e em cada departamento, em ordem decrescente de salário.
 
 
SELECT e.NomeEmpregado, e.Salario, e.Comissao, (e.Salario + IFNULL(e.Comissao, 0)) AS Remuneracao_Total
FROM Empregado e
INNER JOIN departamento d ON e.IdDepto = d.idDepto
WHERE e.Salario > 2000 OR e.Comissao > 800
ORDER BY d.nomeDepto, e.Salario DESC;
    -- Lista o maior salário, o menor salário e a média dos salários de todos os Empregados.
 
 
SELECT MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, AVG(Salario) AS Media_Salario
FROM Empregado;
    -- Lista o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados com cargo GER ou VENDAS.
 
 
SELECT MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, AVG(Salario) AS Media_Salario, COUNT(*) AS Quantidade
FROM Empregado
WHERE Cargo IN ('GER', 'VENDAS');
 
    -- Lista o cargo, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados para cada cargo.
 
 
SELECT Cargo, MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, AVG(Salario) AS Media_Salario, COUNT(*) AS Quantidade
FROM Empregado
GROUP BY Cargo;

    -- Lista o departamento, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados com salário maior que 1.400, apresentando somente departamentos que tenham pelo menos 3 empregados nessa condição.
 
SELECT IdDepto, MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, AVG(Salario) AS Media_Salario, COUNT(*) AS Quantidade
FROM Empregado
WHERE Salario > 1400
GROUP BY IdDepto
HAVING COUNT(*) >= 3;

    -- Lista o departamento, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados para cada departamento, considerando somente empregados com salário maior que 1.800.
 
 
SELECT IdDepto, MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, AVG(Salario) AS Media_Salario, COUNT(*) AS Quantidade
FROM Empregado
GROUP BY IdDepto;

    -- Lista o departamento, o cargo, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados para cada cargo dentro de cada departamento.
 
 
SELECT IdDepto, Cargo, MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, AVG(Salario) AS Media_Salario, COUNT(*) AS Quantidade
FROM Empregado
GROUP BY IdDepto, Cargo;

    -- Lista o departamento, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados, apresentando somente departamentos que tenham pelo menos 5 empregados.
 
 
 
SELECT IdDepto, MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, AVG(Salario) AS Media_Salario, COUNT(*) AS Quantidade
FROM Empregado
GROUP BY IdDepto
HAVING COUNT(*) >= 5;

    -- Lista o departamento, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados com salário maior que 1.400, apresentando somente departamentos que tenham pelo menos 3 empregados nessa condição.
 
 
SELECT d.nomeDepto AS Departamento, MAX(e.Salario) AS Maior_Salario, MIN(e.Salario) AS Menor_Salario, AVG(e.Salario) AS Media_Salario, COUNT(*) AS Quantidade
FROM Empregado e
INNER JOIN departamento d ON e.IdDepto = d.idDepto
WHERE e.Salario > 1400
GROUP BY d.nomeDepto
HAVING COUNT(*) >= 3;

    -- Lista todos os dados dos Empregados que não têm comissão (ausência de valor).
 
 
SELECT *
FROM Empregado
WHERE Comissao IS NULL;

    -- Lista nome e salário dos empregados com salário menor que a média dos salários.
 
 
SELECT NomeEmpregado, Salario
FROM Empregado
WHERE Salario < (SELECT AVG(Salario) FROM Empregado);

    -- Lista os códigos de departamento que tenham empregados com salário maior que a média de todos os salários (sem repetir códigos de departamento).
 
 
SELECT DISTINCT IdDepto
FROM Empregado
WHERE Salario > (SELECT AVG(Salario) FROM Empregado);

    -- Lista nome e salário dos empregados que tenham o menor salário em seu departamento.
 
 
SELECT NomeEmpregado, Salario
FROM Empregado e
WHERE Salario = (SELECT MIN(Salario) FROM Empregado WHERE IdDepto = e.IdDepto);
 

    -- Lista quantos empregados em cada departamento têm salário maior que a média de todos os salários.
 
 
SELECT IdDepto, COUNT(*) AS Quantidade
FROM Empregado
WHERE Salario > (SELECT AVG(Salario) FROM Empregado)
GROUP BY IdDepto;