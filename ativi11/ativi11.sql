
CREATE DATABASE IF NOT EXISTS ativ11;

USE ativ11;

CREATE TABLE Produto (
    IdProduto INT AUTO_INCREMENT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    QtdeProduto INT,
    PrecoUnitMinProduto DECIMAL(10,2),
    PrecoUnitMaxProduto DECIMAL(10,2)
);

CREATE TABLE Movimentacao (
    IdMovimentacao INT AUTO_INCREMENT PRIMARY KEY,
    IdProduto INT,
    Tipo CHAR(1),
    QtdeMov INT,
    PrecoUnitMov DECIMAL(10,2),
    FOREIGN KEY (IdProduto) REFERENCES Produto(IdProduto)
);


CREATE TABLE Log_Trigger (
    IdLog INT AUTO_INCREMENT PRIMARY KEY,
    NomeTrigger VARCHAR(100),
    Mensagem TEXT,
    DataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER //

CREATE TRIGGER tr_AtualizaEstoque_I AFTER INSERT ON Movimentacao
FOR EACH ROW
BEGIN
    IF NEW.Tipo = 'E' THEN
        UPDATE Produto SET QtdeProduto = QtdeProduto + NEW.QtdeMov WHERE IdProduto = NEW.IdProduto;
        
        
        INSERT INTO Log_Trigger (NomeTrigger, Mensagem) VALUES ('tr_AtualizaEstoque_I', 'Trigger acionada para inserção de nova movimentação (entrada).');
    ELSEIF NEW.Tipo = 'S' THEN
        UPDATE Produto SET QtdeProduto = QtdeProduto - NEW.QtdeMov WHERE IdProduto = NEW.IdProduto;
        
        
        INSERT INTO Log_Trigger (NomeTrigger, Mensagem) VALUES ('tr_AtualizaEstoque_I', 'Trigger acionada para inserção de nova movimentação (saída).');
    END IF;
END //

DELIMITER ;

DELIMITER //

ALTER TRIGGER tr_AtualizaEstoque_I AFTER INSERT ON Movimentacao
FOR EACH ROW
BEGIN
    IF NEW.PrecoUnitMov < (SELECT PrecoUnitMinProduto FROM Produto WHERE IdProduto = NEW.IdProduto) THEN
        UPDATE Produto SET PrecoUnitMinProduto = NEW.PrecoUnitMov WHERE IdProduto = NEW.IdProduto;
        
        
        INSERT INTO Log_Trigger (NomeTrigger, Mensagem) VALUES ('tr_AtualizaPrecoUnit_I', 'Trigger acionada para inserção de nova movimentação (atualização do preço mínimo).');
    ELSEIF NEW.PrecoUnitMov > (SELECT PrecoUnitMaxProduto FROM Produto WHERE IdProduto = NEW.IdProduto) THEN
        UPDATE Produto SET PrecoUnitMaxProduto = NEW.PrecoUnitMov WHERE IdProduto = NEW.IdProduto;
        
        
        INSERT INTO Log_Trigger (NomeTrigger, Mensagem) VALUES ('tr_AtualizaPrecoUnit_I', 'Trigger acionada para inserção de nova movimentação (atualização do preço máximo).');
    END IF;
END //
DELIMITER ;

DELIMITER //

CREATE TRIGGER tr_AtualizaEstoque_D AFTER DELETE ON Movimentacao
FOR EACH ROW
BEGIN
    IF OLD.Tipo = 'E' THEN
        UPDATE Produto SET QtdeProduto = QtdeProduto - OLD.QtdeMov WHERE IdProduto = OLD.IdProduto;
        
        INSERT INTO Log_Trigger (NomeTrigger, Mensagem) VALUES ('tr_AtualizaEstoque_D', 'Trigger acionada para exclusão de uma movimentação (entrada).');
    ELSEIF OLD.Tipo = 'S' THEN
        UPDATE Produto SET QtdeProduto = QtdeProduto + OLD.QtdeMov WHERE IdProduto = OLD.IdProduto;
        
        INSERT INTO Log_Trigger (NomeTrigger, Mensagem) VALUES ('tr_AtualizaEstoque_D', 'Trigger acionada para exclusão de uma movimentação (saída).');
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER tr_AtualizaEstoque_U AFTER UPDATE ON Movimentacao
FOR EACH ROW
BEGIN
    IF OLD.Tipo = 'E' THEN
        
        UPDATE Produto SET QtdeProduto = QtdeProduto - OLD.QtdeMov WHERE IdProduto = OLD.IdProduto;
    ELSEIF OLD.Tipo = 'S' THEN
        
        UPDATE Produto SET QtdeProduto = QtdeProduto + OLD.QtdeMov WHERE IdProduto = OLD.IdProduto;
    END IF;

    IF NEW.Tipo = 'E' THEN
        
        UPDATE Produto SET QtdeProduto = QtdeProduto + NEW.QtdeMov WHERE IdProduto = NEW.IdProduto;
    ELSEIF NEW.Tipo = 'S' THEN
        
        UPDATE Produto SET QtdeProduto = QtdeProduto - NEW.QtdeMov WHERE IdProduto = NEW.IdProduto;
    END IF;
END //

DELIMITER ;

INSERT INTO Produto (NomeProduto, QtdeProduto, PrecoUnitMinProduto, PrecoUnitMaxProduto)
VALUES 
('Produto A', 100, 10.00, 20.00),
('Produto B', 200, 15.00, 25.00),
('Produto C', 150, 12.00, 22.00),
('Produto D', 300, 18.00, 28.00),
('Produto E', 250, 11.00, 21.00),
('Produto F', 50, 8.00, 18.00),
('Produto G', 80, 12.00, 22.00),
('Produto H', 120, 15.00, 25.00),
('Produto I', 200, 20.00, 30.00);


INSERT INTO Movimentacao (IdProduto, Tipo, QtdeMov)
VALUES 
(1, 'E', 50),
(1, 'S', 30),
(2, 'E', 80),
(2, 'S', 60),
(3, 'E', 40),
(6, 'E', 20),
(7, 'E', 30),
(8, 'S', 40),
(9, 'S', 50);

