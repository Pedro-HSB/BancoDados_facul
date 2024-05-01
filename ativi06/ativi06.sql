--  Considere um sistema de gerenciamento de eventos, onde um evento pode ter vários participantes e cada participante pode estar em vários eventos. Cada participante tem um nome e um endereço de email.
-- Crie o modelo físico para representar o sistema de gerenciamento descrito acima.

CREATE TABLE Eventos (
    evento_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_evento VARCHAR(100),
    data_evento DATE,
    local_evento VARCHAR(100)
);

CREATE TABLE Participantes (
    participante_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_participante VARCHAR(100),
    email_participante VARCHAR(100)
);
CREATE TABLE Evento_Participante (
    evento_id INT,
    participante_id INT,
    PRIMARY KEY (evento_id, participante_id),
    FOREIGN KEY (evento_id) REFERENCES Eventos(evento_id),
    FOREIGN KEY (participante_id) REFERENCES Participantes(participante_id)
);



-- 68. Considere um sistema de gerenciamento de uma biblioteca. O sistema deve registrar informações sobre os livros, os autores e as editoras. Cada livro pode ter um ou mais autores, e cada autor pode ter escrito um ou mais livros. Cada livro é publicado por uma editora. Utilize o modelo ER (no pdf da atividade) para criar o modelo físico do banco de dados


CREATE TABLE Autores (
    autor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(255)
);

CREATE TABLE Editoras (
    editora_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_editora VARCHAR(255)
);

CREATE TABLE Livros (
    livro_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    ano_publicacao INT,
    editora_id INT,
    FOREIGN KEY (editora_id) REFERENCES Editoras(editora_id)
);

CREATE TABLE Livro_Autor (
    livro_id INT,
    autor_id INT,
    PRIMARY KEY (livro_id, autor_id),
    FOREIGN KEY (livro_id) REFERENCES Livros(livro_id),
    FOREIGN KEY (autor_id) REFERENCES Autores(autor_id)
);




