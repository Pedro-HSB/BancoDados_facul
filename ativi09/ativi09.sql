-- drop database ativ09;


CREATE DATABASE IF NOT EXISTS ativ09;


use ativ09;


CREATE TABLE departamento (
    idDepto     INT AUTO_INCREMENT PRIMARY KEY,
    nomeDepto   VARCHAR(30),
    gerente     INT,
    divisao     VARCHAR(30),
    local       VARCHAR(30)
);


CREATE TABLE empregado (
    idEmpregado     INT AUTO_INCREMENT PRIMARY KEY,
    nomeEmpregado   VARCHAR(30),
    idDepto         INT,
    cargo           VARCHAR(30),
    tempo_emp       INT,
    salario         DECIMAL(10, 2),
    comissao        DECIMAL(10, 2),
    FOREIGN KEY (idDepto) REFERENCES departamento(idDepto)
);


INSERT INTO departamento (idDepto, nomeDepto, gerente, divisao, local)
VALUES
    (NULL, 'Vendas', 101, 'Vendas', 'São Paulo'),
    (NULL, 'RH', 102, 'Recursos Humanos', 'Rio de Janeiro'),
    (NULL, 'TI', 103, 'Tecnologia da Informação', 'Belo Horizonte'),
    (NULL, 'Financeiro', 104, 'Finanças', 'Brasília'),
    (NULL, 'Marketing', 105, 'Marketing', 'Salvador'),
    (NULL, 'Produção', 106, 'Produção', 'Curitiba'),
    (NULL, 'Logística', 107, 'Logística', 'Porto Alegre');


INSERT INTO empregado (idEmpregado, nomeEmpregado, idDepto, cargo, tempo_emp, salario, comissao)
VALUES
    (NULL, 'João Silva', 1, 'Vendedor', 3, 3000.00, 100.00),
    (NULL, 'Maria Santos', 1, 'Vendedor', 2, 2800.00, 80.00),
    (NULL, 'Pedro Oliveira', 2, 'Analista de RH', 5, 4000.00, NULL),
    (NULL, 'Ana Souza', 3, 'Desenvolvedor', 7, 5000.00, NULL),
    (NULL, 'Carlos Pereira', 4, 'Analista Financeiro', 4, 4500.00, NULL),
    (NULL, 'Juliana Costa', 5, 'Especialista de Marketing', 6, 6000.00, 200.00),
    (NULL, 'Rafael Santos', 6, 'Supervisor de Produção', 8, 5500.00, NULL);



DELIMITER //

CREATE PROCEDURE TotalDepartamento()
    BEGIN
        SELECT COUNT(idDepto) AS "TotalDepartamento" FROM departamento;
    END//

DELIMITER ;
CALL TotalDepartamento();



DELIMITER //

CREATE PROCEDURE TotalEmpregado()
    BEGIN
        SELECT COUNT(idEmpregado) AS "TotalEmpregado" FROM Empregado;
    END//

DELIMITER ;
CALL TotalEmpregado();

-- questao 82


DELIMITER //

CREATE PROCEDURE DepartamentoUpdate(idDepto int,nomeDepto VARCHAR(15),gerente  INT,divisao  VARCHAR(10),local     VARCHAR(15))
    BEGIN
         UPDATE departamento SET nomeDepto = nomeDepto, gerente = gerente, divisao = divisao, local = local  where idDepto = idDepto;
    END//

DELIMITER ;
CALL DepartamentoUpdate(1, 'Novo Nome', 201, 'Divisão', 'Localização');

-- questao 83


DELIMITER //

CREATE PROCEDURE DepartamentoDelete(IN idDepartamento INT)
BEGIN


    DELETE FROM empregado WHERE idDepto = idDepartamento;

    DELETE FROM departamento WHERE idDepto = idDepartamento;

    SELECT COUNT(idDepartamento) AS "TotalDepartamento" FROM departamento;

END //

DELIMITER ;


CALL DepartamentoDelete(1);

-- questao 84


    DELIMITER //

CREATE PROCEDURE EmpregadoInsert(idEmpregado int,nomeEmpregado VARCHAR(30),idDepto int,cargo VARCHAR(30),tempo_emp INT,salario DECIMAL(10,2),comissao DECIMAL(10,2))
    BEGIN
     INSERT INTO empregado (idEmpregado, nomeEmpregado, idDepto, cargo, tempo_emp, salario, comissao) 
     VALUES (idEmpregado,nomeEmpregado, idDepto, cargo, tempo_emp, salario, comissao);
      SELECT COUNT(idEmpregado) AS "TotalEmpregado" FROM Empregado;
    END//

DELIMITER ;
CALL EmpregadoInsert(10, 'Novo Empregado', 2, 'Novo Cargo', 1, 2500.00, 100.00);

-- questao 85


DELIMITER //
    
CREATE PROCEDURE EmpregadoUpdate(idEmpregado int,nomeEmpregado VARCHAR(30),idDepto int,cargo VARCHAR(30),tempo_emp INT,salario DECIMAL(10,2),comissao DECIMAL(10,2))
    BEGIN
    UPDATE empregado SET nomeEmpregado =  nomeEmpregado,idDepto = idDepto,cargo = cargo,tempo_emp = tempo_emp,salario = salario ,comissao = comissao;
    CALL TotalEmpregado();
    END//

DELIMITER ;
CALL EmpregadoUpdate(1, 'Novo Nome', 2, 'Novo Cargo', 2, 3000.00, 150.00);

-- questao 86


DELIMITER //

CREATE PROCEDURE EmpregadoDelete(idEmpre INT)
    BEGIN
    DELETE FROM empregado WHERE idEmpregado = idEmpre;
    CALL TotalEmpregado();
    END//

DELIMITER ;
CALL EmpregadoDelete(1);

-- questao 87


DELIMITER //
    
CREATE PROCEDURE EmpregadoSelect()
    BEGIN
     SELECT * FROM empregado;
    END//

DELIMITER ;
CALL EmpregadoSelect();

