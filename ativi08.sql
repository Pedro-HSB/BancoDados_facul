CREATE DATABASE IF NOT EXISTS ex0904;

USE ex0904;

DELIMITER //

CREATE FUNCTION f_MesExtenso (mes INT) 

RETURNS VARCHAR(20) DETERMINISTIC

BEGIN

    DECLARE mes_extenso VARCHAR(20);
    
    IF mes = 1 THEN
        SET mes_extenso = 'Janeiro';
    ELSEIF mes = 2 THEN
        SET mes_extenso = 'Fevereiro';
    ELSEIF mes = 3 THEN
        SET mes_extenso = 'Março';
    ELSEIF mes = 4 THEN
        SET mes_extenso = 'Abril';
    ELSEIF mes = 5 THEN
        SET mes_extenso = 'Maio';
    ELSEIF mes = 6 THEN
        SET mes_extenso = 'Junho';
    ELSEIF mes = 7 THEN
        SET mes_extenso = 'Julho';
    ELSEIF mes = 8 THEN
        SET mes_extenso = 'Agosto';
    ELSEIF mes = 9 THEN
        SET mes_extenso = 'Setembro';
    ELSEIF mes = 10 THEN
        SET mes_extenso = 'Outubro';
    ELSEIF mes = 11 THEN
        SET mes_extenso = 'Novembro';
    ELSEIF mes = 12 THEN
        SET mes_extenso = 'Dezembro';
    ELSE
        SET mes_extenso = 'Mês inválido';
    END IF;
    
    RETURN mes_extenso;

END //

DELIMITER ;

SELECT f_MesExtenso(2);



DELIMITER //

CREATE FUNCTION f_DiaSemanaExtenso (dia INT) 

RETURNS VARCHAR(20) DETERMINISTIC

BEGIN

    DECLARE Dia_Extenso VARCHAR(20);
    
    IF dia = 1 THEN
        SET Dia_Extenso = 'domigo';
    ELSEIF dia = 2 THEN
        SET Dia_Extenso = 'segunda';
    ELSEIF dia = 3 THEN
        SET Dia_Extenso = 'terca';
    ELSEIF dia = 4 THEN
        SET Dia_Extenso = 'quarta';
    ELSEIF dia = 5 THEN
        SET Dia_Extenso = 'quinta';
    ELSEIF dia = 6 THEN
        SET Dia_Extenso = 'sexta';
    ELSEIF dia = 7 THEN
        SET Dia_Extenso = 'sabado';
    ELSE
        SET Dia_Extenso = 'Dia Inválido!';
    END IF;
    
    RETURN Dia_Extenso;

END //

DELIMITER ;

SELECT f_DiaSemanaExtenso(3);


DELIMITER //

CREATE FUNCTION f_ParImpar  (numero INT) 

RETURNS VARCHAR(10) DETERMINISTIC

BEGIN

    DECLARE tipo VARCHAR(10);
    
    IF numero%2 = 0 THEN
        SET tipo = 'par';
    ELSE
        SET tipo = 'impar';
    END IF;
    
    RETURN tipo;

END //

DELIMITER ;

SELECT f_ParImpar(10);


DELIMITER //

CREATE FUNCTION f_Percentual(valor DECIMAL(10, 2), perc DECIMAL(5, 2))

RETURNS DECIMAL(10, 2)

DETERMINISTIC

BEGIN

    DECLARE valor_percentual DECIMAL(10, 2);
    
    SET valor_percentual = valor * (perc / 100);
    
    RETURN valor_percentual;
END //

DELIMITER ;

SELECT f_Percentual(100.45, 10.98) AS valor_percentual;


DELIMITER //

CREATE FUNCTION f_UltimoNome (nome varchar(200))

RETURNS varchar(200)

DETERMINISTIC

BEGIN

    DECLARE ultimo_nome VARCHAR(200);
    
    SET ultimo_nome = SUBSTRING_INDEX(nome, ' ', -1);
    
    RETURN ultimo_nome;
END //

DELIMITER ;

SELECT f_UltimoNome('João da Silva') AS ultimo_nome;
